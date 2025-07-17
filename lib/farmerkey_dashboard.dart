import 'package:farmer_key/AccountPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'category.dart';
import 'cart.dart';
import 'account.dart';

void main() {
  runApp(FarmerKeyApp());
}

class FarmerKeyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmerKey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: FarmerDashboard(),
    );
  }
}

class FarmerDashboard extends StatefulWidget {
  @override
  _FarmerDashboardState createState() => _FarmerDashboardState();
}

class _FarmerDashboardState extends State<FarmerDashboard> {
  List<Map<String, dynamic>> cartItems = [];

  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/bayar.png',
      'title': 'BAYAR-450 100ml/l',
      'price': 760.00,
      'oldPrice': 680.00,
      'discount': 20
    },
    {
      'image': 'assets/images/bunos.png',
      'title': 'Bunos 450ml/l',
      'price': 600.00,
      'oldPrice': 520.00,
      'discount': 23
    },
    {
      'image': 'assets/images/lesenta.png',
      'title': 'LESENTA 60gm/l',
      'price': 330.00,
      'oldPrice': 447.00,
      'discount': 26
    },
    {
      'image': 'assets/images/nativo.png',
      'title': 'NATIVO',
      'price': 400.00,
      'oldPrice': 430.00,
      'discount': 18
    },
  ];

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FARMERKEY', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        actions: [Icon(Icons.account_circle)],
      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.account_circle, size: 60, color: Colors.white),
                    SizedBox(height: 10),
                    Text('Farmer ID: 12345678', style: TextStyle(color: Colors.white)),
                    Text('farmer@example.com', style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Account'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()), // ✅ make sure AccountPage exists
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Navigate to settings or show dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Settings Clicked')),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  // Implement logout logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logged out')),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text('Help & Support'),
                onTap: () {
                  // Navigate to help or support page
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Help & Support Clicked')),
                  );
                },
              ),
            ],
          ),
        ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 10, mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = products[index];
                return ProductCard(item: item, onAddToCart: () => addToCart(item));
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home, color: Colors.white), onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => FarmerDashboard()),
              );
            }),
            IconButton(icon: Icon(Icons.category_outlined, color: Colors.white), onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=> CategoryPage()),
              );
            }),
            IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}


class ProductCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onAddToCart;

  const ProductCard({required this.item, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(height: 10),
          Image.asset(item['image'], height: 150),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item['title'], style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text("₹${item['price']}", style: TextStyle(color: Colors.green, fontSize: 16)),
          Text(
            "₹${item['oldPrice']}  SAVE ${item['discount']}%",
            style: TextStyle(fontSize: 12, color: Colors.red, decoration: TextDecoration.lineThrough),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ElevatedButton(
              onPressed: onAddToCart,
              child: Text("ADD TO CART"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}

