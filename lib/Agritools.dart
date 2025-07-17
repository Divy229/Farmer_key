import 'package:flutter/material.dart';
import 'cart.dart'; // ✅ import the cart

class AgriToolsPage extends StatelessWidget {
  final List<Map<String, dynamic>> agriTools = [
    {
      'image': 'assets/images/hoe.png',
      'title': 'Hoe',
      'price': 450,
    },
    {
      'image': 'assets/images/spade.png',
      'title': 'Spade',
      'price': 300,
    },
    {
      'image': 'assets/images/shovel.png',
      'title': 'Shovel',
      'price': 550,
    },
    {
      'image': 'assets/images/sickle.png',
      'title': 'Sickle',
      'price': 120,
    },
  ];

  void addToCart(BuildContext context, Map<String, dynamic> item) {
    cartItems.add(item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item['title']} added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agri Tools'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: agriTools.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final item = agriTools[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                SizedBox(height: 10),
                Image.asset(item['image'], height: 100),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item['title'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "₹${item['price']}",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () => addToCart(context, item),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Add to Cart"),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
