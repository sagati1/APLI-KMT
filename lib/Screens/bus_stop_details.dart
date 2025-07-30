import 'dart:convert';
import 'package:bus_schedule_app/models/busStops2.dart';
import 'package:bus_schedule_app/services/utitly.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart' hide Marker;
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bus_schedule_app/widgets/app_bar.dart';
import '../components/constant.dart';

class BusStopDetails extends StatefulWidget {
  int? id;
  int? id2;
  BusStopDetails({super.key, required this.id, required this.id2});

  @override
  State<BusStopDetails> createState() =>
      _BusStopDetailsState(id: id!, id2: id2);
}

class _BusStopDetailsState extends State<BusStopDetails>
    with TickerProviderStateMixin {
  int? id;
  int? id2;
  _BusStopDetailsState({required this.id, required this.id2});
  late AnimationController _scaleController;
  bool isFavorite = false;
  bool isAnimating = false;
  CameraPosition? _initialPosition;
  bool isError = false;

  Future<void> _determinePositionAndFixCamera() async {
    await UserLocation.initializeMarkers();
    setState(() {
      var stop = busStops.firstWhere((stop) => stop['id'] == id);
      isError = false;
      _initialPosition = CameraPosition(
        target: LatLng(stop['lat'], stop['long']),
        zoom: 15,
      );
    });
  }

  Future<Position> getPosition() async {
    return UserLocation.position == null
        ? await UserLocation.getUserLocation()
        : UserLocation.position!;
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteBusStops =
        prefs.getStringList("favoriteBusStops") ?? [];
    setState(() {
      isFavorite = favoriteBusStops.contains(id.toString());
    });
  }

 

Future<bool> _isTripSaved() async {
  if (selectedBusData == null) return false;
  
  final prefs = await SharedPreferences.getInstance();
  List<String> trips = prefs.getStringList("trips") ?? [];
  
  String toStopId = id2?.toString() ?? selectedBusData["inbetweenStops"].last["id"].toString();
  
  return trips.any((tripJson) {
    final trip = jsonDecode(tripJson);
    return trip["fromStopId"] == id.toString() && 
           trip["toStopId"] == toStopId &&
           trip["busNumber"] == selectedBusData?["busNumber"];
  });
}
  Set<Polyline> _createPolylines(busData) {
    Set<Polyline> polylines = {};
    if (busData == null || busData.isEmpty) {
      return polylines;
    }
    var startStop =
        busStops.firstWhere((stop) => stop['id'] == busData[0]['id']);

    for (var bus in busData) {
      var currentStop = busStops.firstWhere((stop) => stop['id'] == bus['id']);
      polylines.add(Polyline(
        polylineId: PolylineId(bus['id'].toString()),
        points: [
          LatLng(startStop['lat'], startStop['lng']),
          LatLng(currentStop['lat'], currentStop["lng"])
        ],
        color: Colors.blue,
        width: 5,
      ));
      startStop = currentStop;
    }

    return polylines;
  }

  Set<Marker> markers(busData) {
    if (busData == null || busData.isEmpty) {
      var data = busStops.firstWhere((stop) => stop['id'] == id);

      var data2 = busStops.firstWhere(
        (stop) => stop['id'] == id2,
        orElse: () => <String, dynamic>{},
      );
      return id2 == null
          ? {
              Marker(
                  markerId: const MarkerId("1"),
                  position: LatLng(data['lat'], data['lng']),
                  icon: UserLocation.customMarkerIcon!,
                  infoWindow:
                      InfoWindow(title: data['name'], snippet: "Current Stop")),
            }
          : {
              Marker(
                  markerId: const MarkerId("1"),
                  position: LatLng(data['lat'], data['lng']),
                  icon: UserLocation.customMarkerIcon!,
                  infoWindow:
                      InfoWindow(title: data['name'], snippet: "Start Stop")),
              Marker(
                  markerId: const MarkerId("1"),
                  position: LatLng(data2['lat'], data2['lng']),
                  icon: UserLocation.customMarkerIcon!,
                  infoWindow: InfoWindow(
                      title: data2['name'], snippet: "Destination Stop"))
            };
    }

    Set<Marker> data = {};

    for (var bus in busData) {
      var stopData = busStops.firstWhere((stop) => stop['id'] == bus['id']);

      data.add(Marker(
          markerId: MarkerId(stopData['id'].toString()),
          position: LatLng(stopData['lat'], stopData['lng']),
          infoWindow: InfoWindow(
            title: stopData['name'],
            snippet: stopData['id'] == id && id2 == null
                ? "Current Stop "
                : stopData["id"] == id
                    ? "Start Stop"
                    : stopData['id'] == id2
                        ? "Destination Stop"
                        : "" + bus['arrivalTime'],
          ),
          icon: stopData["id"] == id || stopData["id"] == id2
              ? UserLocation.customMarkerIcon!
              : UserLocation.yelloPin!));
    }
    return data;
    // busData.map((bus, index) {
    //   var stopData = busStops
    //       .firstWhere((stop) => stop['id'] == bus['inbetweenStops'][0]['id']);

    //   data.add(Marker(
    //     markerId: MarkerId(stopData['id'].toString()),
    //     position: LatLng(stopData['lat'], stopData['long']),
    //     infoWindow: InfoWindow(
    //       title: stopData['name'],
    //       snippet: bus['arrivalTime'],
    //     ),
    //     icon: bus["id"] == id
    //         ? UserLocation.customMarkerIcon!
    //         : UserLocation.yelloPin!,
    //   ));
    // });
    // return data;
  }

  var currentStopLat;
  var currentStopLong;
  var currentStopName;
  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    if (UserLocation.position == null) {
      _determinePositionAndFixCamera();
    } else {
      var stop = busStops.firstWhere((stop) => stop['id'] == id);
      _initialPosition = CameraPosition(
        target: LatLng(stop['lat'], stop['lng']),
        zoom: 15,
      );
    }
    currentStopLat = busStops.firstWhere((stop) => stop['id'] == id)['lat'];
    currentStopLong = busStops.firstWhere((stop) => stop['id'] == id)['lng'];
    currentStopName = busStops.firstWhere((stop) => stop['id'] == id)['name'];

    busRoutes = getAllTheBusesGoingFromThisStop();
    if (busRoutes.isNotEmpty) {
      selectedBusData = busRoutes[0];
    }
    _loadFavoriteStatus();
  }


String? getDestinationName() {
  if (selectedBusData == null) return null;
  
  if (id2 != null) {
    return getBusStopName(id2);
  }
  
  String routeName = selectedBusData["name"] ?? "";
  if (routeName.contains("to")) {
    List<String> parts = routeName.split("to");
    if (parts.length > 1) {
      return parts[1].trim();
    }
  }
  
  if (selectedBusData["inbetweenStops"] != null && 
      selectedBusData["inbetweenStops"].isNotEmpty) {
    var lastStop = selectedBusData["inbetweenStops"].last;
    return getBusStopName(lastStop["id"]);
  }
  
  return "Unknown destination";
}
  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  String getBusStopName(busStopId) {
    return busStops.firstWhere((stop) => stop['id'] == busStopId)['name'];
  }

  List<Map<String, dynamic>> getAllTheBusesGoingFromThisStop() {
    List<Map<String, dynamic>> data = [];

    if (id2 != null) {
      for (var bus in buses) {
        var startFound = false;
        bus['inbetweenStops'].forEach((stop) {
          if (stop['id'] == id) {
            startFound = true;
          }
          if (startFound) {
            if (stop['id'] == id2) {
              data.add(bus);
            }
          }
        });
      }
      return data;
    }
    for (var bus in buses) {
      bus['inbetweenStops'].forEach((stop) {
        if (stop['id'] == id) {
          data.add(bus);
        }
      });
    }
    print(data);
    return data;
  }

  List<Map<String, dynamic>> busRoutes = [];

  void _showLocationPicker(bool isFrom) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFrom
            ? 'Select starting location'
            : 'Select destination location'),
      ),
    );
  }

  Widget _buildLocationContainer({
    required String title,
    required String location,
    required String address,
    required bool isFrom,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => _showLocationPicker(isFrom),
            child: Container(
              padding: const EdgeInsets.all(16),
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
                        const SizedBox(height: 4),
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

  var selectedBusData;
  void _showBusDetailModal(Map<String, dynamic> route) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final modalHeight = MediaQuery.of(context).size.height * 0.75;
        return Center(
          child: Container(
            height: modalHeight,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: modalHeight * 0.30,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Lottie.asset(
                    "assets/Lotty/bus4.json",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                // Details section (remaining space)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // From and To information, with optional "via"
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getBusStopName(route["inbetweenStops"][0]
                                              ['id']) ??
                                          '',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    if (route.containsKey('via') &&
                                        (route['via'] as String).isNotEmpty)
                                      Row(
                                        children: [
                                          const Icon(Icons.trip_origin,
                                              color: MyColors.ourPrimary,
                                              size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            route['via'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.arrow_forward,
                                  color: Colors.grey),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      getBusStopName(route["inbetweenStops"][
                                              route['inbetweenStops'].length -
                                                  1]['id']) ??
                                          '',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildTimeWidget(
                                icon: Icons.access_time,
                                label: 'Arrival',
                                time: route['inbetweenStops'][0]['arrivalTime'],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Bus Stops',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[200]!),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: RawScrollbar(
                              thumbColor: MyColors.ourPrimary.withOpacity(0.6),
                              radius: const Radius.circular(20),
                              thickness: 5,
                              child: ListView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                children:
                                    _buildBusStopsList(route['inbetweenStops']),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: FutureBuilder<bool>(
                              future: _isTripSaved(),
                              builder: (context, snapshot) {
                                final bool isSaved = snapshot.data ?? false;
                                
                                return ElevatedButton.icon(
                                  onPressed: () async {
                                    final prefs = await SharedPreferences.getInstance();
                                    List<String> trips = prefs.getStringList("trips") ?? [];
                                    
                                    if (isSaved) {
                                      // Remove the trip
                                      trips.removeWhere((tripJson) {
                                        final trip = jsonDecode(tripJson);
                                        return trip["fromStopId"] == id.toString() && 
                                              trip["toStopId"] == id2?.toString() &&
                                              trip["busNumber"] == selectedBusData?["busNumber"];
                                      });
                                      
                                      await prefs.setStringList("trips", trips);
                                      
                                      // Show removal confirmation
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Trip removed from history'),
                                          backgroundColor: Colors.redAccent,
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      // Add new trip
                                      final fromStopName = getBusStopName(id);
                                      final toStopName = id2 != null ? getBusStopName(id2) : null;
                                      
                                      final tripDetails = jsonEncode({
                                        "id": DateTime.now().millisecondsSinceEpoch.toString(),
                                        "fromStopId": id.toString(),
                                        "fromStopName": fromStopName,
                                        "toStopId": id2?.toString() ?? selectedBusData["inbetweenStops"].last["id"].toString(),
                                        "toStopName": getDestinationName(),
                                        "busNumber": selectedBusData?["busNumber"] ?? "",
                                        "busName": selectedBusData?["name"] ?? "",
                                        "arrivalTime": selectedBusData != null ? busArrivalTime() : "",
                                        "timeAdded": DateTime.now().toIso8601String(),
                                        "inbetweenStops": selectedBusData != null
                                            ? jsonEncode(selectedBusData["inbetweenStops"])
                                            : "[]"
                                      });

                                      trips.add(tripDetails);
                                      await prefs.setStringList("trips", trips);

                                      // Show confirmation
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Trip added to your history!'),
                                          backgroundColor: Colors.green,
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    isSaved ? Icons.remove_circle : Icons.directions_bus, 
                                    color: Colors.white
                                  ),
                                  label: Text(
                                    isSaved ? 'Remove Trip' : 'Add Trip',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isSaved ? Colors.redAccent : MyColors.ourPrimary,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30, 
                                      vertical: 15
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimeWidget({
    required IconData icon,
    required String label,
    required String time,
  }) {
    return Column(
      children: [
        Icon(icon, color: MyColors.ourPrimary, size: 20),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildBusStopsList(List<dynamic> busStops) {
    if (busStops.isEmpty) {
      return [
        Center(
          child: Text(
            'No bus stops available',
            style: GoogleFonts.poppins(fontSize: 14),
          ),
        )
      ];
    }

    return busStops.asMap().entries.map<Widget>((entry) {
      print(entry.value);
      print("see this");
      final stop = entry.value;
      final isLastStop = entry.key == busStops.length - 1;

      return Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns items at the top
                children: [
                  Icon(Icons.stop_circle,
                      color: stop['id'] == id || stop['id'] == id2
                          ? MyColors.primaryColor
                          : MyColors.ourPrimary,
                      size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      getBusStopName(stop['id']) ?? '',
                      style: GoogleFonts.poppins(fontSize: 14),
                      softWrap: true,
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        stop['arrivalTime'] ?? '',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          if (!isLastStop)
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Container(
                width: 2,
                height: 16,
                color: MyColors.ourPrimary.withOpacity(0.3),
              ),
            ),
        ],
      );
    }).toList();
  }

  Widget _buildBusRouteCard(Map<String, dynamic> route, double screenHeight) {
    var startName = getBusStopName(route['inbetweenStops'][0]['id']);
    var endName = getBusStopName(
        route['inbetweenStops'][route['inbetweenStops'].length - 1]['id']);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBusData = route;
        });
        // _showBusDetailModal(route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: selectedBusData["id"] == route['id']
              ? BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyColors.appBg, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                )
              : BoxDecoration(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$startName - $endName",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            color: Colors.grey, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          route['inbetweenStops'][0]['arrivalTime'],
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  _showBusDetailModal(route);
                },
                icon: const Icon(
                  Icons.directions_bus,
                  color: MyColors.ourPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String busArrivalTime() {
    var busData = selectedBusData['inbetweenStops'];
    var arrivalTime =
        busData.firstWhere((stop) => stop['id'] == id)['arrivalTime'];
    return arrivalTime;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
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
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Stack(
                          children: [
                            GoogleMap(
                              initialCameraPosition: _initialPosition!,
                              markers: markers(selectedBusData == null
                                  ? []
                                  : selectedBusData['inbetweenStops']),
                              polylines: _createPolylines(
                                  selectedBusData == null
                                      ? []
                                      : selectedBusData['inbetweenStops']),
                              onMapCreated: (GoogleMapController controller) {},
                              onCameraMove: (position) {
                                // setState(() {
                                //   isMarkerSelected["isSelected"] = false;
                                // });
                              },
                              onTap: (position) {
                                // setState(() {
                                //   isMarkerSelected["isSelected"] = false;
                                // });
                              },
                              // Additional settings…
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 200,
                                  minWidth: 150,
                                  maxHeight: 200,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(0, 2)),
                                    ],
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "📍 Current Stop",
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4),
                                          child: Text(
                                            "" +
                                                busStops.firstWhere((stop) =>
                                                    stop['id'] == id)['name'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[800],
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      id2 == null
                                          ? const SizedBox()
                                          : Text(
                                              "📍 Destination Stop",
                                              style: GoogleFonts.poppins(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                      id2 == null
                                          ? const SizedBox()
                                          : Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4),
                                                child: Text(
                                                  "" +
                                                      busStops.firstWhere(
                                                          (stop) =>
                                                              stop['id'] ==
                                                              id2)['name'],
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey[800],
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                      selectedBusData == null
                                          ? const SizedBox()
                                          : Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4),
                                                child: Text(
                                                  "Arrival Time ${busArrivalTime()}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[800],
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4),
                                          child: Text(
                                            selectedBusData == null
                                                ? "No Bus Available"
                                                : selectedBusData['name'],
                                            // "-" ,
                                            // "-" +
                                            // selectedBusData[
                                            //     'busNumber'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[800],
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
          DraggableScrollableSheet(
            initialChildSize: 0.58,
            minChildSize: 0.58,
            maxChildSize: 0.58,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    busRoutes.isEmpty
                        ? const Center(
                            child: Text(
                              "No buses available",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : Expanded(
                            flex: 7,
                            child: ListView.builder(
                              controller: scrollController,
                              itemCount: busRoutes.length,
                              itemBuilder: (context, index) {
                                return _buildBusRouteCard(
                                    busRoutes[index], screenHeight);
                              },
                            ),
                          ),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: GestureDetector(
                                onTapDown: (_) => _scaleController.forward(),
                                onTapUp: (_) => _scaleController.reverse(),
                                onTapCancel: () => _scaleController.reverse(),
                                onTap: () async {
                                  if (!isAnimating) {
                                    setState(() {
                                      isAnimating = true;
                                    });

                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    List<String> favoriteBusStops =
                                        prefs.getStringList(
                                                "favoriteBusStops") ??
                                            [];

                                    final busStopId = id.toString();
                                    if (!isFavorite) {
                                      if (!favoriteBusStops
                                          .contains(busStopId)) {
                                        favoriteBusStops.add(busStopId);
                                      }
                                    } else {
                                      favoriteBusStops.remove(busStopId);
                                    }

                                    await prefs.setStringList(
                                        "favoriteBusStops", favoriteBusStops);

                                    await Future.delayed(
                                        const Duration(milliseconds: 1500));

                                    setState(() {
                                      isFavorite = !isFavorite;
                                      isAnimating = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: screenHeight * 0.06,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: isFavorite
                                        ? Colors.green
                                        : MyColors.ourPrimary,
                                    borderRadius: BorderRadius.circular(12),
                                    border: isFavorite
                                        ? Border.all(
                                            color: Colors.green.shade700,
                                            width: 2)
                                        : null,
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (!isAnimating) ...[
                                          if (isFavorite) ...[
                                            const Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 8),
                                          ],
                                          Text(
                                            isFavorite
                                                ? "Added to Favorites"
                                                : "Add to Favorites",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (isAnimating)
                              Positioned(
                                left: 20,
                                right: 20,
                                bottom: 15,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    height: screenHeight * 0.06,
                                    color: Colors.white.withOpacity(0.9),
                                    child: Stack(
                                      children: [
                                        TweenAnimationBuilder<double>(
                                          tween: Tween(begin: 0.0, end: 1.0),
                                          duration: const Duration(
                                              milliseconds: 1500),
                                          builder: (context, value, child) {
                                            return Positioned(
                                              left: value *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                  100,
                                              top: 0,
                                              bottom: 0,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Transform.scale(
                                                    scale: 0.7,
                                                    child: const Icon(
                                                      Icons.directions_bus,
                                                      color:
                                                          MyColors.ourPrimary,
                                                      size: 32,
                                                    ),
                                                  ),
                                                  if (value > 0.7)
                                                    TweenAnimationBuilder<
                                                        double>(
                                                      tween: Tween(
                                                          begin: 0.0, end: 1.0),
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      builder: (context,
                                                          opacity, child) {
                                                        return Opacity(
                                                          opacity: opacity,
                                                          child:
                                                              Transform.scale(
                                                            scale: opacity,
                                                            child: const Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                              size: 24,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
