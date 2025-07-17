import 'package:flutter/material.dart';

class DiseasePage extends StatelessWidget {
  final List<Map<String, String>> diseases = [
    {
      'name': 'Late Blight',
      'description': 'Caused by fungus-like organisms. Affects potatoes and tomatoes.',
    },
    {
      'name': 'Powdery Mildew',
      'description': 'White powder-like fungus on leaves. Affects many crops.'
    },
    {
      'name': 'Wilt Disease',
      'description': 'Caused by fungi or bacteria. Leads to wilting of plants.'
    },
    // Add more disease items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Diseases'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(disease['name'] ?? ''),
              subtitle: Text(disease['description'] ?? ''),
              leading: Icon(Icons.healing, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
