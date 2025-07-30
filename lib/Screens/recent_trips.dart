import 'dart:convert';
import 'package:bus_schedule_app/components/constant.dart';
import 'package:bus_schedule_app/models/busStops2.dart';
import 'package:bus_schedule_app/services/utitly.dart';
import 'package:bus_schedule_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class RecentTrips extends StatefulWidget {
  const RecentTrips({Key? key}) : super(key: key);

  @override
  State<RecentTrips> createState() => _RecentTripsState();
}

class _RecentTripsState extends State<RecentTrips> {
  List<Map<String, dynamic>> _recentTrips = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRecentTrips();
  }
String? getBusStopName(dynamic stopId) {
  final id = stopId is int ? stopId : int.tryParse(stopId.toString());
  if (id == null) return null;
  
  try {
    final stop = busStops.firstWhere(
      (stop) => stop['id'] == id,
      orElse: () => {'name': 'Unknown Stop'}
    );
    
    return stop['name'];
  } catch (e) {
    debugPrint('Error finding bus stop name: $e');
    return 'Unknown Stop';
  }
}
  Future<void> _loadRecentTrips() async {
    setState(() {
      _isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    List<String> tripsJson = prefs.getStringList("trips") ?? [];

    List<Map<String, dynamic>> trips = [];
    for (var tripJson in tripsJson) {
      try {
        final trip = jsonDecode(tripJson);
        trips.add(Map<String, dynamic>.from(trip));
      } catch (e) {
        debugPrint('Error parsing trip: $e');
      }
    }

    // Sort by most recent first
    trips.sort((a, b) {
      final DateTime timeA = DateTime.parse(a["timeAdded"]);
      final DateTime timeB = DateTime.parse(b["timeAdded"]);
      return timeB.compareTo(timeA);
    });

    setState(() {
      _recentTrips = trips;
      _isLoading = false;
    });
  }

  String _formatDateTime(String isoString) {
    try {
      final dateTime = DateTime.parse(isoString);
      return DateFormat('MMM d, h:mm a').format(dateTime);
    } catch (e) {
      return "Unknown time";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColors.ourBackground,
      appBar: const CustomAppBar(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _recentTrips.isEmpty
              ? _buildEmptyState()
              : _buildTripsList(screenHeight),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Lottie.asset(
              'assets/Lotty/bus4.json',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "No Recent Trips",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Your recent trips will appear here after you add some trips from the bus details screen.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripsList(double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Your Recent Trips"),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 20),
            itemCount: _recentTrips.length,
            itemBuilder: (context, index) {
              return _buildTripCard(_recentTrips[index], screenHeight);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: MyColors.backgroundColor2,
          ),
        ),
      ),
    );
  }

  Widget _buildTripCard(Map<String, dynamic> trip, double screenHeight) {
    return GestureDetector(
      onTap: () => _showTripDetailsModal(trip),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(16),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Bus route number and name
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: MyColors.ourPrimary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    trip["busNumber"] ?? "Unknown",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Trip date
                Text(
                  _formatDateTime(trip["timeAdded"]),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // From and To stations
            Row(
              children: [
                const Icon(
                  Icons.circle_outlined,
                  color: MyColors.ourPrimary,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    trip["fromStopName"] ?? "Unknown start",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Container(
                width: 1,
                height: 20,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: MyColors.ourPrimary,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    trip["toStopName"] ?? "Unknown destination",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (trip["arrivalTime"] != null && trip["arrivalTime"] != "") ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: Colors.grey,
                    size: 14,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Arrival: ${trip["arrivalTime"]}",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showTripDetailsModal(Map<String, dynamic> trip) {
    List<dynamic> inbetweenStops = [];
    try {
      if (trip["inbetweenStops"] != null && trip["inbetweenStops"] != "[]") {
        // Double parsing for nested JSON
        inbetweenStops = jsonDecode(trip["inbetweenStops"]);
      }
    } catch (e) {
      debugPrint("Error parsing inbetweenStops: $e");
    }

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
                          // Trip identifier
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: MyColors.ourPrimary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Bus ${trip["busNumber"] ?? "Unknown"}",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: MyColors.ourPrimary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // From and To information
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      trip["fromStopName"] ?? "Unknown start",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
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
                                      trip["toStopName"] ??
                                          "Unknown destination",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildTimeWidget(
                                icon: Icons.access_time,
                                label: 'Arrival',
                                time: trip["arrivalTime"] ?? "Unknown",
                              ),
                              _buildTimeWidget(
                                icon: Icons.calendar_today,
                                label: 'Date',
                                time: _formatDateTime(trip["timeAdded"]),
                              ),
                            ],
                          ),

                          if (inbetweenStops.isNotEmpty) ...[
                            const SizedBox(height: 20),
                            Text(
                              'Bus Stops',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[200]!),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: RawScrollbar(
                                thumbColor: MyColors.ourPrimary.withOpacity(0.6),
                                radius: const Radius.circular(20),
                                thickness: 5,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  itemCount: inbetweenStops.length,
                                  itemBuilder: (context, index) {
                                    final stop = inbetweenStops[index];
                                    final isLastStop = index == inbetweenStops.length - 1;
                                    
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.stop_circle,
                                                color: (stop['id'].toString() == trip["fromStopId"] || 
                                                        stop['id'].toString() == trip["toStopId"])
                                                    ? MyColors.primaryColor
                                                    : MyColors.ourPrimary,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  getBusStopName(stop['id']) ?? 'Unknown Stop',
                                                  style: GoogleFonts.poppins(fontSize: 14),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                stop['arrivalTime'] ?? '',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!isLastStop)
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Container(
                                              height: 20,
                                              width: 1,
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],

                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                List<String> trips =
                                    prefs.getStringList("trips") ?? [];

                                trips.removeWhere((tripJson) {
                                  final currentTrip = jsonDecode(tripJson);
                                  return currentTrip["id"] == trip["id"];
                                });

                                await prefs.setStringList("trips", trips);

                                if (mounted) {
                                  Navigator.pop(context);
                                  _loadRecentTrips(); // Reload the list

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Trip removed from history'),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.white),
                              label: Text(
                                'Remove Trip',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
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
}
