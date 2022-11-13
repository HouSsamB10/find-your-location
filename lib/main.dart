import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as LatLng;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MapController mapController = MapController();

  void getLocation() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Find Your Location',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width * .88,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: FlutterMap(
                    options: MapOptions(
                      // controller:
                      center: LatLng.LatLng(51.5, -0.09),
                      zoom: 17.0,
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(markers: [
                        Marker(
                            //marker
                            width: 25.0,
                            height: 25.0,
                            point: LatLng.LatLng(51.5, -0.09),
                            builder: (context) {
                              return const Icon(
                                Icons.place_sharp,
                                color: Colors.red,
                              );
                            })
                      ]),
                      CircleLayerOptions(circles: [
                        CircleMarker(
                            //radius marker
                            point: LatLng.LatLng(51.5, -0.09),
                            color: Colors.blue.withOpacity(0.3),
                            borderStrokeWidth: 3.0,
                            borderColor: Colors.blue,
                            radius: 100 //radius
                            )
                      ])
                    ],
                  ),
                ),
              ),
            ),

            //3
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .02,
                top: MediaQuery.of(context).size.height * .04,
              ),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .08,
                    width: MediaQuery.of(context).size.width * .85,
                    decoration: BoxDecoration(
                      color: Color(0xFF00B6F0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color(0xFF00B6F0).withOpacity(0.5),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: const Center(
                        child: Text(
                      'Get Your Location',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
