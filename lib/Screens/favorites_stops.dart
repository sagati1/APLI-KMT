import 'dart:convert';
import 'package:bus_schedule_app/components/constant.dart';
import 'package:bus_schedule_app/models/busStops2.dart';
import 'package:bus_schedule_app/router/named_routes.dart';
import 'package:bus_schedule_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

class FavoriteBusStops extends StatefulWidget {
  const FavoriteBusStops({Key? key}) : super(key: key);

  @override
  State<FavoriteBusStops> createState() => _FavoriteBusStopsState();
}

class _FavoriteBusStopsState extends State<FavoriteBusStops> {
  List<Map<String, dynamic>> _favoriteBusStops = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStops();
  }

  Future<void> _loadFavoriteStops() async {
    setState(() {
      _isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteIds = prefs.getStringList("favoriteBusStops") ?? [];
    
    List<Map<String, dynamic>> favorites = [];
    
    // Process each favorite ID
    for (String id in favoriteIds) {
      try {
        // If ID is a JSON string (containing complex data like route with fromStopId and toStopId)
        if (id.contains("{")) {
          final Map<String, dynamic> data = jsonDecode(id);
          final String stopId = data["fromStopId"];
          
          // Find the bus stop in the busStops list
          final busStop = busStops.firstWhere(
            (stop) => stop["id"].toString() == stopId,
            orElse: () => <String, dynamic>{"id": -1, "name": "Unknown Stop"}
          );
          
          if (busStop["id"] != -1) {
            busStop["isFavorite"] = true;
            favorites.add(busStop);
          }
        } 
        // Simple ID string
        else {
          final busStop = busStops.firstWhere(
            (stop) => stop["id"].toString() == id,
            orElse: () => <String, dynamic>{"id": -1, "name": "Unknown Stop"}
          );
          
          if (busStop["id"] != -1) {
            busStop["isFavorite"] = true;
            favorites.add(busStop);
          }
        }
      } catch (e) {
        print("Error processing favorite ID: $id, Error: $e");
      }
    }

    setState(() {
      _favoriteBusStops = favorites;
      _isLoading = false;
    });
  }

  Future<void> _removeFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteIds = prefs.getStringList("favoriteBusStops") ?? [];
    
    favoriteIds.removeWhere((favoriteId) {
      if (favoriteId.contains("{")) {
        try {
          final data = jsonDecode(favoriteId);
          return data["fromStopId"] == id;
        } catch (_) {
          return false;
        }
      }
      return favoriteId == id;
    });
    
    await prefs.setStringList("favoriteBusStops", favoriteIds);
    
    setState(() {
      _favoriteBusStops.removeWhere((stop) => stop["id"].toString() == id);
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Stop removed from favorites'),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ),
      );
    }
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

  Widget _buildBusStopCard(Map<String, dynamic> busStop, double screenHeight) {
    return Dismissible(
      key: Key(busStop["id"].toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Remove from Favorites"),
              content: const Text("Are you sure you want to remove this bus stop from favorites?"),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                TextButton(
                  child: const Text(
                    "Remove",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        _removeFavorite(busStop["id"].toString());
      },
      child: GestureDetector(
        onTap: () {
           GoRouter.of(context)
            .pushNamed(UserRoutes.busStopDetails, extra: [busStop["id"], null]);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                      busStop["name"] ?? "Unknown Stop",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      busStop["location"] ?? "Bus Stop ID: ${busStop["id"]}",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text("Favorite Bus Stops", style: GoogleFonts.poppins()),
      ),
      body: _isLoading 
        ? Center(
            child: CircularProgressIndicator(
              color: MyColors.ourPrimary,
            ),
          ) 
        : _favoriteBusStops.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/Lotty/empty.json",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "No favorite bus stops yet",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Add bus stops to your favorites for quick access",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: _loadFavoriteStops,
              color: MyColors.ourPrimary,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _favoriteBusStops.length,
                    itemBuilder: (context, index) {
                      return _buildBusStopCard(
                        _favoriteBusStops[index], 
                        screenHeight
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Swipe left on a bus stop to remove it from favorites",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[500],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}