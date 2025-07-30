import 'package:bus_schedule_app/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart' hide Marker;
import 'package:go_router/go_router.dart';
import 'package:bus_schedule_app/router/named_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  final int totalBusStops = 254;
  final String appVersion = "1.0.0";
  int favoriteCount = 0;
  int tripCount = 0;
  String _currentLocation = "Fetching location...";
  Position? _currentPosition;
  late GoogleMapController _mapController;

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _currentLocation = "Location service disabled");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _currentLocation = "Location permission denied");
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Get address details using reverse geocoding
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _currentPosition = position;
          // Format address to show relevant parts
          _currentLocation = [
            place.street,
            place.subLocality,
            place.locality,
            place.administrativeArea,
          ]
              .where((element) => element != null && element.isNotEmpty)
              .join(", ");
        });
      } else {
        setState(() => _currentLocation = "Address not found");
      }
    } catch (e) {
      setState(() => _currentLocation = "Unable to get location");
      debugPrint("Error getting location: $e");
    }
  }

  Future<void> _handleLogout(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      await FirebaseAuth.instance.signOut();

      if (mounted) {
        GoRouter.of(context).pushReplacement(CommonRoutes.splashScreen);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error logging out: ${e.toString()}'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  String _getNeighborhood(Position position) {
    return "Home";
  }

  Future<void> _updateFavoriteCount() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteBusStops =
        prefs.getStringList("favoriteBusStops") ?? [];
    setState(() => favoriteCount = favoriteBusStops.length);
  }

  Future<void> _updateTripCount() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> trips = prefs.getStringList("trips") ?? [];
    setState(() => tripCount = trips.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            FutureBuilder<Map<String, String?>>(
              future: _getUserDetails(),
              builder: (context, snapshot) {
                // Show a loading indicator while fetching data
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: MyColors.primaryColor,
                    ),
                  );
                }

                // Render _buildUserInfo if data exists
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return _buildUserInfo();
                }

                // Fallback UI when no user data exists
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        size: 40,
                        color: MyColors.primaryColor.withOpacity(0.5),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "No User Details Found",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: MyColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Complete your profile to see your details here!",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
            _buildStatsCard(),
            _buildLocationCard(),
            _buildSettingsSection(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _updateFavoriteCount();
    _updateTripCount();
  }

  Widget _buildProfileHeader() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [MyColors.ourPrimary, MyColors.primaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        Positioned(
          top: 40,
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  gradient: const LinearGradient(
                    colors: [MyColors.ourPrimary, MyColors.primaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(Icons.person_outline_rounded,
                    size: 50, color: Colors.white.withOpacity(0.9)),
              ),
              const SizedBox(height: 15),
              Text(
                user?.email ?? "Guest User",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<Map<String, String?>> _getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();

    Map<String, String?> userDetails = {
      'name': prefs.getString('name'),
      'username': prefs.getString('username'),
      'email': prefs.getString('email'),
      'phone': prefs.getString('phone'),
    };

    print(
        "User Details from SharedPreferences: $userDetails"); // 🔥 Debugging line

    return userDetails;
  }

  Widget _buildUserInfo() {
    return FutureBuilder<Map<String, String?>>(
      future: _getUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink(); // Show nothing while loading
        }

        if (!snapshot.hasData ||
            snapshot.data!.values.every((value) => value == null)) {
          return const SizedBox.shrink(); // Show nothing if all values are null
        }

        final userDetails = snapshot.data!;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (userDetails['name'] != null &&
                  userDetails['name']!.isNotEmpty)
                Text(
                  userDetails['name']!,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: MyColors.primaryColor,
                  ),
                ),
              if (userDetails['username'] != null &&
                  userDetails['username']!.isNotEmpty)
                Text(
                  "@${userDetails['username']!}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              const SizedBox(height: 10),
              if (userDetails['email'] != null &&
                  userDetails['email']!.isNotEmpty)
                Row(
                  children: [
                    Icon(Icons.email_outlined,
                        size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(
                      userDetails['email']!,
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              if (userDetails['phone'] != null &&
                  userDetails['phone']!.isNotEmpty)
                Row(
                  children: [
                    Icon(Icons.phone_outlined,
                        size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(
                      userDetails['phone']!,
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            icon: Icons.favorite_border,
            label: "Favorites",
            value: favoriteCount,
            color: Colors.redAccent,
          ),
          _buildStatItem(
            icon: Icons.directions_bus_filled,
            label: "Trips",
            value: tripCount,
            color: MyColors.primaryColor,
          ),
          _buildStatItem(
            icon: Icons.location_pin,
            label: "Stops",
            value: totalBusStops,
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required int value,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value.toString(),
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: MyColors.primaryColor,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MyColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.location_pin,
                  color: MyColors.primaryColor, size: 24),
            ),
            title: Text("Current Location",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                )),
            subtitle: Text(_currentLocation,
                style: GoogleFonts.poppins(
                  color: Colors.grey[600],
                  fontSize: 14,
                )),
            trailing: IconButton(
              icon: const Icon(Icons.refresh_rounded,
                  color: MyColors.primaryColor),
              onPressed: _getCurrentLocation,
            ),
          ),
          if (_currentPosition != null)
            Container(
              height: 150,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      _currentPosition!.latitude,
                      _currentPosition!.longitude,
                    ),
                    zoom: 14,
                  ),
                  onMapCreated: (controller) => _mapController = controller,
                  markers: {
                    Marker(
                      markerId: const MarkerId("currentLocation"),
                      position: LatLng(
                        _currentPosition!.latitude,
                        _currentPosition!.longitude,
                      ),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueAzure),
                    ),
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.color_lens_outlined,
            title: "Theme",
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.notifications_active_outlined,
            title: "Notifications",
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.help_outline_rounded,
            title: "Help & Support",
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: "Logout",
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: MyColors.primaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: MyColors.primaryColor, size: 24),
      ),
      title: Text(title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
      trailing: Icon(Icons.chevron_right_rounded, color: Colors.grey[400]),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/Lotty/lossAni.json',
                height: 120,
                fit: BoxFit.cover,
              ),
              Text("Logout?",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primaryColor,
                  )),
              const SizedBox(height: 15),
              Text("Are you sure you want to sign out?",
                  style: GoogleFonts.poppins(
                    color: Colors.grey[600],
                    fontSize: 16,
                  )),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    child: Text("Cancel",
                        style: GoogleFonts.poppins(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        )),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text("Logout",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        )),
                    // onPressed: (){
                    //   print("hello");
                    // },
                    onPressed: () => _handleLogout(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
