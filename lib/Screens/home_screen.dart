import 'package:bus_schedule_app/components/constant.dart';
import 'package:bus_schedule_app/router/named_routes.dart';
import 'package:bus_schedule_app/services/utitly.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import "package:bus_schedule_app/models/busStops2.dart";
import 'package:custom_info_window/custom_info_window.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraPosition? _initialPosition;
  GoogleMapController? _mapController;
  String _username = "User"; // Default value

  String fromLocation = "Select From";
  int? fromLocatiomId;
  int favoriteCount = 0;
  int tripCount = 0;

  String fromAddress = "Mumbai, Maharashtra";
  String toLocation = "select Destination";
  int? toLocationId;
  String toAddress = "";
  bool isError = false;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  Map<String, dynamic> isMarkerSelected = {
    "isSelected": false,
    "title": "null"
  };

  Future<Position> getPosition() async {
    return UserLocation.position == null
        ? await UserLocation.getUserLocation()
        : UserLocation.position!;
  }

  Future<void> _determinePositionAndFixCamera() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        isError = true;
      });
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission if it was previously denied.
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // If permissions are denied forever, show a dialog with an option to open app settings.
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Permission Required"),
            content: const Text(
                "Location permissions are permanently denied. Please open settings and enable permissions to continue."),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  // Open the app settings so the user can enable the permission.
                  await Geolocator.openAppSettings();
                },
                child: const Text("Open Settings"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              ),
            ],
          );
        },
      );

      // After the dialog, check permissions again.
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location permissions are permanently denied.');
      }
    }
    Position position;
    if (permission == LocationPermission.whileInUse) {
      // Get the current position of the device.

      position = await getPosition();

      // Set the initial camera position to the user's current location.
      setState(() {
        isError = false;
        _initialPosition = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 12,
        );
      });
    } else {
      setState(() {
        isError = true;
      });
    }

    // Set the initial camera position to the user's current location.
  }

  Future<void> _updateFavoriteCount() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteBusStops =
        prefs.getStringList("favoriteBusStops") ?? [];

    setState(() {
      favoriteCount = favoriteBusStops.length;
    });
  }

  Future<void> _updateTripCount() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> trips = prefs.getStringList("trips") ?? [];

    setState(() {
      tripCount = trips.length;
    });
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? "User"; // Fallback to "User"
    });
  }

  @override
  void initState() {
    super.initState();
    if (UserLocation.position == null) {
      _determinePositionAndFixCamera();
    } else {
      setState(() {
        isError = false;
        _initialPosition = CameraPosition(
          target: LatLng(UserLocation.position!.latitude,
              UserLocation.position!.longitude),
          zoom: 12,
        );
      });
    }
    _loadUserData();
    _updateFavoriteCount();
    _updateTripCount();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTripCount();
    _updateFavoriteCount();
  }

  var _filteredBusStops = busStops;
  List<Map<String, dynamic>> _filterBusStops(String query) {
    final filtered = busStops.where((stop) {
      final name = stop["name"].toString().toLowerCase();

      if (fromLocatiomId == "" && stop["id"] == fromLocatiomId) {
        return false;
      }
      if (toLocationId == "" && stop["id"] == toLocationId) {
        return false;
      }

      return name.contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredBusStops = query.isEmpty
          ? busStops.where((stop) {
              if (fromLocatiomId != null && stop["id"] == fromLocatiomId) {
                return false;
              }
              if (toLocationId != null && stop["id"] == toLocationId) {
                return false;
              }
              return true;
            }).toList()
          : filtered;
    });

    return _filteredBusStops;
  }

  void _showLocationPicker(bool isFrom) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      builder: (context) {
        List<Map<String, dynamic>> localFilteredBusStops =
            List.from(_filteredBusStops);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setModalState(() {
                          localFilteredBusStops = _filterBusStops(value);
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search stop name...',
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: localFilteredBusStops.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            setState(() {
                              if (isFrom) {
                                fromLocation =
                                    localFilteredBusStops[index]["name"]!;
                                fromAddress = "";
                                fromLocatiomId =
                                    localFilteredBusStops[index]["id"];
                              } else {
                                toLocation =
                                    localFilteredBusStops[index]["name"]!;
                                toAddress = "";
                                toLocationId =
                                    localFilteredBusStops[index]["id"];
                              }
                            });
                            Navigator.pop(context);
                          },
                          title: Text(
                            localFilteredBusStops[index]["name"]!,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: const Text(""),
                          leading: const Icon(Icons.location_on_outlined),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      setState(() {
        _filteredBusStops = _filterBusStops("");
      });
    });
  }

  Widget _buildLocationContainer({
    required String title,
    required String location,
    required String address,
    required bool isFrom,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () => _showLocationPicker(isFrom),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    isFrom ? Icons.circle_outlined : Icons.location_on_outlined,
                    color: MyColors.ourPrimary,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          address,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    bool isAnimated = false,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate a scaling factor based on the screen width.
        // You can adjust the base width as needed.
        final double screenWidth = MediaQuery.of(context).size.width;
        final double scaleFactor = screenWidth / 375.0;

        return Row(
          children: [
            Container(
              padding: EdgeInsets.all(8 * scaleFactor),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: isAnimated
                  ? TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(seconds: 1),
                      builder: (context, double animValue, child) {
                        return Transform.scale(
                          scale: (0.8 + (animValue * 0.2)) * scaleFactor,
                          child: Icon(
                            icon,
                            color: iconColor,
                            size: 24 * scaleFactor,
                          ),
                        );
                      },
                    )
                  : Icon(
                      icon,
                      color: iconColor,
                      size: 24 * scaleFactor,
                    ),
            ),
            SizedBox(width: 12 * scaleFactor),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 18 * scaleFactor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12 * scaleFactor,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildCustomInfoWindow(String title) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Handle the "View" action here.
              // For example, navigate to a details screen.
              debugPrint("View button pressed for $title");
            },
            child: const Text("View"),
          ),
        ],
      ),
    );
  }

  Set<Marker> markers() {
    Set<Marker> mark = {};
    for (int i = 0; i < busStops.length; i++) {
      mark.add(Marker(
        markerId: MarkerId(busStops[i]['name']),
        position: LatLng(busStops[i]['lat'], busStops[i]['lng']),
        onTap: () {
          setState(() {
            isMarkerSelected["isSelected"] = true;
            isMarkerSelected['id'] = busStops[i]['id'];
            isMarkerSelected["title"] = busStops[i]['name'];
          });
          // When a marker is tapped, show the custom info window.
        },
        icon: UserLocation.customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ));
    }

    return mark;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColors.projectBg,
      body: Stack(
        children: [
          // Top part: Map container (flex: 2)
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: isError
                  ? TextButton(
                      onPressed: () async {
                        // Open the app settings so the user can enable the permission.
                        await Geolocator.openAppSettings();
                        Position position;
                        var permission = await Geolocator.checkPermission();
                        if (permission == LocationPermission.whileInUse) {
                          // Get the current position of the device.

                          position =
                              UserLocation.position ?? await getPosition();

                          // Set the initial camera position to the user's current location.
                          setState(() {
                            isError = false;
                            _initialPosition = CameraPosition(
                              target:
                                  LatLng(position.latitude, position.longitude),
                              zoom: 12,
                            );
                          });
                        } else {
                          setState(() {
                            isError = true;
                          });
                        }
                      },
                      child: const Text("Open Settings"),
                    )
                  : _initialPosition == null
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                          width: double.infinity,
                          color: MyColors.projectBg,
                          child: Stack(
                            children: [
                              GoogleMap(
                                initialCameraPosition: _initialPosition!,
                                markers: markers(),
                                onMapCreated:
                                    (GoogleMapController controller) {},
                                onCameraMove: (position) {
                                  // setState(() {
                                  //   isMarkerSelected["isSelected"] = false;
                                  // });
                                },
                                onTap: (position) {
                                  setState(() {
                                    isMarkerSelected["isSelected"] = false;
                                  });
                                },
                                // Additional settings…
                              ),
                              // Place the custom info window in the top-left corner.
                              isMarkerSelected['isSelected']
                                  ? Positioned(
                                      top: 20,
                                      left: 20,
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          maxWidth: 200,
                                          minWidth: 150,
                                          maxHeight: 80,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2)),
                                            ],
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8),
                                                  child: Text(
                                                    isMarkerSelected['title'],
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.grey[800],
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                              Material(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  onTap: () {
                                                    GoRouter.of(context)
                                                        .pushNamed(
                                                            UserRoutes
                                                                .busStopDetails,
                                                            extra: [
                                                          isMarkerSelected[
                                                              'id'],
                                                          null
                                                        ]);
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12,
                                                        vertical: 6),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: const Text("view"),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        )),

          // Bottom part: Content container (flex: 3)

          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 0.55,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: MyColors.appBg,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10),
                              child: Text(
                                "Welcome! $_username 👋🏻",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(left: 10.0, bottom: 2),
                            //   child: Row(
                            //     children: [
                            //       Text(
                            //         "User name",
                            //         style: GoogleFonts.poppins(
                            //           fontSize: 10,
                            //           fontWeight: FontWeight.w800,
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //       Text(
                            //         "👋🏻 ",
                            //         style: GoogleFonts.poppins(
                            //           fontSize: 28,
                            //           fontWeight: FontWeight.w800,
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Location container
                            Container(
                              height: height * 0.35,
                              decoration: BoxDecoration(
                                color: MyColors.lightPurp,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildLocationContainer(
                                    title: "FROM",
                                    location: fromLocation,
                                    address: fromAddress,
                                    isFrom: true,
                                  ),
                                  SizedBox(height: height * 0.02),
                                  _buildLocationContainer(
                                    title: "TO",
                                    location: toLocation,
                                    address: toAddress,
                                    isFrom: false,
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (fromLocatiomId == "" ||
                                            toLocationId == "") {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "Please select both locations"),
                                              backgroundColor:
                                                  MyColors.primaryColor,
                                            ),
                                          );
                                          return;
                                        } else {
                                          GoRouter.of(context).pushNamed(
                                              UserRoutes.busStopDetails,
                                              extra: [
                                                fromLocatiomId,
                                                toLocationId
                                              ]);
                                        }
                                        // Add your onTap functionality here.
                                      },
                                      child: Container(
                                        height: height * 0.06,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: MyColors.ourPrimary,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Show Buses",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Stats container
                            Container(
                              height: height * 0.085,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () => GoRouter.of(context).pushNamed(UserRoutes.favoriteBusStops),
                                    child: _buildStatItem(
                                      icon: Icons.favorite,
                                      iconColor: Colors.red,
                                      label: "Favorite Stops",
                                      value: "$favoriteCount",
                                      isAnimated: true,
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Colors.grey[300],
                                    thickness: 1,
                                  ),
                                  GestureDetector(
                                    onTap: () => GoRouter.of(context).pushNamed(UserRoutes.recentTrips),
                                    child: _buildStatItem(
                                      icon: Icons.history,
                                      iconColor: MyColors.ourPrimary,
                                      label: "Recent Trips",
                                      value: "$tripCount",
                                      isAnimated: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Positioned(
                        top: height * 0.17,
                        left: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              final tempLoc = fromLocation;
                              final tempAddr = fromAddress;
                              final tempId = fromLocatiomId;
                              fromLocatiomId = toLocationId;
                              toLocationId = tempId;
                              fromLocation = toLocation;
                              fromAddress = toAddress;
                              toLocation = tempLoc;
                              toAddress = tempAddr;
                            });
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.swap_vert_rounded,
                              color: MyColors.ourPrimary,
                              size: 38,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
