import 'package:flutter/material.dart';
import 'cart.dart'; // Make sure this contains `cartItems` and `CartPage`

class CultivationItemsPage extends StatelessWidget {
  final List<Map<String, dynamic>> cultivationItems = [
    {
      'image': 'assets/images/tractor.png',
      'title': 'Mini Tractor',
      'price': 300000,
    },
    {
      'image': 'assets/images/culti.png',
      'title': 'Plough Machine',
      'price': 75000,
    },
    {
      'image': 'assets/images/rotavator.png',
      'title': 'Rotavator',
      'price': 80000,
    },
    {
      'image': 'assets/images/spreyer.png',
      'title': 'Sprayer Machine',
      'price': 95000,
    },
  ];

  void addToCart(BuildContext context, Map<String, dynamic> item) {
    cartItems.add(item); // Add item to shared cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item['title']} added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cultivation Equipment'),
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
        itemCount: cultivationItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final item = cultivationItems[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Image.asset(item['image'], height: 100),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text("₹${item['price']}", style: TextStyle(color: Colors.green, fontSize: 16)),
                Spacer(),
                ElevatedButton(
                  onPressed: () => addToCart(context, item),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('Add to Cart'),
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
