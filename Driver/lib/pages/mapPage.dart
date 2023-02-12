import 'dart:async';

import 'package:drivernew/data/constants.dart';
import 'package:drivernew/pages/finalpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:web_socket_channel/status.dart';


class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng source =  LatLng(23.2075479,77.4083359);
  static const LatLng destination = LatLng(22.7175687,75.8587258);

  List<LatLng> polylineCoordinates = [];
  LocationData ? currentLocation;


  void getCurrentLocation()async{

    print("Hello");

    Location location = Location();

    location.getLocation().then(
      (location){
        currentLocation = location;
        print(currentLocation!.latitude);
        print(currentLocation!.longitude);
        setState(() {
          
        });
      }
    );

    location.onLocationChanged.listen((location1) {
      currentLocation = location1;
      print(currentLocation!.latitude);
      setState(() {
        
      });
    });
  }


  void getPolilinePoints()async{
    PolylinePoints polilinepoints = PolylinePoints();
    PolylineResult result = await polilinepoints.getRouteBetweenCoordinates(
      google_maps_apikey,
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng point){
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    getPolilinePoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null ? Center(child: Center(child:Text("Loading..."))) :
      GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: source,
          zoom: 17.5
        ),
        markers: {
          Marker(
            markerId: MarkerId("Current Location"),
            position: LatLng(
              currentLocation!.latitude!,
              currentLocation!.longitude!
            )
          ),
          Marker(
            markerId: MarkerId("source"),
            position: source
          ),
          Marker(
            markerId: MarkerId("Destination"),
            position: destination
          )
        },
        polylines: {
          Polyline(
            polylineId: PolylineId("polyline"),
            points: polylineCoordinates,
            color: Colors.blue,
            width: 5
          )
        },
        onMapCreated: (mapcontroller){
          _controller.complete(mapcontroller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FinalPage()));
        },
        label: const Text('Order Completed'),
        icon: const Icon(Icons.check),
      ),
    );
  }

  
}