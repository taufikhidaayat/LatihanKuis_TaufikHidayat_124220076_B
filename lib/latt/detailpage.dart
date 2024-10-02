import 'package:flutter/material.dart';
import './dummy_menu .dart';

class DetailPage extends StatelessWidget {
  final FoodMenu menu;

  DetailPage({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.name),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                menu.imageAsset,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              menu.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              menu.category,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              menu.description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              "Price: ${menu.price}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 30),
            Center(),
          ],
        ),
      ),
    );
  }
}
