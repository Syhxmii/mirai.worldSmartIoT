import 'dart:async';
import 'package:http/http.dart' as http;

class BlynkApi {
  static final String authToken = 'NzrWkpdv60IKs-mP98QWx9q3wgODXQH0';
  static final String updateUrl = 'https://blynk.cloud/external/api/update';
  static final String getDataUrl = 'https://blynk.cloud/external/api/get';

  static void toggleLed(bool isOn, int ledVirtualPin) async {
    int value = isOn ? 1 : 0;
    String url = '$updateUrl?token=$authToken&v$ledVirtualPin=$value';
    await http.get(Uri.parse(url));
  }

  static void setBrightness(double brightness) async {
    int brightnessValue = brightness.clamp(0, 255).round();
    String url = '$updateUrl?token=$authToken&v7=$brightnessValue';
    await http.get(Uri.parse(url));
  }

  static Stream<int?> getTemperatureStream() async* {
    String url = '$getDataUrl?token=$authToken&v3';
    while (true) {
      try {
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          int? temperature = int.tryParse(response.body);
          print('Temperature received: $temperature');
          yield temperature;
        }
      } catch (e) {
        print('Error getting temperature data: $e');
      }
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Stream<int?> getHumidityStream() async* {
    String url = '$getDataUrl?token=$authToken&v2';
    while (true) {
      try {
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          int? humidity = int.tryParse(response.body);
          print('Humidity received: $humidity');
          yield humidity;
        }
      } catch (e) {
        print('Error getting humidity data: $e');
      }
      await Future.delayed(Duration(seconds: 1));
    }
  }
static Stream<int?> getLdrStream() async* {
  String url = '$getDataUrl?token=$authToken&v4';
  while (true) {
     try {
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          int? ldrValue = int.tryParse(response.body);
          print('ldrValue received: $ldrValue');
          yield ldrValue;
        }
      } catch (e) {
        print('Error getting ldrValue data: $e');
      }
    await Future.delayed(Duration(seconds: 1));
  }
}

}
