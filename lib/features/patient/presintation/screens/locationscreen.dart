
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_care/core/utils/colors.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/presintation/screens/homevisitScreen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.patientEntitiy});
final PatientEntitiy patientEntitiy;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  String _locationString = "No location selected";
  static const LatLng _initialPosition = LatLng(30.033333, 31.233334);

  @override
  void initState() {
    super.initState();
    _markers.add(
      const Marker(
        markerId: MarkerId("initial"),
        position: _initialPosition,
        infoWindow: InfoWindow(title: "Cairo"),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onMapTapped(LatLng location) {
    setState(() {
   
      _locationString = "${location.latitude}, ${location.longitude}";
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(_locationString),
          position: location,
          infoWindow: InfoWindow(title: _locationString),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final patientEntitiy = widget.patientEntitiy;
    return Scaffold(
      
      appBar: AppBar(leading: IconButton(onPressed: (){
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homevisitscreen( patientEntitiy: patientEntitiy, address:_locationString ,)));
      }, icon: Icon(Icons.arrow_back)),title: const Text("Select Location")),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: _initialPosition,
                zoom: 10,
              ),
              markers: _markers,
              onTap: _onMapTapped,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Selected Location: $_locationString",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor
        ,onPressed: (){
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homevisitscreen( patientEntitiy: patientEntitiy, address:_locationString ,)));
      },child: Icon(Icons.done,color: Colors.white,size: 28,),),
    );
  }
}