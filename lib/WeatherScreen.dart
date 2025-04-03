import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () {
              print("Refresh clicked");
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade800],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        const Text(
                          "96°F",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 48,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Icon(
                          Icons.wb_sunny,
                          size: 80.0,
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Sunny",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Weather Forecast",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildWeatherCard("03:00", "Sunny", "96°F", Icons.wb_sunny, Colors.orange),
                    buildWeatherCard("06:00", "Rainy", "75°F", Icons.cloud, Colors.blue),
                    buildWeatherCard("09:00", "Cloudy", "80°F", Icons.cloud_queue, Colors.grey),
                    buildWeatherCard("12:00", "Windy", "82°F", Icons.air, Colors.lightBlue),
                    buildWeatherCard("15:00", "Sunny", "96°F", Icons.wb_sunny, Colors.orange),
                    buildWeatherCard("18:00", "Rainy", "75°F", Icons.cloud, Colors.blue),
                    buildWeatherCard("21:00", "Cloudy", "80°F", Icons.cloud_queue, Colors.grey),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildInfoCard("Humidity", "60%", Icons.opacity, Colors.blue),
                  buildInfoCard("Wind", "15 km/h", Icons.air, Colors.lightBlue),
                  buildInfoCard("Pressure", "1013 hPa", Icons.device_thermostat, Colors.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWeatherCard(String time, String condition, String temperature, IconData icon, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: SizedBox(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Icon(
                icon,
                size: 32,
                color: iconColor,
              ),
              const SizedBox(height: 8),
              Text(
                temperature,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(String label, String value, IconData icon, Color iconColor) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: SizedBox(
        width: 100,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
