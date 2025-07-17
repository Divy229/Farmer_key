import 'package:flutter/material.dart';
import 'cart.dart'; // ✅ Import the shared cart
import 'cart.dart'; // (again to be safe, just once in your actual file)

class FertilizersPage extends StatelessWidget {
  final List<Map<String, dynamic>> fertilizers = [
    {
      'image': 'assets/images/urea.png',
      'title': 'Urea 50kg',
      'price': 320,
    },
    {
      'image': 'assets/images/dap.png',
      'title': 'DAP 50kg',
      'price': 1350,
    },
    {
      'image': 'assets/images/npk.png',
      'title': 'NPK 20-20-20',
      'price': 1050,
    },
    {
      'image': 'assets/images/natural compost.png',
      'title': 'Organic Compost',
      'price': 480,
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
        title: Text('Farming Drugs'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart'); // or use MaterialPageRoute
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: fertilizers.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final item = fertilizers[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
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
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text("Add to Cart"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
