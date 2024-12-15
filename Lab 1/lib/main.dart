import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartHome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: SmartHomePage(),
    );
  }
}

// Smart Home Home Page
class SmartHomePage extends StatelessWidget {
  SmartHomePage({super.key});

  final List<SmartHomeItem> smartHomeItems = [
    SmartHomeItem(
      name: "Smart Door Lock",
      image: "https://i.ytimg.com/vi/3NtUc30WsdU/maxresdefault.jpg",
      description: "Secure your home with this advanced smart door lock.",
      price: 150.00,
    ),
    SmartHomeItem(
      name: "Smart Light Bulb",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfmOxZBnNTe8IfWdGrtYM936_TMfH2MvcbRg&s",
      description: "Control lighting remotely with this smart light bulb.",
      price: 25.00,
    ),
    SmartHomeItem(
      name: "Smart Vacuum Cleaner",
      image: "https://s.yimg.com/uu/api/res/1.2/RwUX5Y6JbHE4VSNSjQIkvw--~B/Zmk9c3RyaW07aD03MjA7dz0xMjgwO2FwcGlkPXl0YWNoeW9u/https://s.yimg.com/os/creatr-uploaded-images/2023-05/3de34410-fa2d-11ed-bf77-5715db3d32ba",
      description: "Automate your cleaning with this smart vacuum cleaner.",
      price: 299.00,
    ),
    SmartHomeItem(
      name: "Smart Thermostat",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKIUQ-kqsP1yq_tvrvm41ZfKi22AUIZY61pQ&s",
      description: "Efficiently control the temperature of your home.",
      price: 120.00,
    ),
    SmartHomeItem(
      name: "Smart Security Camera",
      image: "https://media.wired.com/photos/5dc30388a0ab490008bbf5b8/master/pass/Gear-Best-Buy-Wifi-Camera.jpg",
      description: "Monitor your home in real-time with this camera.",
      price: 200.00,
    ),
    SmartHomeItem(
      name: "Smart Speaker",
      image: "https://i0.wp.com/www.smartprix.com/bytes/wp-content/uploads/2023/02/2-1.png?ssl=1",
      description: "Voice control and entertainment in one device.",
      price: 99.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("213137"),
        backgroundColor: Colors.lightBlue[100],
        leading: const Icon(Icons.home),
        elevation: 3,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: smartHomeItems.length,
        itemBuilder: (context, index) {
          final SmartHomeItem item = smartHomeItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(item: item),
                ),
              );
            },
            child: Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      item.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      item.name,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final SmartHomeItem item;
  const ProductDetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[100],
        elevation: 0,
        centerTitle: true,
        title: Text(
          item.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.lightGreen[100],
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item.image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              item.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                item.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SmartHomeItem {
  final String name;
  final String image;
  final String description;
  final double price;

  SmartHomeItem({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}
