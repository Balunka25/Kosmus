// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:cronus/data/fetch_planet_info.dart';


// class PlanetInfo extends StatefulWidget {
//   final String name;
//   final int? id;
//   final String? discoveredBy;

//   const PlanetInfo(
//       {required this.name,
//       Key? key,
//       this.id,
//       this.discoveredBy,
//       })
//       : super(key: key);

//   @override
//   State<PlanetInfo> createState() => _PlanetInfoState();
// }

// class _PlanetInfoState extends State<PlanetInfo> {
//   bool toggle = false;
//   bool loading = false;
//   late Future<Album> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchPlanetInfo(widget.name);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               FutureBuilder<Album>(
//                 future: futureAlbum,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Container(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 widget.name.toUpperCase(),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 26,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(
//                             0,
//                             24,
//                             0,
//                             0,
//                           ),
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                             child: Container(
//                               height: 300,
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 8,
//                                       vertical: 64,
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text(
//                                           "TYPE",
//                                           style: TextStyle(
//                                             fontFamily: GoogleFonts
//                                                     .atkinsonHyperlegible()
//                                                 .fontFamily,
//                                             fontSize: 24,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text(
//                                           snapshot.data!.discoveredBy.toUpperCase(),
//                                           style: TextStyle(
//                                             fontFamily: GoogleFonts
//                                                     .atkinsonHyperlegible()
//                                                 .fontFamily,
//                                             fontSize: 24,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }
//                   // By default, show a loading spinner.
//                   return const Center(
//                       child: CircularProgressIndicator(
//                     color: Colors.red,
//                     strokeWidth: 8.0,
//                   ));
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }