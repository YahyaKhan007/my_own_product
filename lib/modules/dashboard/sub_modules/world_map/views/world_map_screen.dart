import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/world_map/controller/world_map_controller.dart';

/// Full-screen Google Map screen showing user locations by country
/// Similar to Snapchat's map view
class WorldMapScreen extends StatelessWidget {
  const WorldMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorldMapController());

    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            GoogleMap(
              initialCameraPosition: controller.initialCameraPosition.value,
              markers: controller.markers.toSet(),
              onMapCreated: controller.onMapCreated,
              mapType: MapType.normal,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              rotateGesturesEnabled: true,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              compassEnabled: true,
              mapToolbarEnabled: false,
            ),
            if (controller.isLoadingMarkers.value)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

