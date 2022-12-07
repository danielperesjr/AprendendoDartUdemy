import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-23.566064, -46.650778),
    zoom: 16.0,
    tilt: 0.0,
    bearing: 30.0,
  );
  Set<Marker> _markers = {};
  Set<Polygon> _polygons = {};
  Set<Polyline> _polylines = {};

  void _onMapCreated(GoogleMapController googleMapController) {
    _controller.complete(googleMapController);
  }

  Future<void> _moveCamera() async {
    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(_cameraPosition),
    );
  }

  void _loadMarkers() {
    /*
    Set<Marker> localMarker = {};

    Marker markerShopping = Marker(
        markerId: MarkerId("shopping-marker"),
        position: LatLng(-23.563370, -46.652923),
        infoWindow: InfoWindow(
          title: "Shopping Cidade São Paulo",
        ),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        onTap: () {
          print("Shopping Selecionado!");
        });

    Marker markerNotary = Marker(
        markerId: MarkerId("notary-marker"),
        position: LatLng(-23.562868, -46.655874),
        infoWindow: InfoWindow(title: "Cartório de Notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        onTap: () {
          print("Cartório Selecionado!");
        });

    localMarker.add(markerShopping);
    localMarker.add(markerNotary);

    setState(() {
      _markers = localMarker;
    });
    */
    /*
    Set<Polygon> polygonList = {};

    Polygon polygonOne = Polygon(
        polygonId: PolygonId("polygonOne"),
        fillColor: Colors.green,
        strokeColor: Colors.red,
        strokeWidth: 10,
        points: [
          LatLng(-23.561816, -46.652044),
          LatLng(-23.563625, -46.653642),
          LatLng(-23.564786, -46.652226),
          LatLng(-23.563085, -46.650531),
        ],
      consumeTapEvents: true,
      onTap: (){
          print("Clicado na área");
      },
      zIndex: 1
    );
    polygonList.add(polygonOne);

    Polygon polygonTwo = Polygon(
        polygonId: PolygonId("polygonTwo"),
        fillColor: Colors.purple,
        strokeColor: Colors.orange,
        strokeWidth: 10,
        points: [
          LatLng(-23.561629, -46.653031),
          LatLng(-23.565189, -46.651872),
          LatLng(-23.562032, -46.650831),
        ],
        consumeTapEvents: true,
        onTap: (){
          print("Clicado na área");
        },
      zIndex: 0
    );
    polygonList.add(polygonTwo);

    setState(() {
      _polygons = polygonList;
    });
    */

    Set<Polyline> polylineList = {};
    Polyline polyline = Polyline(
        polylineId: PolylineId("polyline"),
        color: Colors.red,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.round,
        points: [
          LatLng(-23.563645, -46.653642),
          LatLng(-23.566064, -46.650778),
          LatLng(-23.563232, -46.648020),
        ],
        consumeTapEvents: true,
        onTap: () {
          print("Clicado na área");
        });
    polylineList.add(polyline);
    setState(() {
      _polylines = polylineList;
    });
  }

  _retrieveCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _cameraPosition = CameraPosition(
        target: LatLng(
          position.latitude,
          position.longitude,
        ),
        zoom: 17,
      );
      _moveCamera();
    });
  }

  void _addListenerLocation() {
    var locationOptions = LocationOptions(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );
    var geolocator = Geolocator.getPositionStream().listen(
      (Position position) {
        print("Localização Atual: ${position.toString()}");
        Marker userMarker = Marker(
            markerId: MarkerId("user-marker"),
            position: LatLng(position.latitude, position.longitude),
            infoWindow: InfoWindow(
              title: "Meu Local",
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueMagenta),
            onTap: () {
              print("Meu local clicado!");
            });
        setState(() {
          _markers.add(userMarker);
          _cameraPosition = CameraPosition(
            target: LatLng(
              position.latitude,
              position.longitude,
            ),
            zoom: 17,
          );
          _moveCamera();
        });
      },
    );
  }

  Future<List<Location>> _retrieveLocationAddress() async {
    List<Location> addressList = await GeocodingPlatform.instance
        .locationFromAddress("Av. Paulista, 1372");

    print("Total: ${addressList.length.toString()}");
    print(addressList);

    return addressList;
  }

  @override
  void initState() {
    super.initState();
    // _loadMarkers();
    // _addListenerLocation();
    _retrieveLocationAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapas e Geolocalização"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: _moveCamera,
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _cameraPosition,
          onMapCreated: _onMapCreated,
          // markers: _markers,
          // polygons: _polygons,
          // polylines: _polylines,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
      ),
    );
  }
}
