import 'package:farmer_key/Agritools.dart';
import 'package:farmer_key/Disease.dart';
import 'package:farmer_key/Fertilizers.dart';
import 'package:farmer_key/Seeds.dart';
import 'package:flutter/material.dart';
import 'CultivationItemsPage.dart';
import 'Agritools.dart';
import 'Fertilizers.dart'; // Import FertilizersPage

class CategoryPage extends StatelessWidget {
  final List<String> categories = [
    'Agri Tools',
    'Disease',
    'Fertilizers',
    'Seeds',
    'Cultivation Equipment',
  ];

  final Map<String, IconData> categoryIcons = {
    'Agri Tools': Icons.handyman,
    'Disease': Icons.healing,
    'Fertilizers': Icons.science,
    'Seeds': Icons.spa,
    'Cultivation Equipment': Icons.agriculture,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items Categories'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories[index];
          IconData icon = categoryIcons[category] ?? Icons.category;

          return Card(
            child: ListTile(
              leading: Icon(icon, color: Colors.green),
              title: Text(category),
              onTap: () {
                if (category == 'Cultivation Equipment') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CultivationItemsPage()),
                  );
                } else if (category == 'Disease') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DiseasePage()),
                  );
                }else if (category == 'Seeds') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeedsPage()),
                  );
                }else if (category == 'Agri Tools') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AgriToolsPage()),
                  );
                } else if (category == 'Fertilizers') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FertilizersPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Clicked $category'),
                  ));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
