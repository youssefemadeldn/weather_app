import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Alexandria',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at: 23:24',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              SizedBox(width: 60),
              Image(image: AssetImage('assets/images/cloudy.png')),
              SizedBox(width: 60),
              Text(
                '17',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 60),
              Column(
                children: [
                  Text('maxTemp: 17'),
                  Text('minTemp: 17'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            'Light Rain',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
