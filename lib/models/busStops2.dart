import 'package:geolocator/geolocator.dart';

final List<Map<String, dynamic>> busStops = [
  {
    "id": 1,
    "name": "Apang Purnavsan Society",
    "lat": 16.709528639985837,
    "lng": 74.24132915135259
  },
  {
    "id": 2,
    "name": "Apte Nagar Naveen Naka",
    "lat": 16.668618563588513,
    "lng": 74.20221867441053
  },
  {
    "id": 3,
    "name": "BT College",
    "lat": 16.700115081494843,
    "lng": 74.24001739552185
  },
  {
    "id": 4,
    "name": "Bagal Chowk",
    "lat": 16.698079106926055,
    "lng": 74.23804382250667
  },
  {
    "id": 5,
    "name": "Balumama Temple Rukadi",
    "lat": 16.72791181630548,
    "lng": 74.3793262889843
  },
  {
    "id": 6,
    "name": "Bindu Chowk",
    "lat": 16.6960031210862,
    "lng": 74.22726966668587
  },
  {
    "id": 7,
    "name": "Ch. Shivaji Maharaj Chowk",
    "lat": 16.716423491110422,
    "lng": 74.232358826209
  },
  {
    "id": 8,
    "name": "Commerce College",
    "lat": 16.69556227313265,
    "lng": 74.22879168017829
  },
  {
    "id": 9,
    "name": "Crusher V R Plaza",
    "lat": 16.669823021547437,
    "lng": 74.19974335862284
  },
  {
    "id": 10,
    "name": "Cyber",
    "lat": 16.705093672717737,
    "lng": 74.24332186853707
  },
  {
    "id": 11,
    "name": "Devkar Panand",
    "lat": 16.675630781537045,
    "lng": 74.21394542435706
  },
  {
    "id": 12,
    "name": "Dhanwade Vihir",
    "lat": 16.701042285744826,
    "lng": 74.24199019552182
  },
  {
    "id": 13,
    "name": "Dr. Pasricha Nagar",
    "lat": 16.67476469394659,
    "lng": 74.27405428017785
  },
  {
    "id": 14,
    "name": "Filter House",
    "lat": 16.679032752849338,
    "lng": 74.22238588017797
  },
  {
    "id": 15,
    "name": "Gadmudshingi Phata",
    "lat": 16.688232808580317,
    "lng": 74.3001321596235
  },
  {
    "id": 16,
    "name": "Ganesh Bhakta Mandal Arch",
    "lat": 16.700312944831136,
    "lng": 74.23296804969699
  },
  {
    "id": 17,
    "name": "Ghatge Patil Industries",
    "lat": 16.69394225807903,
    "lng": 74.26883255069725
  },
  {
    "id": 18,
    "name": "Gokul Shirgaon",
    "lat": 16.640619841297642,
    "lng": 74.27631670900682
  },
  {"id": 19, "name": "ITI", "lat": 16.67522522660594, "lng": 74.22047546483446},
  {
    "id": 20,
    "name": "Ichalkaranji Road Railway Gate",
    "lat": 16.681909757049972,
    "lng": 74.42895183784961
  },
  {
    "id": 21,
    "name": "Kabarstan",
    "lat": 16.74171602825701,
    "lng": 74.24266505937398
  },
  {
    "id": 22,
    "name": "Kagal Laxmi Mandir",
    "lat": 16.601577789816204,
    "lng": 74.32625127361366
  },
  {
    "id": 23,
    "name": "Kagal Rural Hospital",
    "lat": 16.59275685116061,
    "lng": 74.31066589737026
  },
  {
    "id": 24,
    "name": "Kagal S. T. Depot",
    "lat": 16.579401335821444,
    "lng": 74.3130297990027
  },
  {
    "id": 25,
    "name": "Kagal S. T. Stand",
    "lat": 16.583380733197007,
    "lng": 74.32075456081279
  },
  {
    "id": 26,
    "name": "Kalamba",
    "lat": 16.670175452387937,
    "lng": 74.22609782877448
  },
  {
    "id": 27,
    "name": "Kalamba Jail",
    "lat": 16.668443456663617,
    "lng": 74.21571561086444
  },
  {
    "id": 28,
    "name": "Kalamba LIC Colony",
    "lat": 16.671018153342363,
    "lng": 74.21666896483434
  },
  {
    "id": 29,
    "name": "Kalamba Sai Temple",
    "lat": 16.666277593242537,
    "lng": 74.21205842033783
  },
  {
    "id": 30,
    "name": "Kandalgaon Phata",
    "lat": 16.634617733984207,
    "lng": 74.24954247604552
  },
  {
    "id": 31,
    "name": "Kaneri Math Phata",
    "lat": 16.619417290632786,
    "lng": 74.27155551086337
  },
  {
    "id": 32,
    "name": "Kaneri Village",
    "lat": 16.624107503764154,
    "lng": 74.27221205615346
  },
  {
    "id": 33,
    "name": "Kaneriwadi",
    "lat": 16.625674930420907,
    "lng": 74.28986188737606
  },
  {
    "id": 34,
    "name": "Khari Corner",
    "lat": 16.691694205327323,
    "lng": 74.22255458017823
  },
  {
    "id": 35,
    "name": "Kogil Khurd",
    "lat": 16.60870963773276,
    "lng": 74.24966399827824
  },
  {
    "id": 36,
    "name": "Kogil Khurd Phata",
    "lat": 16.608556340159154,
    "lng": 74.24965228202727
  },
  {
    "id": 37,
    "name": "Kolhapur Cancer Center",
    "lat": 16.658404833903784,
    "lng": 74.26953712435672
  },
  {
    "id": 38,
    "name": "Kolhapur Railway Station",
    "lat": 16.702871407499035,
    "lng": 74.23791595319364
  },
  {
    "id": 39,
    "name": "Kolhapur S.T. Stand",
    "lat": 16.70357499764675,
    "lng": 74.24325465319365
  },
  {
    "id": 40,
    "name": "Lad Chowk",
    "lat": 16.701411432594416,
    "lng": 74.23284338465872
  },
  {
    "id": 41,
    "name": "Lakshattirtha Vasahat",
    "lat": 16.699535568275962,
    "lng": 74.2020575787959
  },
  {
    "id": 42,
    "name": "MIDC Office",
    "lat": 16.61819532973328,
    "lng": 74.34304417956037
  },
  {
    "id": 43,
    "name": "Maharana Pratap Chowk",
    "lat": 16.698597789663385,
    "lng": 74.22545400901426
  },
  {
    "id": 44,
    "name": "Mangaon",
    "lat": 16.706628262195977,
    "lng": 74.36974482124955
  },
  {
    "id": 45,
    "name": "Mangaon Phata",
    "lat": 16.70802577445189,
    "lng": 74.3722615792519
  },
  {
    "id": 46,
    "name": "Mangaon School",
    "lat": 16.717356802511137,
    "lng": 74.37810278090822
  },
  {
    "id": 47,
    "name": "Mirajkar Tikti",
    "lat": 16.692564245226098,
    "lng": 74.22525908964197
  },
  {
    "id": 48,
    "name": "Mohite Colony Shed",
    "lat": 16.670642565470537,
    "lng": 74.21041064415951
  },
  {
    "id": 49,
    "name": "Nale Colony",
    "lat": 16.676521221879632,
    "lng": 74.2180386447763
  },
  {
    "id": 50,
    "name": "New Kagal Naka",
    "lat": 16.58382900970302,
    "lng": 74.30997450292287
  },
  {
    "id": 51,
    "name": "Nigde Building",
    "lat": 16.654386168097236,
    "lng": 74.24888848946752
  },
  {
    "id": 52,
    "name": "Old Vashi Naka",
    "lat": 16.66910903647443,
    "lng": 74.19964667462493
  },
  {
    "id": 53,
    "name": "Opal Hotel",
    "lat": 16.703437026164536,
    "lng": 74.25051674949177
  },
  {
    "id": 54,
    "name": "Padmaraje Girls High School",
    "lat": 16.69100173482194,
    "lng": 74.22213635134236
  },
  {
    "id": 55,
    "name": "Parvati Talkies",
    "lat": 16.69748583093922,
    "lng": 74.23538019922358
  },
  {
    "id": 56,
    "name": "Pimpalgaon Phata",
    "lat": 16.57647894428589,
    "lng": 74.28732080889178
  },
  {
    "id": 57,
    "name": "RCC Builder",
    "lat": 16.76927701721612,
    "lng": 74.27421196240338
  },
  {
    "id": 58,
    "name": "Race Course Naka",
    "lat": 16.683148179995158,
    "lng": 74.2276214692035
  },
  {
    "id": 59,
    "name": "Rajaram College",
    "lat": 16.686245881557337,
    "lng": 74.25630283327651
  },
  {
    "id": 60,
    "name": "Rajarampuri 6th Street",
    "lat": 16.699420000483954,
    "lng": 74.23901389128513
  },
  {
    "id": 61,
    "name": "Rajarampuri Maruti Temple",
    "lat": 16.69343667036302,
    "lng": 74.2436796027599
  },
  {
    "id": 62,
    "name": "Renuka Temple 11th Street",
    "lat": 16.684277511432093,
    "lng": 74.23180838353525
  },
  {
    "id": 63,
    "name": "Salokhe Nagar",
    "lat": 16.669486557300555,
    "lng": 74.2150686171108
  },
  {
    "id": 64,
    "name": "Sambhajinagar Stand",
    "lat": 16.680612937369013,
    "lng": 74.21961868519482
  },
  {
    "id": 65,
    "name": "Shahaji Law College",
    "lat": 16.699268471334957,
    "lng": 74.2416037243576
  },
  {
    "id": 66,
    "name": "Shahu Naka",
    "lat": 16.66314172376374,
    "lng": 74.26724916271525
  },
  {
    "id": 67,
    "name": "Sham Society",
    "lat": 16.681922643540265,
    "lng": 74.21330579552149
  },
  {
    "id": 68,
    "name": "Sharda Cafe",
    "lat": 16.700302557636846,
    "lng": 74.22765929552179
  },
  {
    "id": 69,
    "name": "Shivaji University",
    "lat": 16.678110646616666,
    "lng": 74.25549208017793
  },
  {
    "id": 70,
    "name": " Shahu Maidan",
    "lat": 16.694384265440352,
    "lng": 74.22617922366473
  },
  {
    "id": 71,
    "name": "Siddagiri High School",
    "lat": 16.612017025658663,
    "lng": 74.26505052124172
  },
  {
    "id": 72,
    "name": "Siddagiri Hospital",
    "lat": 16.614605578679967,
    "lng": 74.25784759551986
  },
  {
    "id": 73,
    "name": "Sudarshan Petrol Pump",
    "lat": 16.649519722968996,
    "lng": 74.27422733784893
  },
  {
    "id": 74,
    "name": "Tararani Chowk",
    "lat": 16.680009935473855,
    "lng": 74.22180690901382
  },
  {
    "id": 75,
    "name": "Tawde Hotel",
    "lat": 16.709007155977897,
    "lng": 74.27936606483524
  },
  {
    "id": 76,
    "name": "Tembalai Temple",
    "lat": 16.696212955262652,
    "lng": 74.20280643711898
  },
  {
    "id": 77,
    "name": "Uma Talkies",
    "lat": 16.69696382586418,
    "lng": 74.23176649182416
  },
  {
    "id": 78,
    "name": "Usha Talkies",
    "lat": 16.698316485705153,
    "lng": 74.22771982828726
  },
  {
    "id": 79,
    "name": "Vaibhav Housing Society",
    "lat": 16.66471604213865,
    "lng": 74.26270323869483
  },
  {
    "id": 80,
    "name": "Bharati Vidyapeeth bus stop",
    "lat": 16.6512042,
    "lng": 74.2478324
  },
  {"id": 81, "name": "Kandalgaon kaman", "lat": 16.6500456, "lng": 74.2486890},
  {"id": 82, "name": "Begar vasahat", "lat": 16.6530046, "lng": 74.2461255},
  {"id": 83, "name": "Shree Hall", "lat": 16.6554754, "lng": 74.2446315},
  {
    "id": 84,
    "name": "Khadi cha ganapati",
    "lat": 16.6600118,
    "lng": 74.2414675
  },
  {"id": 85, "name": "RK Nagar", "lat": 16.6613017, "lng": 74.2405877},
  {"id": 86, "name": "RK Nagar naka", "lat": 16.6625316, "lng": 74.2398987},
  {"id": 87, "name": "Matimand shala", "lat": 16.6690322, "lng": 74.2372366},
  {"id": 88, "name": "Shenda park", "lat": 16.6744833, "lng": 74.2367860},
  {"id": 89, "name": "Subhash Nagar", "lat": 16.6765684, "lng": 74.2376182},
  {"id": 90, "name": "Jawahar Nagar", "lat": 16.6819759, "lng": 74.2346121},
  {"id": 91, "name": "Renuka Mandir", "lat": 16.6840860, "lng": 74.2320613},
  {"id": 92, "name": "Kandalgaon Stop 1", "lat": 16.6436423, "lng": 74.2535160},
  {
    "id": 93,
    "name": "Mandlik colony",
    "lat": 16.6889955,
    "lng": 74.2315262,
  },
  {"id": 94, "name": "Gokhale Collage", "lat": 16.6917349, "lng": 74.2315209},
  {"id": 95, "name": "CPR Hospital", "lat": 16.7024328, "lng": 74.2259938},
  {"id": 96, "name": "Dussra Chowk", "lat": 16.7026697, "lng": 74.2275234},
  {"id": 97, "name": "Ruikar colony", "lat": 16.7076356, "lng": 74.2539076},
  {"id": 98, "name": "Mukt sainik", "lat": 16.7079237, "lng": 74.2615968},
  {"id": 99, "name": "Market yard", "lat": 16.7076167, "lng": 74.2693377},
  {"id": 100, "name": "Sangli phata", "lat": 16.7293314, "lng": 74.2822817},
  {"id": 101, "name": "Shiroli phata", "lat": 16.7347011, "lng": 74.2821100},
  {"id": 102, "name": "Nagoan", "lat": 16.7490113, "lng": 74.2806395},
  {"id": 103, "name": "Tawade Hotel", "lat": 16.7090364, "lng": 74.2794801},
];

final List<Map<String, dynamic>> buses = [
  {
    "id": 1,
    "name": "Apte Nagar - Surve Nagar to Kagal",
    "busNumber": "KG-001",
    "startStopName": "Apte Nagar Naveen Naka",
    "startTime": "06:00 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "07:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:00 AM", "id": 26}, // Kalamba
      {"arrivalTime": "06:10 AM", "id": 26}, // Kalamba
      {"arrivalTime": "06:05 AM", "id": 2}, // Apte Nagar Naveen Naka
      {"arrivalTime": "06:15 AM", "id": 63}, // Salokhe Nagar
      {"arrivalTime": "06:25 AM", "id": 48}, // Mohite Colony Shed
      {"arrivalTime": "06:35 AM", "id": 64}, // Sambhajinagar Stand
      {"arrivalTime": "06:45 AM", "id": 14}, // Filter House
      {"arrivalTime": "06:55 AM", "id": 58}, // Race Course Naka
      {"arrivalTime": "07:05 AM", "id": 40}, // Lad Chowk
      {"arrivalTime": "07:15 AM", "id": 54}, // Padmaraje Girls High School
      {"arrivalTime": "07:25 AM", "id": 34}, // Khari Corner
    ]
  },
  {
    "id": 2,
    "name": "Kalamba to Kagal (Via Uchgaon)",
    "busNumber": "KG-002",
    "startStopName": "Kalamba",
    "startTime": "07:00 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "08:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:10 AM", "id": 26}, // Kalamba
      {"arrivalTime": "08:10 AM", "id": 26}, // Kalamba
      {"arrivalTime": "09:10 AM", "id": 26}, // Kalamba
      {"arrivalTime": "0:10 AM", "id": 26}, // Kalamba
      {"arrivalTime": "07:20 AM", "id": 29}, // Kalamba Sai Temple
      {"arrivalTime": "07:30 AM", "id": 19}, // ITI
      {"arrivalTime": "07:40 AM", "id": 14}, // Filter House
      {"arrivalTime": "07:50 AM", "id": 58}, // Race Course Naka
      {"arrivalTime": "08:00 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:10 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:20 AM", "id": 74}, // Tararani Chowk
      {"arrivalTime": "08:30 AM", "id": 53}, // Opal Hotel
    ]
  },
  {
    "id": 3,
    "name": "Bondre Nagar to Kagal (Via Tawde Hotel)",
    "busNumber": "KG-003",
    "startStopName": "Bondre Nagar",
    "startTime": "06:30 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "08:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:45 AM", "id": 75}, // Tawde Hotel
      {"arrivalTime": "06:55 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "07:05 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "07:15 AM", "id": 78}, // Usha Talkies
      {"arrivalTime": "07:25 AM", "id": 74}, // Tararani Chowk
      {"arrivalTime": "07:35 AM", "id": 51}, // Nigde Building
      {"arrivalTime": "07:45 AM", "id": 15}, // Gadmudshingi Phata
    ]
  },
  {
    "id": 4,
    "name": "Salokhe Nagar to Kagal (Via Rajarampuri)",
    "busNumber": "KG-004",
    "startStopName": "Salokhe Nagar",
    "startTime": "07:15 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:25 AM", "id": 63}, // Salokhe Nagar
      {"arrivalTime": "07:35 AM", "id": 1}, // Apang Purnavsan Society
      {"arrivalTime": "07:45 AM", "id": 9}, // Crusher V R Plaza
      {"arrivalTime": "07:55 AM", "id": 11}, // Devkar Panand
      {"arrivalTime": "08:05 AM", "id": 67}, // Sham Society
      {"arrivalTime": "08:15 AM", "id": 52}, // Old Vashi Naka
      {"arrivalTime": "08:25 AM", "id": 40}, // Lad Chowk
      {"arrivalTime": "08:35 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "08:45 AM", "id": 39}, // Kolhapur S.T. Stand
    ]
  },
  {
    "id": 5,
    "name": "Hariom Nagar to Kanerimath",
    "busNumber": "KG-005",
    "startStopName": "Shalini Palace",
    "startTime": "06:45 AM",
    "destinationStopName": "Kaneri Math Phata",
    "destinationStopTime": "08:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:55 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "07:05 AM", "id": 6}, // Bindu Chowk
      {"arrivalTime": "07:15 AM", "id": 8}, // Commerce College
      {"arrivalTime": "07:25 AM", "id": 77}, // Uma Talkies
      {"arrivalTime": "07:35 AM", "id": 55}, // Parvati Talkies
      {"arrivalTime": "07:45 AM", "id": 4}, // Bagal Chowk
      {"arrivalTime": "07:55 AM", "id": 3}, // BT College
      {"arrivalTime": "08:10 AM", "id": 31}, // Kaneri Math Phata
    ]
  },
  {
    "id": 6,
    "name": "Lakshattirtha Vasahat to Rukdi Mangaon",
    "busNumber": "KG-006",
    "startStopName": "Lakshattirtha Vasahat",
    "startTime": "08:00 AM",
    "destinationStopName": "Mangaon",
    "destinationStopTime": "09:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 41}, // Lakshattirtha Vasahat
      {"arrivalTime": "08:20 AM", "id": 16}, // Ganesh Bhakta Mandal Arch
      {"arrivalTime": "08:35 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "08:45 AM", "id": 43}, // Maharana Pratap Chowk
      {"arrivalTime": "08:55 AM", "id": 68}, // Sharda Cafe
      {"arrivalTime": "09:05 AM", "id": 78}, // Usha Talkies
      {"arrivalTime": "09:15 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "09:30 AM", "id": 44}, // Mangaon
    ]
  },
  {
    "id": 7,
    "name": "Kandalgaon to Nagaon",
    "busNumber": "KG-007",
    "startStopName": "Kandalgaon",
    "startTime": "07:30 AM",
    "destinationStopName": "Nangaon",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:30 AM", "id": 30}, // Kandalgaon phata
      {"arrivalTime": "07:00 AM", "id": 30}, // Kandalgaon phata
      {"arrivalTime": "06:30 AM", "id": 92}, // Kandalgaon 1st Stop
      {"arrivalTime": "07:00 AM", "id": 92}, // Kandalgaon 1st Stop
      {"arrivalTime": "06:32 AM", "id": 80}, // Kandalgaon Bharati Vidyapeeth
      {"arrivalTime": "07:02 AM", "id": 80}, // Kandalgaon Bharati Vidyapeeth
      {"arrivalTime": "06:34 AM", "id": 83}, // Shree Hall
      {"arrivalTime": "07:04 AM", "id": 83}, // Shree Hall
      {"arrivalTime": "06:36 AM", "id": 84}, // RK Nagar Ganapati
      {"arrivalTime": "07:06 AM", "id": 84}, // RK Nagar Ganapati
      {"arrivalTime": "06:38 AM", "id": 86}, // RK Nagar Zakat Naka
      {"arrivalTime": "07:08 AM", "id": 86}, // RK Nagar Zakat Naka
      {"arrivalTime": "06:40 AM", "id": 87}, // Matimand School
      {"arrivalTime": "07:10 AM", "id": 87}, // Matimand School
      {"arrivalTime": "06:42 AM", "id": 88}, // Shenda Park
      {"arrivalTime": "07:12 AM", "id": 88}, // Shenda Park
      {"arrivalTime": "06:44 AM", "id": 89}, // Subhashnagar Chowk
      {"arrivalTime": "07:14 AM", "id": 89}, // Subhashnagar Chowk
      {"arrivalTime": "06:47 AM", "id": 90}, // Jawahar nagar
      {"arrivalTime": "07:16 AM", "id": 90}, // Jawahar nagar
      {"arrivalTime": "06:50 AM", "id": 91}, // Renuka Mandir
      {"arrivalTime": "07:18 AM", "id": 91}, // Renuka Mandir
      {"arrivalTime": "06:54 AM", "id": 93}, // Mandalik Colony
      {"arrivalTime": "07:20 AM", "id": 93}, // Mandalik Colony
      {"arrivalTime": "06:56 AM", "id": 15}, // Gopal Krishna Gokhale College
      {"arrivalTime": "07:22 AM", "id": 15}, // Gopal Krishna Gokhale College
      {"arrivalTime": "06:58 AM", "id": 70}, // Shri Shahu Stadium
      {"arrivalTime": "07:24 AM", "id": 70}, // Shri Shahu Stadium
      {"arrivalTime": "07:05 AM", "id": 06}, // Bindu Chowk
      {"arrivalTime": "07:26 AM", "id": 06}, // Bindu Chowk
      {"arrivalTime": "07:07 AM", "id": 07}, // Shivaji Maharaj Chowk
      {"arrivalTime": "07:28 AM", "id": 07}, // Shivaji Maharaj Chowk
      {"arrivalTime": "07:09 AM", "id": 95}, // CPR Hospital
      {"arrivalTime": "07:30 AM", "id": 95}, // CPR Hospital
      {"arrivalTime": "07:11 AM", "id": 96}, // Dussehra Chowk
      {"arrivalTime": "07:32 AM", "id": 96}, // Dussehra Chowk
      {"arrivalTime": "07:13 AM", "id": 78}, // Usha Talkies
      {"arrivalTime": "07:35 AM", "id": 78}, // Usha Talkies
      {"arrivalTime": "07:15 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "07:37 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "07:17 AM", "id": 39}, // Kolhapur ST Stand
      {"arrivalTime": "07:39 AM", "id": 39}, // Kolhapur ST Stand
      {"arrivalTime": "07:19 AM", "id": 74}, // Tararani Chowk
      {"arrivalTime": "07:41 AM", "id": 74}, // Tararani Chowk
      {"arrivalTime": "07:21 AM", "id": 97}, // Ruikar Colony
      {"arrivalTime": "07:43 AM", "id": 97}, // Ruikar Colony
      {"arrivalTime": "07:23 AM", "id": 98}, // Mukta Sainik Colony
      {"arrivalTime": "07:45 AM", "id": 98}, // Mukta Sainik Colony
      {"arrivalTime": "07:27 AM", "id": 99}, // Shri Shahu Market Yard
      {"arrivalTime": "07:47 AM", "id": 99}, // Shri Shahu Market Yard
      {"arrivalTime": "07:31 AM", "id": 103}, // Tawde Hotel
      {"arrivalTime": "07:49 AM", "id": 103}, // Tawde Hotel
      {"arrivalTime": "07:33 AM", "id": 100}, // Sangli Phata
      {"arrivalTime": "07:51 AM", "id": 100}, // Sangli Phata
      {"arrivalTime": "07:35 AM", "id": 101}, // Shiroli Phata
      {"arrivalTime": "07:53 AM", "id": 101}, // Shiroli Phata
      {"arrivalTime": "07:40 AM", "id": 102}, // Nagaon
      {"arrivalTime": "08:10 AM", "id": 102} // Nagaon
    ]
  },
  {
    "id": 8,
    "name": "Morewadi to Shiroli",
    "busNumber": "KG-008",
    "startStopName": "Morewadi",
    "startTime": "06:20 AM",
    "destinationStopName": "Tararani Chowk",
    "destinationStopTime": "07:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:35 AM", "id": 6}, // Bindu Chowk
      {"arrivalTime": "06:45 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "06:55 AM", "id": 78}, // Usha Talkies
      {"arrivalTime": "07:05 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "07:20 AM", "id": 74}, // Tararani Chowk
    ]
  },
  {
    "id": 9,
    "name": "Kalamba to Sugar Mill (Via Mahavir College)",
    "busNumber": "KG-009",
    "startStopName": "Kalamba",
    "startTime": "07:45 AM",
    "destinationStopName": "Ch. Rajaram Co. SugarFactory",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 26}, // Kalamba
      {"arrivalTime": "08:05 AM", "id": 19}, // ITI
      {"arrivalTime": "08:15 AM", "id": 14}, // Filter House
      {"arrivalTime": "08:25 AM", "id": 40}, // Lad Chowk
      {"arrivalTime": "08:35 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "08:45 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "09:00 AM", "id": 57}, // RCC Builder
    ]
  },
  {
    "id": 10,
    "name": "Sugar Mill to Shivaji University",
    "busNumber": "KG-010",
    "startStopName": "Ch. Rajaram Co. SugarFactory",
    "startTime": "08:30 AM",
    "destinationStopName": "Shivaji University",
    "destinationStopTime": "10:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:45 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "08:55 AM", "id": 6}, // Bindu Chowk
      {"arrivalTime": "09:05 AM", "id": 77}, // Uma Talkies
      {"arrivalTime": "09:15 AM", "id": 55}, // Parvati Talkies
      {"arrivalTime": "09:25 AM", "id": 4}, // Bagal Chowk
      {"arrivalTime": "09:35 AM", "id": 3}, // BT College
      {"arrivalTime": "09:45 AM", "id": 69}, // Shivaji University
    ]
  },
  {
    "id": 11,
    "name": "Pachgaon to Kadamwadi",
    "busNumber": "KG-011",
    "startStopName": "ITI",
    "startTime": "06:50 AM",
    "destinationStopName": "Kadamwadi Mahadev Temple",
    "destinationStopTime": "08:25 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:00 AM", "id": 19}, // ITI
      {"arrivalTime": "07:10 AM", "id": 14}, // Filter House
      {"arrivalTime": "07:20 AM", "id": 58}, // Race Course Naka
      {"arrivalTime": "07:30 AM", "id": 40}, // Lad Chowk
      {"arrivalTime": "07:40 AM", "id": 54}, // Padmaraje Girls High School
      {"arrivalTime": "07:50 AM", "id": 34}, // Khari Corner
      {"arrivalTime": "08:05 AM", "id": 78}, // Usha Talkies
      {"arrivalTime": "08:15 AM", "id": 38}, // Kolhapur Railway Station
    ]
  },
  {
    "id": 12,
    "name": "Shahu Maidan Circular Route",
    "busNumber": "KG-012",
    "startStopName": "Shri Shahu Maidan",
    "startTime": "07:00 AM",
    "destinationStopName": "Shri Shahu Maidan",
    "destinationStopTime": "08:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:15 AM", "id": 70}, // Shri Shahu Maidan
      {"arrivalTime": "07:25 AM", "id": 6}, // Bindu Chowk
      {"arrivalTime": "07:35 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "07:50 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "08:00 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:15 AM", "id": 54}, // Padmaraje Girls High School
      {"arrivalTime": "08:30 AM", "id": 70}, // Shri Shahu Maidan
    ]
  },
  {
    "id": 13,
    "name": "Jatharwadi to Sant Gora Colony",
    "busNumber": "KG-013",
    "startStopName": "Panchganga Hospital",
    "startTime": "08:15 AM",
    "destinationStopName": "Sant Gora Kumbhar Colony",
    "destinationStopTime": "09:50 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:30 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "08:40 AM", "id": 43}, // Maharana Pratap Chowk
      {"arrivalTime": "08:50 AM", "id": 68}, // Sharda Cafe
      {"arrivalTime": "09:00 AM", "id": 78}, // Usha Talkies
      {"arrivalTime": "09:10 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "09:25 AM", "id": 74}, // Tararani Chowk
    ]
  },
  {
    "id": 14,
    "name": "Krantisinh Nana Patil Nagar to Mudshingi",
    "busNumber": "KG-014",
    "startStopName": "Krantisinh Nana Patil Nagar",
    "startTime": "06:30 AM",
    "destinationStopName": "Gadmudshingi village",
    "destinationStopTime": "08:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "06:40 AM", "id": 9}, // Crusher V R Plaza
      {"arrivalTime": "06:50 AM", "id": 11}, // Devkar Panand
      {"arrivalTime": "07:00 AM", "id": 64}, // Sambhajinagar Stand
      {"arrivalTime": "07:10 AM", "id": 14}, // Filter House
      {"arrivalTime": "07:20 AM", "id": 58}, // Race Course Naka
      {"arrivalTime": "07:30 AM", "id": 40}, // Lad Chowk
      {"arrivalTime": "07:45 AM", "id": 15}, // Gadmudshingi Phata
    ]
  },
  {
    "id": 15,
    "name": "Kalamba to Kagal (Via Rajarampuri)",
    "busNumber": "KG-015",
    "startStopName": "Kalamba",
    "startTime": "07:00 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:10 AM", "id": 26}, // Kalamba
      {"arrivalTime": "07:20 AM", "id": 19}, // ITI
      {"arrivalTime": "07:30 AM", "id": 14}, // Filter House
      {"arrivalTime": "07:40 AM", "id": 40}, // Lad Chowk
      {"arrivalTime": "07:50 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "08:05 AM", "id": 3}, // BT College
      {"arrivalTime": "08:20 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:40 AM", "id": 25}, // Kagal S. T. Stand
    ]
  },
  {
    "id": 16,
    "name": "Gangavesh to Shiroli Dumala",
    "busNumber": "KG-016",
    "startStopName": "Gangavesh",
    "startTime": "08:00 AM",
    "destinationStopName": "Shiroli Dumala",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "08:20 AM", "id": 78}, // Usha Talkies
      {"arrivalTime": "08:30 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:45 AM", "id": 74}, // Tararani Chowk
      {"arrivalTime": "09:00 AM", "id": 51}, // Nigde Building
    ]
  },
  {
    "id": 17,
    "name": "Market Yard - Stand -Bodrenagar Route",
    "busNumber": "KG-017",
    "startStopName": "Market Yard",
    "startTime": "06:45 AM",
    "destinationStopName": "Vishal Nagar",
    "destinationStopTime": "08:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:00 AM", "id": 64}, // Sambhajinagar Stand
      {"arrivalTime": "07:10 AM", "id": 14}, // Filter House
      {"arrivalTime": "07:20 AM", "id": 58}, // Race Course Naka
      {"arrivalTime": "07:30 AM", "id": 40}, // Lad Chowk
      {"arrivalTime": "07:45 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:00 AM", "id": 78}, // Usha Talkies
      {"arrivalTime": "08:15 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
    ]
  },
  {
    "id": 18,
    "name": "Shahu Maidan to Sugar Mill",
    "busNumber": "KG-018",
    "startStopName": "Shri Shahu Maidan",
    "startTime": "07:15 AM",
    "destinationStopName": "Ch. Rajaram Co. SugarFactory",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:25 AM", "id": 70}, // Shri Shahu Maidan
      {"arrivalTime": "07:35 AM", "id": 6}, // Bindu Chowk
      {"arrivalTime": "07:45 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "08:00 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "08:15 AM", "id": 57}, // RCC Builder
      {"arrivalTime": "08:30 AM", "id": 15}, // Gadmudshingi Phata
    ]
  },
  {
    "id": 19,
    "name": "ITI to Shivaji University Express",
    "busNumber": "KG-019",
    "startStopName": "ITI",
    "startTime": "08:00 AM",
    "destinationStopName": "Shivaji University",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 19}, // ITI
      {"arrivalTime": "08:20 AM", "id": 14}, // Filter House
      {"arrivalTime": "08:30 AM", "id": 40}, // Lad Chowk
      {"arrivalTime": "08:40 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "08:50 AM", "id": 69}, // Shivaji University
    ]
  },
  {
    "id": 20,
    "name": "Kagal Rural Hospital Special",
    "busNumber": "KG-020",
    "startStopName": "Kolhapur Railway Station",
    "startTime": "07:30 AM",
    "destinationStopName": "Kagal Rural Hospital",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "07:50 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:05 AM", "id": 23}, // Kagal Rural Hospital
    ]
  },
  {
    "id": 21,
    "name": "Night Service - Shivaji University to Kagal",
    "busNumber": "KG-021",
    "startStopName": "Shivaji University",
    "startTime": "10:00 PM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "11:30 PM",
    "inbetweenStops": [
      {"arrivalTime": "10:15 PM", "id": 69}, // Shivaji University
      {"arrivalTime": "10:30 PM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "10:45 PM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "11:00 PM", "id": 25}, // Kagal S. T. Stand
    ]
  },
  {
    "id": 22,
    "name": "Early Morning - Kalamba to Kagal",
    "busNumber": "KG-022",
    "startStopName": "Kalamba",
    "startTime": "05:30 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "07:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "05:40 AM", "id": 26}, // Kalamba
      {"arrivalTime": "05:50 AM", "id": 19}, // ITI
      {"arrivalTime": "06:00 AM", "id": 14}, // Filter House
      {"arrivalTime": "06:15 AM", "id": 40}, // Lad Chowk
      {"arrivalTime": "06:30 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "06:45 AM", "id": 25}, // Kagal S. T. Stand
    ]
  },
  {
    "id": 23,
    "name": "College Special - Shivaji University to Commerce College",
    "busNumber": "KG-023",
    "startStopName": "Shivaji University",
    "startTime": "07:45 AM",
    "destinationStopName": "Commerce College",
    "destinationStopTime": "08:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "08:05 AM", "id": 7}, // Ch. Shivaji Maharaj Chowk
      {"arrivalTime": "08:15 AM", "id": 6}, // Bindu Chowk
      {"arrivalTime": "08:25 AM", "id": 8}, // Commerce College
    ]
  },
  {
    "id": 24,
    "name": "Kagal Laxmi Mandir to Kolhapur Cancer Center",
    "busNumber": "KG-024",
    "startStopName": "Kagal Laxmi Mandir",
    "startTime": "07:00 AM",
    "destinationStopName": "Kolhapur Cancer Center",
    "destinationStopTime": "08:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:10 AM", "id": 22}, // Kagal Laxmi Mandir
      {"arrivalTime": "07:20 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "07:35 AM", "id": 23}, // Kagal Rural Hospital
      {"arrivalTime": "07:50 AM", "id": 25}, // Kagal S. T. Stand
      {"arrivalTime": "08:05 AM", "id": 37}, // Kolhapur Cancer Center
    ]
  },
  {
    "id": 25,
    "name": "Shivaji University to Gokul Shirgaon",
    "busNumber": "KG-025",
    "startStopName": "Shivaji University",
    "startTime": "08:15 AM",
    "destinationStopName": "Gokul Shirgaon",
    "destinationStopTime": "09:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:25 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "08:35 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:50 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "09:05 AM", "id": 18}, // Gokul Shirgaon
    ]
  },
  {
    "id": 26,
    "name": "Kalamba to Kaneri Village",
    "busNumber": "KG-026",
    "startStopName": "Kalamba",
    "startTime": "07:30 AM",
    "destinationStopName": "Kaneri Village",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 26}, // Kalamba
      {"arrivalTime": "07:50 AM", "id": 19}, // ITI
      {"arrivalTime": "08:00 AM", "id": 14}, // Filter House
      {"arrivalTime": "08:15 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:30 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:45 AM", "id": 32}, // Kaneri Village
    ]
  },
  {
    "id": 27,
    "name": "Shahu Naka to Kagal S.T. Stand",
    "busNumber": "KG-027",
    "startStopName": "Shahu Naka",
    "startTime": "08:00 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 66}, // Shahu Naka
      {"arrivalTime": "09:10 AM", "id": 66}, // Shahu Naka
      {"arrivalTime": "08:20 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:35 AM", "id": 23}, // Kagal Rural Hospital
      {"arrivalTime": "08:50 AM", "id": 25}, // Kagal S. T. Stand
    ]
  },
  {
    "id": 28,
    "name": "Kolhapur Railway Station to Kagal Laxmi Mandir",
    "busNumber": "KG-028",
    "startStopName": "Kolhapur Railway Station",
    "startTime": "07:45 AM",
    "destinationStopName": "Kagal Laxmi Mandir",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:05 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:20 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:35 AM", "id": 23}, // Kagal Rural Hospital
      {"arrivalTime": "08:50 AM", "id": 22}, // Kagal Laxmi Mandir
    ]
  },
  {
    "id": 29,
    "name": "Shivaji University to Kaneri Math Phata",
    "busNumber": "KG-029",
    "startStopName": "Shivaji University",
    "startTime": "08:30 AM",
    "destinationStopName": "Kaneri Math Phata",
    "destinationStopTime": "10:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:40 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "08:50 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "09:05 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "09:20 AM", "id": 31}, // Kaneri Math Phata
    ]
  },
  {
    "id": 30,
    "name": "Kagal S.T. Stand to Kolhapur Railway Station",
    "busNumber": "KG-030",
    "startStopName": "Kagal S. T. Stand",
    "startTime": "06:45 AM",
    "destinationStopName": "Kolhapur Railway Station",
    "destinationStopTime": "08:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:00 AM", "id": 25}, // Kagal S. T. Stand
      {"arrivalTime": "07:15 AM", "id": 23}, // Kagal Rural Hospital
      {"arrivalTime": "07:30 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "07:45 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:00 AM", "id": 38}, // Kolhapur Railway Station
    ]
  },
  {
    "id": 31,
    "name": "Kolhapur Cancer Center to Kagal Rural Hospital",
    "busNumber": "KG-031",
    "startStopName": "Kolhapur Cancer Center",
    "startTime": "07:15 AM",
    "destinationStopName": "Kagal Rural Hospital",
    "destinationStopTime": "08:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:25 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "07:40 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "07:55 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:10 AM", "id": 23}, // Kagal Rural Hospital
    ]
  },
  {
    "id": 32,
    "name": "Gokul Shirgaon to Shivaji University",
    "busNumber": "KG-032",
    "startStopName": "Gokul Shirgaon",
    "startTime": "08:00 AM",
    "destinationStopName": "Shivaji University",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 18}, // Gokul Shirgaon
      {"arrivalTime": "08:25 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "08:40 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:55 AM", "id": 69}, // Shivaji University
    ]
  },
  {
    "id": 33,
    "name": "Kaneri Village to Kolhapur Railway Station",
    "busNumber": "KG-033",
    "startStopName": "Kaneri Village",
    "startTime": "07:30 AM",
    "destinationStopName": "Kolhapur Railway Station",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 32}, // Kaneri Village
      {"arrivalTime": "07:55 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:10 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:25 AM", "id": 38}, // Kolhapur Railway Station
    ]
  },
  {
    "id": 34,
    "name": "Shivaji University to Kagal S.T. Stand",
    "busNumber": "KG-034",
    "startStopName": "Shivaji University",
    "startTime": "07:45 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "08:05 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:20 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:35 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:50 AM", "id": 25}, // Kagal S. T. Stand
    ]
  },
  {
    "id": 35,
    "name": "Kagal Rural Hospital to Kolhapur Railway Station",
    "busNumber": "KG-035",
    "startStopName": "Kagal Rural Hospital",
    "startTime": "08:00 AM",
    "destinationStopName": "Kolhapur Railway Station",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 23}, // Kagal Rural Hospital
      {"arrivalTime": "08:25 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:40 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:55 AM", "id": 38}, // Kolhapur Railway Station
    ]
  },
  {
    "id": 36,
    "name": "Kolhapur Cancer Center to Kagal S.T. Stand",
    "busNumber": "KG-036",
    "startStopName": "Kolhapur Cancer Center",
    "startTime": "07:30 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "07:55 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:10 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:25 AM", "id": 25}, // Kagal S. T. Stand
    ]
  },
  {
    "id": 37,
    "name": "Gokul Shirgaon to Kagal Laxmi Mandir",
    "busNumber": "KG-037",
    "startStopName": "Gokul Shirgaon",
    "startTime": "08:15 AM",
    "destinationStopName": "Kagal Laxmi Mandir",
    "destinationStopTime": "09:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:25 AM", "id": 18}, // Gokul Shirgaon
      {"arrivalTime": "08:40 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "08:55 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "09:10 AM", "id": 22}, // Kagal Laxmi Mandir
    ]
  },
  {
    "id": 38,
    "name": "Kaneri Math Phata to Kolhapur S.T. Stand",
    "busNumber": "KG-038",
    "startStopName": "Kaneri Math Phata",
    "startTime": "07:45 AM",
    "destinationStopName": "Kolhapur S.T. Stand",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:10 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:25 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:40 AM", "id": 39}, // Kolhapur S.T. Stand
    ]
  },
  {
    "id": 39,
    "name": "Kagal S.T. Stand to Kaneri Village",
    "busNumber": "KG-039",
    "startStopName": "Kagal S. T. Stand",
    "startTime": "08:00 AM",
    "destinationStopName": "Kaneri Village",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 25}, // Kagal S. T. Stand
      {"arrivalTime": "08:25 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:40 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:55 AM", "id": 32}, // Kaneri Village
    ]
  },
  {
    "id": 40,
    "name": "Kolhapur Railway Station to Gokul Shirgaon",
    "busNumber": "KG-040",
    "startStopName": "Kolhapur Railway Station",
    "startTime": "07:30 AM",
    "destinationStopName": "Gokul Shirgaon",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "07:55 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "08:10 AM", "id": 18}, // Gokul Shirgaon
    ]
  },
  {
    "id": 41,
    "name": "Kagal Laxmi Mandir to Kaneri Math Phata",
    "busNumber": "KG-041",
    "startStopName": "Kagal Laxmi Mandir",
    "startTime": "08:15 AM",
    "destinationStopName": "Kaneri Math Phata",
    "destinationStopTime": "09:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:25 AM", "id": 22}, // Kagal Laxmi Mandir
      {"arrivalTime": "08:40 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:55 AM", "id": 31}, // Kaneri Math Phata
    ]
  },
  {
    "id": 42,
    "name": "Shivaji University to Kagal Rural Hospital",
    "busNumber": "KG-042",
    "startStopName": "Shivaji University",
    "startTime": "07:45 AM",
    "destinationStopName": "Kagal Rural Hospital",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "08:10 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:25 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:40 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:55 AM", "id": 23}, // Kagal Rural Hospital
    ]
  },
  {
    "id": 43,
    "name": "Kolhapur Cancer Center to Gokul Shirgaon",
    "busNumber": "KG-043",
    "startStopName": "Kolhapur Cancer Center",
    "startTime": "08:00 AM",
    "destinationStopName": "Gokul Shirgaon",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:25 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "08:40 AM", "id": 18}, // Gokul Shirgaon
    ]
  },
  {
    "id": 44,
    "name": "Kagal S.T. Stand to Shivaji University",
    "busNumber": "KG-044",
    "startStopName": "Kagal S. T. Stand",
    "startTime": "07:00 AM",
    "destinationStopName": "Shivaji University",
    "destinationStopTime": "08:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:10 AM", "id": 25}, // Kagal S. T. Stand
      {"arrivalTime": "07:25 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "07:40 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "07:55 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:10 AM", "id": 69}, // Shivaji University
    ]
  },
  {
    "id": 45,
    "name": "Kaneri Village to Kagal Laxmi Mandir",
    "busNumber": "KG-045",
    "startStopName": "Kaneri Village",
    "startTime": "08:15 AM",
    "destinationStopName": "Kagal Laxmi Mandir",
    "destinationStopTime": "09:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:25 AM", "id": 32}, // Kaneri Village
      {"arrivalTime": "08:40 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:55 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "09:10 AM", "id": 22}, // Kagal Laxmi Mandir
    ]
  },
  {
    "id": 46,
    "name": "Kolhapur Railway Station to Kaneri Math Phata",
    "busNumber": "KG-046",
    "startStopName": "Kolhapur Railway Station",
    "startTime": "07:30 AM",
    "destinationStopName": "Kaneri Math Phata",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "07:55 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:10 AM", "id": 31}, // Kaneri Math Phata
    ]
  },
  {
    "id": 47,
    "name": "Kagal Rural Hospital to Shivaji University",
    "busNumber": "KG-047",
    "startStopName": "Kagal Rural Hospital",
    "startTime": "08:00 AM",
    "destinationStopName": "Shivaji University",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 23}, // Kagal Rural Hospital
      {"arrivalTime": "08:25 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:40 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:55 AM", "id": 69}, // Shivaji University
    ]
  },
  {
    "id": 48,
    "name": "Gokul Shirgaon to Kaneri Village",
    "busNumber": "KG-048",
    "startStopName": "Gokul Shirgaon",
    "startTime": "07:45 AM",
    "destinationStopName": "Kaneri Village",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 18}, // Gokul Shirgaon
      {"arrivalTime": "08:10 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "08:25 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:40 AM", "id": 32}, // Kaneri Village
    ]
  },
  {
    "id": 49,
    "name": "Kagal Laxmi Mandir to Kolhapur Cancer Center",
    "busNumber": "KG-049",
    "startStopName": "Kagal Laxmi Mandir",
    "startTime": "08:30 AM",
    "destinationStopName": "Kolhapur Cancer Center",
    "destinationStopTime": "10:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:40 AM", "id": 22}, // Kagal Laxmi Mandir
      {"arrivalTime": "08:55 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "09:10 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "09:25 AM", "id": 37}, // Kolhapur Cancer Center
    ]
  },
  {
    "id": 50,
    "name": "Kaneri Math Phata to Kagal S.T. Stand",
    "busNumber": "KG-050",
    "startStopName": "Kaneri Math Phata",
    "startTime": "07:15 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "08:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:25 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "07:40 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "07:55 AM", "id": 25}, // Kagal S. T. Stand
    ]
  },
  {
    "id": 51,
    "name": "Kolhapur S.T. Stand to Gokul Shirgaon",
    "busNumber": "KG-051",
    "startStopName": "Kolhapur S.T. Stand",
    "startTime": "08:00 AM",
    "destinationStopName": "Gokul Shirgaon",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:25 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "08:40 AM", "id": 18}, // Gokul Shirgaon
    ]
  },
  {
    "id": 52,
    "name": "Kagal Rural Hospital to Kaneri Village",
    "busNumber": "KG-052",
    "startStopName": "Kagal Rural Hospital",
    "startTime": "07:45 AM",
    "destinationStopName": "Kaneri Village",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 23}, // Kagal Rural Hospital
      {"arrivalTime": "08:10 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:25 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:40 AM", "id": 32}, // Kaneri Village
    ]
  },
  {
    "id": 53,
    "name": "Kolhapur Cancer Center to Kagal Laxmi Mandir",
    "busNumber": "KG-053",
    "startStopName": "Kolhapur Cancer Center",
    "startTime": "08:30 AM",
    "destinationStopName": "Kagal Laxmi Mandir",
    "destinationStopTime": "10:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:40 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:55 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "09:10 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "09:25 AM", "id": 22}, // Kagal Laxmi Mandir
    ]
  },
  {
    "id": 54,
    "name": "Shivaji University to Kaneri Village",
    "busNumber": "KG-054",
    "startStopName": "Shivaji University",
    "startTime": "07:30 AM",
    "destinationStopName": "Kaneri Village",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "07:55 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:10 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:25 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:40 AM", "id": 32}, // Kaneri Village
    ]
  },
  {
    "id": 55,
    "name": "Kagal S.T. Stand to Kaneri Math Phata",
    "busNumber": "KG-055",
    "startStopName": "Kagal S. T. Stand",
    "startTime": "08:00 AM",
    "destinationStopName": "Kaneri Math Phata",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 25}, // Kagal S. T. Stand
      {"arrivalTime": "08:25 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:40 AM", "id": 31}, // Kaneri Math Phata
    ]
  },
  {
    "id": 56,
    "name": "Kolhapur Railway Station to Gokul Shirgaon",
    "busNumber": "KG-056",
    "startStopName": "Kolhapur Railway Station",
    "startTime": "07:45 AM",
    "destinationStopName": "Gokul Shirgaon",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:10 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "08:25 AM", "id": 18}, // Gokul Shirgaon
    ]
  },
  {
    "id": 57,
    "name": "Kaneri Village to Kolhapur S.T. Stand",
    "busNumber": "KG-057",
    "startStopName": "Kaneri Village",
    "startTime": "08:15 AM",
    "destinationStopName": "Kolhapur S.T. Stand",
    "destinationStopTime": "09:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:25 AM", "id": 32}, // Kaneri Village
      {"arrivalTime": "08:40 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:55 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "09:10 AM", "id": 39}, // Kolhapur S.T. Stand
    ]
  },
  {
    "id": 58,
    "name": "Kagal Laxmi Mandir to Shivaji University",
    "busNumber": "KG-058",
    "startStopName": "Kagal Laxmi Mandir",
    "startTime": "07:30 AM",
    "destinationStopName": "Shivaji University",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 22}, // Kagal Laxmi Mandir
      {"arrivalTime": "07:55 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:10 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:25 AM", "id": 69}, // Shivaji University
    ]
  },
  {
    "id": 59,
    "name": "Gokul Shirgaon to Kagal S.T. Stand",
    "busNumber": "KG-059",
    "startStopName": "Gokul Shirgaon",
    "startTime": "08:00 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 18}, // Gokul Shirgaon
      {"arrivalTime": "08:25 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "08:40 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:55 AM", "id": 25}, // Kagal S. T. Stand
    ]
  },
  {
    "id": 60,
    "name": "Kolhapur Cancer Center to Kaneri Village",
    "busNumber": "KG-060",
    "startStopName": "Kolhapur Cancer Center",
    "startTime": "07:45 AM",
    "destinationStopName": "Kaneri Village",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:10 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:25 AM", "id": 32}, // Kaneri Village
    ]
  },
  {
    "id": 61,
    "name": "Kagal Rural Hospital to Gokul Shirgaon",
    "busNumber": "KG-061",
    "startStopName": "Kagal Rural Hospital",
    "startTime": "08:30 AM",
    "destinationStopName": "Gokul Shirgaon",
    "destinationStopTime": "10:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:40 AM", "id": 23}, // Kagal Rural Hospital
      {"arrivalTime": "08:55 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "09:10 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "09:25 AM", "id": 18}, // Gokul Shirgaon
    ]
  },
  {
    "id": 62,
    "name": "Kaneri Math Phata to Shivaji University",
    "busNumber": "KG-062",
    "startStopName": "Kaneri Math Phata",
    "startTime": "07:15 AM",
    "destinationStopName": "Shivaji University",
    "destinationStopTime": "08:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:25 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "07:40 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "07:55 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:10 AM", "id": 69}, // Shivaji University
    ]
  },
  {
    "id": 63,
    "name": "Kagal Laxmi Mandir to Kaneri Village",
    "busNumber": "KG-063",
    "startStopName": "Kagal Laxmi Mandir",
    "startTime": "08:00 AM",
    "destinationStopName": "Kaneri Village",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 22}, // Kagal Laxmi Mandir
      {"arrivalTime": "08:25 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:40 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:55 AM", "id": 32}, // Kaneri Village
    ]
  },
  {
    "id": 64,
    "name": "Kolhapur S.T. Stand to Kaneri Village",
    "busNumber": "KG-064",
    "startStopName": "Kolhapur S.T. Stand",
    "startTime": "07:30 AM",
    "destinationStopName": "Kaneri Village",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "07:55 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:10 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:25 AM", "id": 32}, // Kaneri Village
    ]
  },
  {
    "id": 65,
    "name": "Gokul Shirgaon to Kolhapur Cancer Center",
    "busNumber": "KG-065",
    "startStopName": "Gokul Shirgaon",
    "startTime": "08:00 AM",
    "destinationStopName": "Kolhapur Cancer Center",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 18}, // Gokul Shirgaon
      {"arrivalTime": "08:25 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "08:40 AM", "id": 37}, // Kolhapur Cancer Center
    ]
  },
  {
    "id": 66,
    "name": "Kagal Rural Hospital to Kaneri Math Phata",
    "busNumber": "KG-066",
    "startStopName": "Kagal Rural Hospital",
    "startTime": "07:45 AM",
    "destinationStopName": "Kaneri Math Phata",
    "destinationStopTime": "09:15 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 23}, // Kagal Rural Hospital
      {"arrivalTime": "08:10 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:25 AM", "id": 31}, // Kaneri Math Phata
    ]
  },
  {
    "id": 67,
    "name": "Kaneri Village to Kagal S.T. Stand",
    "busNumber": "KG-067",
    "startStopName": "Kaneri Village",
    "startTime": "08:15 AM",
    "destinationStopName": "Kagal S. T. Stand",
    "destinationStopTime": "09:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:25 AM", "id": 32}, // Kaneri Village
      {"arrivalTime": "08:40 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:55 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "09:10 AM", "id": 25}, // Kagal S. T. Stand
    ]
  },
  {
    "id": 68,
    "name": "Kolhapur Railway Station to Kagal Rural Hospital",
    "busNumber": "KG-068",
    "startStopName": "Kolhapur Railway Station",
    "startTime": "07:30 AM",
    "destinationStopName": "Kagal Rural Hospital",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "07:55 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:10 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:25 AM", "id": 23}, // Kagal Rural Hospital
    ]
  },
  {
    "id": 69,
    "name": "Kagal Laxmi Mandir to Kolhapur S.T. Stand",
    "busNumber": "KG-069",
    "startStopName": "Kagal Laxmi Mandir",
    "startTime": "08:00 AM",
    "destinationStopName": "Kolhapur S.T. Stand",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 22}, // Kagal Laxmi Mandir
      {"arrivalTime": "08:25 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:40 AM", "id": 39}, // Kolhapur S.T. Stand
    ]
  },
  {
    "id": 70,
    "name": "Shivaji University to Kagal Rural Hospital",
    "busNumber": "KG-070",
    "startStopName": "Shivaji University",
    "startTime": "07:45 AM",
    "destinationStopName": "Kagal Rural Hospital",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:55 AM", "id": 69}, // Shivaji University
      {"arrivalTime": "08:10 AM", "id": 38}, // Kolhapur Railway Station
      {"arrivalTime": "08:25 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:40 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:55 AM", "id": 23}, // Kagal Rural Hospital
    ]
  },
  {
    "id": 71,
    "name": "Kaneri Math Phata to Gokul Shirgaon",
    "busNumber": "KG-071",
    "startStopName": "Kaneri Math Phata",
    "startTime": "08:15 AM",
    "destinationStopName": "Gokul Shirgaon",
    "destinationStopTime": "09:45 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:25 AM", "id": 31}, // Kaneri Math Phata
      {"arrivalTime": "08:40 AM", "id": 73}, // Sudarshan Petrol Pump
      {"arrivalTime": "08:55 AM", "id": 18}, // Gokul Shirgaon
    ]
  },
  {
    "id": 72,
    "name": "Kagal S.T. Stand to Kolhapur Cancer Center",
    "busNumber": "KG-072",
    "startStopName": "Kagal S. T. Stand",
    "startTime": "07:30 AM",
    "destinationStopName": "Kolhapur Cancer Center",
    "destinationStopTime": "09:00 AM",
    "inbetweenStops": [
      {"arrivalTime": "07:40 AM", "id": 25}, // Kagal S. T. Stand
      {"arrivalTime": "07:55 AM", "id": 50}, // New Kagal Naka
      {"arrivalTime": "08:10 AM", "id": 39}, // Kolhapur S.T. Stand
      {"arrivalTime": "08:25 AM", "id": 37}, // Kolhapur Cancer Center
    ]
  },
  {
    "id": 73,
    "name": "Kolhapur Cancer Center to Kaneri Math Phata",
    "busNumber": "KG-073",
    "startStopName": "Kolhapur Cancer Center",
    "startTime": "08:00 AM",
    "destinationStopName": "Kaneri Math Phata",
    "destinationStopTime": "09:30 AM",
    "inbetweenStops": [
      {"arrivalTime": "08:10 AM", "id": 37}, // Kolhapur Cancer Center
      {"arrivalTime": "08:25 AM", "id": 31}, // Kaneri Math Phata
    ]
  },
];

List<Map<String, dynamic>> sortBusStopsByDistance(Position userPosition) {
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
