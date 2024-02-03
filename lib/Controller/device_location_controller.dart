import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var locationMassage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch location when the controller is initialized
    getLocation();
  }

  Future<void> getLocation() async {
    try {
      LocationPermission locationPermission =
          await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        locationMassage.value = 'Location permission denied';
        return;
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      locationMassage.value =
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';

      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      locationMassage.value =
          'Adress: ${placemark.first.name} ${placemark.first.subLocality} ${placemark.first.locality}, ${placemark.first.administrativeArea}';
    } catch (e) {
      locationMassage.value = 'Error getting location: $e';
    }
  }
}
