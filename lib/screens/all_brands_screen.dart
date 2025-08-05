import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllBrandsScreen extends StatelessWidget {
  final List<Map<String, String>> brands = [
    {'name': 'BMW', 'logo': 'assets/images/bmw.png'},
    {'name': 'Toyota', 'logo': 'assets/images/toyota.png'},
    {'name': 'Mercedes', 'logo': 'assets/images/Mercedes.jpg'},
    {'name': 'Tesla', 'logo': 'assets/images/tesla.png'},
    // Add more brands here if neededs 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Brands', style: GoogleFonts.poppins()),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final brand = brands[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      brand['logo']!,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  brand['name']!,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
