import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class FavoritesPage extends StatelessWidget {
  final List<Car> favoriteCars;
  const FavoritesPage({super.key, required this.favoriteCars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites', style: GoogleFonts.poppins()),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: favoriteCars.isEmpty
          ? Center(
              child:
                  Text('No favorite cars yet.', style: GoogleFonts.poppins()))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: favoriteCars.length,
              itemBuilder: (context, index) {
                final car = favoriteCars[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 20),
                              const SizedBox(width: 4),
                              Text(car.rating.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Image.asset(car.image,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.contain),
                      const SizedBox(height: 12),
                      Text(car.name,
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      Row(
                        children: car.specs.map((spec) {
                          return Container(
                            margin: const EdgeInsets.only(right: 12),
                            child: Row(
                              children: [
                                Icon(
                                  spec.contains('Manual')
                                      ? Icons.settings
                                      : spec.contains('Petrol')
                                          ? Icons.local_gas_station
                                          : spec.contains('Electric')
                                              ? Icons.bolt
                                              : Icons.event_seat,
                                  size: 16,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(width: 4),
                                Text(spec,
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 12)),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            ' 24${car.price.toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[600],
                            ),
                          ),
                          const Text('/hr',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
