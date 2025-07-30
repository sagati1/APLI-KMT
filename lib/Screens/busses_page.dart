import 'package:bus_schedule_app/models/busStops2.dart';
import 'package:bus_schedule_app/router/named_routes.dart';
import 'package:bus_schedule_app/services/utitly.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bus_schedule_app/components/constant.dart';
import 'package:bus_schedule_app/screens/bus_stop_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BussesPage extends StatefulWidget {
  const BussesPage({super.key});

  @override
  State<BussesPage> createState() => _BussesPageState();
}

class _BussesPageState extends State<BussesPage> {
  List<Map<String, dynamic>>? _busStops;

  List<Map<String, dynamic>> _filteredBusStops = [];

  final TextEditingController _searchController = TextEditingController();

  Future<void> getBusStops() async {
    setState(() {
      _busStops = null;
    });
    Position position = await UserLocation.getUserLocation();
    _busStops = sortBusStopsByDistance(UserLocation.position!);

    await loadFavoriteStops();
  }

  Future<void> loadFavoriteStops() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteIds = prefs.getStringList("favoriteBusStops") ?? [];
    setState(() {
      if (_busStops != null) {
        _busStops = _busStops!.map((stop) {
          stop["isFavorite"] = favoriteIds.contains(stop["id"].toString());
          return stop;
        }).toList();

        _filterBusStops(_searchController.text);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (UserLocation.position == null) {
      getBusStops();
    } else {
      _busStops = sortBusStopsByDistance(UserLocation.position!);
      loadFavoriteStops();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ModalRoute? route = ModalRoute.of(context);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didPopNext() {
    loadFavoriteStops();
  }

  void _filterBusStops(String query) {
    final filtered = _busStops!.where((stop) {
      final name = stop["name"].toString().toLowerCase();
      return name.contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredBusStops = query.isEmpty ? List.from(_busStops!) : filtered;
    });
  }

  void _toggleFavorite(int id) {
    setState(() {
      final index = _busStops!.indexWhere((stop) => stop["id"] == id);
      if (index != -1) {
        _busStops![index]["isFavorite"] = !_busStops![index]["isFavorite"];
      }
      _filterBusStops(_searchController.text);
    });
  }

  Widget _buildBusStopCard(Map<String, dynamic> busStop, double screenHeight) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .pushNamed(UserRoutes.busStopDetails, extra: [busStop["id"], null]);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: screenHeight * 0.085,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    busStop["name"] ?? "",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    busStop["location"] ?? "Unknown Location",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Uncomment this IconButton if you want to toggle favorites locally.
            // IconButton(
            //   onPressed: () => _toggleFavorite(busStop["id"]),
            //   icon: Icon(
            //     busStop["isFavorite"] ? Icons.favorite : Icons.favorite_border,
            //     color: busStop["isFavorite"] ? Colors.red : Colors.grey,
            //   ),
            // ),
          ],
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    if (_busStops == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final nearbyBusStops = _busStops!.take(10).toList();
    final favoriteBusStops =
        _busStops!.where((stop) => stop["isFavorite"] == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Busses'),
        backgroundColor: MyColors.appBg,
      ),
      backgroundColor: MyColors.projectBg,
      body: SingleChildScrollView(
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
                controller: _searchController,
                onChanged: _filterBusStops,
                decoration: const InputDecoration(
                  hintText: 'Search stop name...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            _searchController.text.isNotEmpty
                ? _buildSectionHeader("Search Results")
                : _buildSectionHeader("Nearby Bus Stops"),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _searchController.text.isNotEmpty
                  ? _filteredBusStops.length
                  : nearbyBusStops.length,
              itemBuilder: (context, index) {
                final busStop = _searchController.text.isNotEmpty
                    ? _filteredBusStops[index]
                    : nearbyBusStops[index];
                return _buildBusStopCard(busStop, screenHeight);
              },
            ),
            if (favoriteBusStops.isNotEmpty) ...[
              _buildSectionHeader("Favorite Bus Stops"),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: favoriteBusStops.length,
                itemBuilder: (context, index) {
                  return _buildBusStopCard(
                      favoriteBusStops[index], screenHeight);
                },
              ),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
