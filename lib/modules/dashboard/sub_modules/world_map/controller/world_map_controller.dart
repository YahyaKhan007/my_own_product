import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_own_product/core/data/app_data.dart';
import 'package:my_own_product/core/routes/app_routes.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/world_map/utils/marker_helper.dart';

/// Controller for the World Map screen
/// Manages map state, markers, and user data display
class WorldMapController extends GetxController {
  GoogleMapController? mapController;
  
  // Map initial position (centered on world)
  final Rx<CameraPosition> initialCameraPosition = const CameraPosition(
    target: LatLng(20.0, 0.0), // Center of world map
    zoom: 2.0,
  ).obs;

  // Set of markers to display on map
  final RxSet<Marker> markers = <Marker>{}.obs;

  // Loading state
  final RxBool isLoadingMarkers = true.obs;

  // Store users by country for navigation
  final Map<String, List<Map<String, dynamic>>> usersByCountry = {};

  @override
  void onInit() {
    super.onInit();
    // Markers will be loaded when map is created
  }

  /// Load markers for all countries where users exist
  Future<void> _loadMarkers() async {
    try {
      isLoadingMarkers.value = true;
      final Set<Marker> newMarkers = {};
      
      // Verify we have dummy users
      if (AppData.dummyUsers.isEmpty) {
        print('No dummy users found!');
        isLoadingMarkers.value = false;
        return;
      }

      print('Loading markers for ${AppData.dummyUsers.length} users');
      
      // Group users by country
      for (var user in AppData.dummyUsers) {
        final country = user['country'] as String;
        if (!usersByCountry.containsKey(country)) {
          usersByCountry[country] = [];
        }
        usersByCountry[country]!.add(user);
      }

      print('Found ${usersByCountry.length} unique countries');

      // Create a custom marker for each country
      int markerId = 0;
      for (var entry in usersByCountry.entries) {
        final country = entry.key;
        final users = entry.value;
        final user = users.first;
        final latitude = user['latitude'] as double;
        final longitude = user['longitude'] as double;
        final flag = user['flag'] as String;
        final userCount = users.length;

        try {
          // Create custom marker icon
          final BitmapDescriptor customIcon = await MarkerHelper.createCustomMarker(
            flag: flag,
            userCount: userCount,
            backgroundColor: Colors.white,
            badgeColor: const Color(0xffEDA606), // Using app's button color
          );

          newMarkers.add(
            Marker(
              markerId: MarkerId('marker_$markerId'),
              position: LatLng(latitude, longitude),
              icon: customIcon,
              infoWindow: InfoWindow(
                title: '$flag $country',
                snippet: '$userCount user${userCount > 1 ? 's' : ''}',
              ),
              // Consume tap events so marker tap navigates, not info window
              consumeTapEvents: true,
              onTap: () {
                _onMarkerTapped(country, users);
              },
            ),
          );
          print('Created custom marker for $country at ($latitude, $longitude)');
        } catch (e, stackTrace) {
          // Fallback to default marker if custom marker fails
          print('Error creating custom marker for $country: $e');
          print('Stack trace: $stackTrace');
          newMarkers.add(
            Marker(
              markerId: MarkerId('marker_$markerId'),
              position: LatLng(latitude, longitude),
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: InfoWindow(
                title: '$flag $country',
                snippet: '$userCount user${userCount > 1 ? 's' : ''}',
              ),
              // Consume tap events so marker tap navigates, not info window
              consumeTapEvents: true,
              onTap: () {
                _onMarkerTapped(country, users);
              },
            ),
          );
          print('Created default marker for $country at ($latitude, $longitude)');
        }
        markerId++;
      }

      print('Total markers created: ${newMarkers.length}');
      markers.assignAll(newMarkers);
      print('Markers assigned to reactive set. Current count: ${markers.length}');
    } catch (e, stackTrace) {
      print('Error loading markers: $e');
      print('Stack trace: $stackTrace');
    } finally {
      isLoadingMarkers.value = false;
    }
  }

  /// Handle marker tap - navigate to country users screen
  void _onMarkerTapped(String country, List<Map<String, dynamic>> users) {
    Get.toNamed(
      AppRoutes.countryUsersScreen.path,
      arguments: {
        'country': country,
        'users': users,
      },
    );
  }

  /// Called when map is ready
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // Load markers after map is created
    _loadMarkers();
  }

  @override
  void onClose() {
    mapController?.dispose();
    super.onClose();
  }
}

