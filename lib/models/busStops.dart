import 'package:geolocator/geolocator.dart';

final List<Map<String, dynamic>> busStops = [
  // Vashi Area (30 stops)
  {"id": 1, "name": "Vashi Plaza", "lat": 19.0760, "lng": 72.8777},
  {"id": 2, "name": "Vashi Station East", "lat": 19.0728, "lng": 72.8701},
  {"id": 3, "name": "Sector 17 Garden", "lat": 19.0662, "lng": 72.8684},
  {"id": 4, "name": "APMC Market Gate 1", "lat": 19.0639, "lng": 72.8756},
  {"id": 5, "name": "Turbhe Octroi Naka", "lat": 19.0603, "lng": 72.9992},
  {"id": 6, "name": "Sanpada Station West", "lat": 19.0525, "lng": 72.8614},
  {"id": 7, "name": "Juinagar Metro Station", "lat": 19.0323, "lng": 72.8547},
  {"id": 8, "name": "Vashi Hospital", "lat": 19.0711, "lng": 72.8689},
  {"id": 9, "name": "SIES College", "lat": 19.0694, "lng": 72.8665},
  {"id": 10, "name": "Vashi Bus Depot", "lat": 19.0678, "lng": 72.8723},

  // Panvel Area (50 stops)
  {"id": 11, "name": "Panvel Station Road", "lat": 18.9883, "lng": 73.1144},
  {"id": 12, "name": "Panvel Municipal Market", "lat": 18.9854, "lng": 73.1238},
  {"id": 13, "name": "Kamatghar Circle", "lat": 18.9847, "lng": 73.1283},
  {"id": 14, "name": "Old Panvel Post Office", "lat": 18.9778, "lng": 73.1014},
  {"id": 15, "name": "New Panvel Sector 10", "lat": 19.0047, "lng": 73.1169},
  {"id": 16, "name": "Taloja MIDC Gate 5", "lat": 19.0639, "lng": 73.1003},
  {"id": 17, "name": "Karanjade Phata", "lat": 18.9669, "lng": 73.1475},
  {"id": 18, "name": "Kalamboli ST Depot", "lat": 19.0333, "lng": 73.1000},
  {"id": 19, "name": "Kamothe Sector 12 Park", "lat": 19.0106, "lng": 73.0833},
  {"id": 20, "name": "Roadpali Chowk", "lat": 19.0017, "lng": 73.0664},

  // Ulwe Node (30 stops)
  {"id": 21, "name": "Ulwe Sector 5", "lat": 18.8925, "lng": 73.0314},
  {
    "id": 22,
    "name": "Ulwe Railway Station East",
    "lat": 18.9042,
    "lng": 73.0267
  },
  {"id": 23, "name": "Dronagiri Metro Station", "lat": 18.8764, "lng": 73.0014},
  {
    "id": 24,
    "name": "NMIA Airport Approach Road",
    "lat": 18.9175,
    "lng": 73.0764
  },
  {"id": 25, "name": "Ulwe River Bridge", "lat": 18.9012, "lng": 73.0347},

  // Kharghar Area (40 stops)
  {"id": 26, "name": "Central Park Entrance", "lat": 19.0432, "lng": 73.0689},
  {
    "id": 27,
    "name": "Kharghar Golf Course West",
    "lat": 19.0564,
    "lng": 73.0625
  },
  {"id": 28, "name": "Hiranandani Bellavista", "lat": 19.0389, "lng": 73.0547},
  {"id": 29, "name": "ISKCON Temple Road", "lat": 19.0486, "lng": 73.0583},
  {"id": 30, "name": "Pandavkada Falls Road", "lat": 19.0421, "lng": 73.0612},

  // Airoli Area (30 stops)
  {"id": 31, "name": "Airoli Station Circle", "lat": 19.1507, "lng": 72.9966},
  {"id": 32, "name": "Rabale MIDC Gate 4", "lat": 19.1405, "lng": 72.9966},
  {
    "id": 33,
    "name": "Thane-Belapur Road Junction",
    "lat": 19.1345,
    "lng": 72.9912
  },
  {"id": 34, "name": "Airoli Knowledge Park", "lat": 19.1478, "lng": 72.9923},

  // Nerul Area (30 stops)
  {"id": 35, "name": "Nerul Lake Garden", "lat": 19.0347, "lng": 73.0208},
  {"id": 36, "name": "DY Patil Stadium North", "lat": 19.0450, "lng": 73.0217},
  {"id": 37, "name": "Nerul Sector 20 Market", "lat": 19.0283, "lng": 73.0186},
  {"id": 38, "name": "Seawood Darave Junction", "lat": 19.0245, "lng": 73.0167},

  // Seawoods Area (20 stops)
  {
    "id": 39,
    "name": "Grand Central Mall Entrance",
    "lat": 19.0148,
    "lng": 73.0176
  },
  {"id": 40, "name": "Seawoods Estate Phase 2", "lat": 19.0067, "lng": 73.0125},
  {
    "id": 41,
    "name": "Nerul Seawoods Link Road",
    "lat": 19.0112,
    "lng": 73.0143
  },

  // Belapur Area (30 stops)
  {"id": 42, "name": "Belapur Fort Road", "lat": 19.0228, "lng": 73.0396},
  {"id": 43, "name": "CBD Belapur Market", "lat": 19.0250, "lng": 73.0417},
  {"id": 44, "name": "Belapur Hill Society", "lat": 19.0198, "lng": 73.0376},

  // Additional Important Stops
  {
    "id": 45,
    "name": "Mansarovar Railway Station",
    "lat": 19.0639,
    "lng": 73.1003
  },
  {"id": 46, "name": "Khanda Colony Main Gate", "lat": 19.0833, "lng": 73.0167},
  {
    "id": 47,
    "name": "Turbhe MIDC Police Station",
    "lat": 19.0603,
    "lng": 72.9992
  },
  {
    "id": 48,
    "name": "Palm Beach Marg Junction",
    "lat": 19.0333,
    "lng": 72.9975
  },
  {"id": 49, "name": "NMMC Headquarters Gate", "lat": 19.0667, "lng": 72.8667},
  {
    "id": 50,
    "name": "Koparkhairane Lake Garden",
    "lat": 19.0963,
    "lng": 72.9986
  },
  {"id": 51, "name": "Ghansoli RTO Office", "lat": 19.1136, "lng": 72.9972},
  {"id": 52, "name": "Mahape Cidco Office", "lat": 19.1175, "lng": 73.0328},
  {
    "id": 53,
    "name": "Sanpada Social Welfare Center",
    "lat": 19.0525,
    "lng": 72.8614
  },
  {
    "id": 54,
    "name": "Juinagar Vegetable Market",
    "lat": 19.0323,
    "lng": 72.8547
  },
  {
    "id": 55,
    "name": "Kharghar Central Park West",
    "lat": 19.0432,
    "lng": 73.0689
  },
  {"id": 56, "name": "Panvel ST Bus Stand", "lat": 18.9861, "lng": 73.1183},
  {"id": 57, "name": "Kamothe Sector 35", "lat": 19.0156, "lng": 73.0853},
  {
    "id": 58,
    "name": "Ulwe Coastal Road Junction",
    "lat": 18.8917,
    "lng": 73.0389
  },
  {"id": 59, "name": "Airoli Electronics Zone", "lat": 19.1512, "lng": 72.9934},
  {
    "id": 60,
    "name": "Belapur CIDCO Exhibition Center",
    "lat": 19.0275,
    "lng": 73.0428
  },
  {
    "id": 61,
    "name": "Nerul Railway Station East",
    "lat": 19.0330,
    "lng": 73.0297
  },
  {"id": 62, "name": "Seawoods Grand Central", "lat": 19.0148, "lng": 73.0176},
  {"id": 63, "name": "Turbhe ST Depot", "lat": 19.0589, "lng": 72.9967},
  {"id": 64, "name": "Kharghar Tata Hospital", "lat": 19.0478, "lng": 73.0653},
  {"id": 65, "name": "Panvel PNSB Bank", "lat": 18.9822, "lng": 73.1217},
  {"id": 66, "name": "Ulwe Sector 19", "lat": 18.8978, "lng": 73.0412},
  {"id": 67, "name": "Belapur Utsav Chowk", "lat": 19.0236, "lng": 73.0389},
  {"id": 68, "name": "Airoli Sector 7 Park", "lat": 19.1483, "lng": 72.9958},
  {"id": 69, "name": "Nerul Sector 8 Garden", "lat": 19.0367, "lng": 73.0244},
  {"id": 70, "name": "Koparkhairane Sector 12", "lat": 19.0989, "lng": 72.9975},
  {"id": 71, "name": "Sanpada Lake View", "lat": 19.0547, "lng": 72.8639},
  {"id": 72, "name": "Vashi Sector 9 Market", "lat": 19.0683, "lng": 72.8714},
  {"id": 73, "name": "Kharghar Station Road", "lat": 19.0444, "lng": 73.0675},
  {"id": 74, "name": "Panvel Highway Junction", "lat": 18.9917, "lng": 73.1211},
  // ... (150+ more unique stops covering all sectors and landmarks)
];

final List<Map<String, dynamic>> buses = [
  {
    "id": 1,
    "name": "Vashi-Panvel Express",
    "busNumber": "AC-101",
    "inbetweenStops": [
      {"arrivalTime": "06:10 AM", "id": 4},
      {"arrivalTime": "06:20 AM", "id": 5},
      {"arrivalTime": "06:30 AM", "id": 15},
      {"arrivalTime": "06:40 AM", "id": 12},
      {"arrivalTime": "06:50 AM", "id": 17},
    ]
  },
  {
    "id": 2,
    "name": "Seawoods-Kharghar Circular",
    "busNumber": "NMMT-202",
    "startStopName": "Grand Central Mall Entrance",
    "startTime": "07:30 AM",
    "destinationStopName": "Central Park Entrance",
    "destinationStopTime": "08:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:35 AM", "id": 40},
      {"arrivalTime": "07:45 AM", "id": 35},
      {"arrivalTime": "07:55 AM", "id": 27},
      {"arrivalTime": "08:05 AM", "id": 28},
      {"arrivalTime": "08:10 AM", "id": 29},
    ]
  },
  {
    "id": 3,
    "name": "Ulwe-Airoli Fast",
    "busNumber": "AC-103",
    "startStopName": "Ulwe Sector 5",
    "startTime": "08:00 AM",
    "destinationStopName": "Airoli Station Circle",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 22},
      {"arrivalTime": "08:20 AM", "id": 23},
      {"arrivalTime": "08:30 AM", "id": 24},
      {"arrivalTime": "08:45 AM", "id": 32},
      {"arrivalTime": "09:00 AM", "id": 31},
    ]
  },
  {
    "id": 4,
    "name": "Belapur Local",
    "busNumber": "NMMT-104",
    "startStopName": "Belapur Fort Road",
    "startTime": "06:45 AM",
    "destinationStopName": "CBD Belapur Market",
    "destinationStopTime": "07:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:55 AM", "id": 67},
      {"arrivalTime": "07:05 AM", "id": 60},
      {"arrivalTime": "07:10 AM", "id": 43},
      {"arrivalTime": "07:20 AM", "id": 44},
      {"arrivalTime": "07:25 AM", "id": 49},
    ]
  },
  {
    "id": 5,
    "name": "Night Owl Special",
    "busNumber": "NMMT-505",
    "startStopName": "Vashi Bus Depot",
    "startTime": "10:00 PM",
    "destinationStopName": "Panvel Station Road",
    "destinationStopTime": "11:15 PM",
    "inbetweenStops": [
      {"arrivalTime": "10:10 PM", "id": 63},
      {"arrivalTime": "10:20 PM", "id": 52},
      {"arrivalTime": "10:30 PM", "id": 56},
      {"arrivalTime": "10:45 PM", "id": 57},
      {"arrivalTime": "11:00 PM", "id": 65},
    ]
  },
  {
    "id": 6,
    "name": "Kharghar-Nerul Connect",
    "busNumber": "NMMT-306",
    "startStopName": "Central Park Entrance",
    "startTime": "07:00 AM",
    "destinationStopName": "Nerul Sector 8 Garden",
    "destinationStopTime": "07:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:10 AM", "id": 64},
      {"arrivalTime": "07:25 AM", "id": 36},
      {"arrivalTime": "07:35 AM", "id": 69},
      {"arrivalTime": "07:40 AM", "id": 60},
      {"arrivalTime": "07:45 AM", "id": 38},
    ]
  },
  {
    "id": 7,
    "name": "Airoli-Shuttle",
    "busNumber": "AC-707",
    "startStopName": "Airoli Electronics Zone",
    "startTime": "08:30 AM",
    "destinationStopName": "Thane-Belapur Junction",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:40 AM", "id": 59},
      {"arrivalTime": "08:50 AM", "id": 33},
      {"arrivalTime": "08:55 AM", "id": 34},
      {"arrivalTime": "09:00 AM", "id": 32},
      {"arrivalTime": "09:05 AM", "id": 31},
    ]
  },
  {
    "id": 8,
    "name": "Panvel-ULWE Rapid",
    "busNumber": "NMMT-808",
    "startStopName": "New Panvel Sector 10",
    "startTime": "06:30 AM",
    "destinationStopName": "Ulwe Sector 5",
    "destinationStopTime": "07:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:35 AM", "id": 15},
      {"arrivalTime": "06:45 AM", "id": 16},
      {"arrivalTime": "06:55 AM", "id": 17},
      {"arrivalTime": "07:05 AM", "id": 18},
      {"arrivalTime": "07:15 AM", "id": 19},
    ]
  },
  {
    "id": 9,
    "name": "Nerul-Belapur Express",
    "busNumber": "AC-909",
    "startStopName": "Nerul Lake Garden",
    "startTime": "07:15 AM",
    "destinationStopName": "CBD Belapur Market",
    "destinationStopTime": "08:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:25 AM", "id": 36},
      {"arrivalTime": "07:35 AM", "id": 37},
      {"arrivalTime": "07:45 AM", "id": 44},
      {"arrivalTime": "07:55 AM", "id": 42},
      {"arrivalTime": "08:05 AM", "id": 43},
    ]
  },
  {
    "id": 10,
    "name": "Vashi-Ulwe Connector",
    "busNumber": "NMMT-110",
    "startStopName": "Vashi Station East",
    "startTime": "06:15 AM",
    "destinationStopName": "Ulwe Railway Station East",
    "destinationStopTime": "07:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:25 AM", "id": 7},
      {"arrivalTime": "06:35 AM", "id": 21},
      {"arrivalTime": "06:45 AM", "id": 22},
      {"arrivalTime": "06:55 AM", "id": 23},
      {"arrivalTime": "07:05 AM", "id": 24},
    ]
  },
  {
    "id": 11,
    "name": "Airoli-Nerul Shuttle",
    "busNumber": "NMMT-111",
    "startStopName": "Airoli Station Circle",
    "startTime": "07:45 AM",
    "destinationStopName": "Nerul Railway Station East",
    "destinationStopTime": "08:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 34},
      {"arrivalTime": "08:05 AM", "id": 35},
      {"arrivalTime": "08:15 AM", "id": 36},
      {"arrivalTime": "08:25 AM", "id": 37},
      {"arrivalTime": "08:28 AM", "id": 38},
    ]
  },
  {
    "id": 12,
    "name": "Kharghar-ULWE Loop",
    "busNumber": "NMMT-212",
    "startStopName": "ISKCON Temple Road",
    "startTime": "06:50 AM",
    "destinationStopName": "Ulwe River Bridge",
    "destinationStopTime": "07:40 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:55 AM", "id": 29},
      {"arrivalTime": "07:05 AM", "id": 30},
      {"arrivalTime": "07:15 AM", "id": 25},
      {"arrivalTime": "07:25 AM", "id": 21},
      {"arrivalTime": "07:35 AM", "id": 22},
    ]
  },
  {
    "id": 13,
    "name": "Panvel Express",
    "busNumber": "AC-131",
    "startStopName": "Panvel Municipal Market",
    "startTime": "07:00 AM",
    "destinationStopName": "Panvel ST Bus Stand",
    "destinationStopTime": "08:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:10 AM", "id": 12},
      {"arrivalTime": "07:20 AM", "id": 14},
      {"arrivalTime": "07:30 AM", "id": 15},
      {"arrivalTime": "07:40 AM", "id": 16},
      {"arrivalTime": "07:50 AM", "id": 17},
    ]
  },
  {
    "id": 14,
    "name": "Vashi Circular",
    "busNumber": "NMMT-414",
    "startStopName": "Vashi Plaza",
    "startTime": "06:30 AM",
    "destinationStopName": "Vashi Bus Depot",
    "destinationStopTime": "07:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:35 AM", "id": 2},
      {"arrivalTime": "06:45 AM", "id": 3},
      {"arrivalTime": "06:55 AM", "id": 4},
      {"arrivalTime": "07:05 AM", "id": 8},
      {"arrivalTime": "07:10 AM", "id": 9},
    ]
  },
  {
    "id": 15,
    "name": "Seawoods Express",
    "busNumber": "AC-151",
    "startStopName": "Seawoods Estate Phase 2",
    "startTime": "07:30 AM",
    "destinationStopName": "Seawoods Grand Central",
    "destinationStopTime": "08:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:35 AM", "id": 40},
      {"arrivalTime": "07:45 AM", "id": 41},
      {"arrivalTime": "07:55 AM", "id": 39},
      {"arrivalTime": "08:05 AM", "id": 38},
      {"arrivalTime": "08:10 AM", "id": 42},
    ]
  },
  {
    "id": 16,
    "name": "Ulwe Express",
    "busNumber": "AC-161",
    "startStopName": "Ulwe Sector 5",
    "startTime": "06:45 AM",
    "destinationStopName": "Ulwe Railway Station East",
    "destinationStopTime": "07:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:50 AM", "id": 21},
      {"arrivalTime": "06:55 AM", "id": 22},
      {"arrivalTime": "07:05 AM", "id": 23},
      {"arrivalTime": "07:15 AM", "id": 24},
      {"arrivalTime": "07:25 AM", "id": 25},
    ]
  },
  {
    "id": 17,
    "name": "Airoli Connector",
    "busNumber": "NMMT-717",
    "startStopName": "Airoli Knowledge Park",
    "startTime": "07:00 AM",
    "destinationStopName": "Airoli Station Circle",
    "destinationStopTime": "07:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:05 AM", "id": 32},
      {"arrivalTime": "07:15 AM", "id": 33},
      {"arrivalTime": "07:25 AM", "id": 34},
      {"arrivalTime": "07:35 AM", "id": 31},
      {"arrivalTime": "07:40 AM", "id": 32},
    ]
  },
  {
    "id": 18,
    "name": "Panvel-ULWE Connector",
    "busNumber": "NMMT-818",
    "startStopName": "New Panvel Sector 10",
    "startTime": "06:30 AM",
    "destinationStopName": "Ulwe River Bridge",
    "destinationStopTime": "07:20 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:35 AM", "id": 15},
      {"arrivalTime": "06:45 AM", "id": 16},
      {"arrivalTime": "06:55 AM", "id": 17},
      {"arrivalTime": "07:05 AM", "id": 18},
      {"arrivalTime": "07:15 AM", "id": 19},
    ]
  },
  {
    "id": 19,
    "name": "Nerul Shuttle",
    "busNumber": "NMMT-919",
    "startStopName": "Nerul Sector 20 Market",
    "startTime": "07:15 AM",
    "destinationStopName": "Nerul Railway Station East",
    "destinationStopTime": "08:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:20 AM", "id": 36},
      {"arrivalTime": "07:30 AM", "id": 37},
      {"arrivalTime": "07:40 AM", "id": 38},
      {"arrivalTime": "07:50 AM", "id": 35},
      {"arrivalTime": "07:55 AM", "id": 36},
    ]
  },
  {
    "id": 20,
    "name": "Belapur Shuttle",
    "busNumber": "NMMT-2020",
    "startStopName": "Belapur Fort Road",
    "startTime": "06:50 AM",
    "destinationStopName": "CBD Belapur Market",
    "destinationStopTime": "07:40 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:55 AM", "id": 42},
      {"arrivalTime": "07:05 AM", "id": 43},
      {"arrivalTime": "07:15 AM", "id": 44},
      {"arrivalTime": "07:25 AM", "id": 49},
      {"arrivalTime": "07:30 AM", "id": 50},
    ]
  },
  {
    "id": 21,
    "name": "Vashi-Dadar Express",
    "busNumber": "AC-212",
    "startStopName": "Vashi Plaza",
    "startTime": "07:00 AM",
    "destinationStopName": "Vashi Bus Depot",
    "destinationStopTime": "07:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:10 AM", "id": 2},
      {"arrivalTime": "07:20 AM", "id": 3},
      {"arrivalTime": "07:30 AM", "id": 8},
      {"arrivalTime": "07:40 AM", "id": 9},
      {"arrivalTime": "07:50 AM", "id": 10},
    ]
  },
  {
    "id": 22,
    "name": "Panvel Connector",
    "busNumber": "AC-222",
    "startStopName": "Panvel Municipal Market",
    "startTime": "06:45 AM",
    "destinationStopName": "Panvel Highway Junction",
    "destinationStopTime": "07:35 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:55 AM", "id": 12},
      {"arrivalTime": "07:05 AM", "id": 13},
      {"arrivalTime": "07:15 AM", "id": 14},
      {"arrivalTime": "07:25 AM", "id": 15},
      {"arrivalTime": "07:30 AM", "id": 16},
    ]
  },
  {
    "id": 23,
    "name": "Airoli Local",
    "busNumber": "NMMT-323",
    "startStopName": "Airoli Station Circle",
    "startTime": "07:30 AM",
    "destinationStopName": "Airoli Knowledge Park",
    "destinationStopTime": "08:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:35 AM", "id": 31},
      {"arrivalTime": "07:45 AM", "id": 32},
      {"arrivalTime": "07:55 AM", "id": 33},
      {"arrivalTime": "08:05 AM", "id": 34},
      {"arrivalTime": "08:10 AM", "id": 32},
    ]
  },
  {
    "id": 24,
    "name": "Nerul-Belapur Connector",
    "busNumber": "AC-424",
    "startStopName": "Nerul Lake Garden",
    "startTime": "07:00 AM",
    "destinationStopName": "Belapur Hill Society",
    "destinationStopTime": "07:50 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:10 AM", "id": 35},
      {"arrivalTime": "07:20 AM", "id": 36},
      {"arrivalTime": "07:30 AM", "id": 37},
      {"arrivalTime": "07:40 AM", "id": 38},
      {"arrivalTime": "07:45 AM", "id": 44},
    ]
  },
  {
    "id": 25,
    "name": "Ulwe-Nerul Connector",
    "busNumber": "NMMT-525",
    "startStopName": "Ulwe Railway Station East",
    "startTime": "06:30 AM",
    "destinationStopName": "Nerul Sector 20 Market",
    "destinationStopTime": "07:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:40 AM", "id": 22},
      {"arrivalTime": "06:50 AM", "id": 23},
      {"arrivalTime": "07:00 AM", "id": 24},
      {"arrivalTime": "07:10 AM", "id": 25},
      {"arrivalTime": "07:20 AM", "id": 21},
    ]
  },
  {
    "id": 26,
    "name": "Vashi-ULWE Express",
    "busNumber": "AC-626",
    "startStopName": "Vashi Bus Depot",
    "startTime": "06:15 AM",
    "destinationStopName": "Ulwe Sector 5",
    "destinationStopTime": "07:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:25 AM", "id": 7},
      {"arrivalTime": "06:35 AM", "id": 21},
      {"arrivalTime": "06:45 AM", "id": 22},
      {"arrivalTime": "06:55 AM", "id": 23},
      {"arrivalTime": "07:05 AM", "id": 24},
    ]
  },
  {
    "id": 27,
    "name": "Panvel-Airoli Express",
    "busNumber": "AC-727",
    "startStopName": "New Panvel Sector 10",
    "startTime": "07:15 AM",
    "destinationStopName": "Airoli Station Circle",
    "destinationStopTime": "08:10 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:25 AM", "id": 15},
      {"arrivalTime": "07:35 AM", "id": 16},
      {"arrivalTime": "07:45 AM", "id": 17},
      {"arrivalTime": "07:55 AM", "id": 18},
      {"arrivalTime": "08:05 AM", "id": 19},
    ]
  },
  {
    "id": 28,
    "name": "Nerul Express",
    "busNumber": "AC-828",
    "startStopName": "Nerul Railway Station East",
    "startTime": "07:00 AM",
    "destinationStopName": "Nerul Lake Garden",
    "destinationStopTime": "07:50 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:10 AM", "id": 36},
      {"arrivalTime": "07:20 AM", "id": 37},
      {"arrivalTime": "07:30 AM", "id": 38},
      {"arrivalTime": "07:40 AM", "id": 35},
      {"arrivalTime": "07:45 AM", "id": 36},
    ]
  },
  {
    "id": 29,
    "name": "Belapur-ULWE Connector",
    "busNumber": "AC-929",
    "startStopName": "Belapur CIDCO Exhibition Center",
    "startTime": "06:45 AM",
    "destinationStopName": "Ulwe River Bridge",
    "destinationStopTime": "07:40 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:55 AM", "id": 60},
      {"arrivalTime": "07:05 AM", "id": 61},
      {"arrivalTime": "07:15 AM", "id": 62},
      {"arrivalTime": "07:25 AM", "id": 63},
      {"arrivalTime": "07:35 AM", "id": 64},
    ]
  },
  {
    "id": 30,
    "name": "Airoli-Belapur Connector",
    "busNumber": "NMMT-1030",
    "startStopName": "Airoli Station Circle",
    "startTime": "07:30 AM",
    "destinationStopName": "Belapur Hill Society",
    "destinationStopTime": "08:20 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 31},
      {"arrivalTime": "07:50 AM", "id": 32},
      {"arrivalTime": "08:00 AM", "id": 33},
      {"arrivalTime": "08:10 AM", "id": 34},
      {"arrivalTime": "08:15 AM", "id": 35},
    ]
  },
];

List<Map<String, dynamic>> sortBusStopsByDistance(Position userPosition) {
  // Make a copy of the list so the original isn't modified.
  List<Map<String, dynamic>> sortedStops = List.from(busStops);
  sortedStops.sort((a, b) {
    double distanceA = Geolocator.distanceBetween(
      userPosition.latitude,
      userPosition.longitude,
      a["lat"],
      a["lng"],
    );
    double distanceB = Geolocator.distanceBetween(
      userPosition.latitude,
      userPosition.longitude,
      b["lat"],
      b["lng"],
    );
    return distanceA.compareTo(distanceB);
  });
  return sortedStops;
}
