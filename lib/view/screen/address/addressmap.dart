// ignore_for_file: no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import the geolocator package

import '../../../controller/address/addresscontroller.dart';
import '../../../core/class/handlindatview.dart';
import '../../../core/constant/appcolor.dart';

class Addressmap extends StatelessWidget {
  const Addressmap({super.key});

  @override
  Widget build(BuildContext context) {
    AddressesController controller = Get.put(AddressesController());
    String _formatAddress(Placemark placemark) {
      String street = placemark.street ?? '';
      String subLocality = placemark.subLocality ?? '';
      String locality = placemark.locality ?? '';
      String administrativeArea = placemark.administrativeArea ?? '';

      return '$street, $subLocality, $locality, $administrativeArea, ';
    }

    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<AddressesController>(
        builder: ((controllerpage) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  if (controllerpage.kGooglePlex != null)
                    Expanded(
                      child: Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            markers: controllerpage.markers.toSet(),
                            onTap: (latlong) async {
                              controllerpage.addMarkers(latlong);
                              List<Placemark> placemarks =
                                  await placemarkFromCoordinates(
                                      latlong.latitude, latlong.longitude);
                              if (placemarks.isNotEmpty) {
                                Placemark placemark = placemarks[0];
                                String address = _formatAddress(placemark);
                                controllerpage.setSelectedAddress(address);
                              }
                            },
                            initialCameraPosition: controllerpage.kGooglePlex!,
                            onMapCreated:
                                (GoogleMapController controllermap) async {
                              controllerpage.completercontroller!
                                  .complete(controllermap);
                              await controllerpage
                                  .getCurrentLocation(); // Fetch current location
                              if (controllerpage.position != null) {
                                LatLng userLatLng = LatLng(
                                  controllerpage.position!.latitude,
                                  controllerpage.position!.longitude,
                                );
                                controllerpage.addMarkers(userLatLng);
                                List<Placemark> placemarks =
                                    await placemarkFromCoordinates(
                                  userLatLng.latitude,
                                  userLatLng.longitude,
                                );
                                if (placemarks.isNotEmpty) {
                                  Placemark placemark = placemarks[0];
                                  String address = _formatAddress(placemark);
                                  controllerpage.setSelectedAddress(address);
                                } // Add marker at current location
                              }
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(
                              width: 200,
                              child: MaterialButton(
                                minWidth: 200,
                                onPressed: () async {
                                  controller.gotoAddressdetail();
                                },
                                color: AppColor.primaryColor,
                                textColor: Colors.white,
                                child:  Text("101".tr,
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                height: 70,
                                decoration:
                                    const BoxDecoration(color: AppColor.white),
                                child: Center(
                                  child: Text(
                                    controllerpage.selectedAddress.value,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )),
      ),
    );
  }
}
