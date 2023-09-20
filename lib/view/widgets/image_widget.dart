import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String imageUrl;
  String country;
  String name;

  ImageWidget({required this.imageUrl, required this.country, required this.name});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text("Name : $name"),
          Text("Name : $country"),
        ],
      ),
    );
  }
}
