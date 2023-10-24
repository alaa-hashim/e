import 'dart:async';
import 'dart:typed_data';

import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/satusrequst.dart';

class AddressesController extends GetxController {
  Completer<GoogleMapController>? completercontroller =
      Completer<GoogleMapController>();
  StatusRequst statusRequest = StatusRequst.loading;

  List<Marker> markers = [];

  double? lat;
  double? long;
  RxString selectedAddress = ''.obs;

  void setSelectedAddress(String address) {
    selectedAddress.value = address;
    update();
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  Position? position;
  CameraPosition? kGooglePlex;
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequst.none;
    update();
  }

  gotoAddressdetail({Uint8List? snapshotImage}) async {
    final GoogleMapController mapController = await completercontroller!.future;
    final image = await mapController.takeSnapshot();

    Get.offNamed(AppRoute.addressdetail, arguments: {
      "lat": lat.toString(),
      "long": long.toString(),
      "image": image,
      "selectedAddress": selectedAddress
    });
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
