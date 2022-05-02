import 'dart:ui';
import 'package:cronus/data/fetch_asteroid_info.dart';
import 'package:cronus/widgets/button_back.dart';
import 'package:cronus/widgets/card_expansiontile_column.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/card_expansiontile_row.dart';
import '../widgets/loading_animation.dart';

class AsteroidPage extends StatefulWidget {
  final String? id;
  final String? englishName;
  final num? mass;
  final String? dimension;
  final String? alternativeName;
  final String? discoveredBy;
  final String? discoveryDate;

  const AsteroidPage({
    Key? key,
    this.englishName,
    this.id,
    this.mass,
    this.dimension,
    this.alternativeName,
    this.discoveredBy,
    this.discoveryDate,
  }) : super(key: key);

  @override
  State<AsteroidPage> createState() => _AsteroidPageState();
}

class _AsteroidPageState extends State<AsteroidPage> {
  bool toggle = false;
  bool loading = false;
  late Future<DataAsteroid> futureDataAsteroid;

  @override
  void initState() {
    super.initState();
    futureDataAsteroid = fetchAsteroidInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(fit: StackFit.expand, children: [
        Image.asset('lib/images/backgroundimage_asteroid.jpeg'),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              alignment: Alignment.center,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: FutureBuilder<DataAsteroid>(
                    future: futureDataAsteroid,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            const SizedBox(height: 30),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(width: 10),
                              ButtonBack(color: Colors.white)
                            ],
                          ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 170, 35, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 130,
                                      width: 130,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'lib/images/asteroid.png')))),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            ClipRect(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color:
                                            Colors.grey[800]!.withOpacity(0.6)),
                                    child: ExpansionTile(
                                      title: Container(
                                        margin: const EdgeInsets.fromLTRB(40, 0, 0, 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 10),
                                                Text(snapshot.data!.englishName,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5!
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontFamily: GoogleFonts
                                                                    .quicksand()
                                                                .fontFamily,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "In December 2012, Toutatis passed within about 18 lunar distances of Earth. Toutatis approached Earth again in 2016, but will not make another notably close approach until 2069.",
                                              style: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontFamily:
                                                      GoogleFonts.mulish()
                                                          .fontFamily,
                                                  fontSize: 15),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      children: [
                                        const SizedBox(height: 5),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 0),
                                          child: CardExpansionTileRow(
                                              categoryName: "Mass:",
                                              categoryResult: snapshot
                                                  .data!.mass
                                                  .toString(),
                                              color: Colors.white,
                                              colorText: Colors.black),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 0),
                                          child: CardExpansionTileRow(
                                              categoryName: "Dimension:",
                                              categoryResult:
                                                  snapshot.data!.dimension,
                                              color: const Color.fromARGB(
                                                  255, 255, 187, 0),
                                              colorText: Colors.white),
                                        ),
                                        CardExpansionTileColumn(
                                          categoryName: "Alternative name:",
                                          categoryResult:
                                              snapshot.data!.alternativeName,
                                          color: Colors.white,
                                          colorText: Colors.black,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 0),
                                          child: CardExpansionTileColumn(
                                            categoryName: "Discovered by",
                                            categoryResult:
                                                snapshot.data!.discoveredBy,
                                            color: const Color.fromARGB(
                                                255, 255, 187, 0),
                                            colorText: Colors.white,
                                          ),
                                        ),
                                        CardExpansionTileColumn(
                                          categoryName: "Discovery date:",
                                          categoryResult:
                                              snapshot.data!.discoveryDate,
                                          color: Colors.white,
                                          colorText: Colors.black,
                                        ),
                                        const SizedBox(height: 10)
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const LoadingAnimation();
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
