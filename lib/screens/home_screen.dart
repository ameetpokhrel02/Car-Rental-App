
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'all_brands_screen.dart';
import 'profile_page.dart';
import 'favorites_page.dart';
import 'favorites_page.dart';
import 'chat_screen.dart';

class Car {
  final String image;
  final String name;
  final double rating;
  final double price;
  final List<String> specs;
  Car(
      {required this.image,
      required this.name,
      required this.rating,
      required this.price,
      required this.specs});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Car> cars = [
    Car(
      image: 'assets/images/hyundai_verna.png',
      name: 'Hyundai Verna',
      rating: 4.8,
      price: 25.00,
      specs: ['Manual', 'Petrol', '5 Seats'],
    ),
    Car(
      image: 'assets/images/bmw_3series.png',
      name: 'BMW 3 Series',
      rating: 4.7,
      price: 30.00,
      specs: ['Automatic', 'Petrol', '5 Seats'],
    ),
    Car(
      image: 'assets/images/toyota_camry.png',
      name: 'Toyota Camry',
      rating: 4.6,
      price: 28.00,
      specs: ['Automatic', 'Hybrid', '5 Seats'],
    ),
    Car(
      image: 'assets/images/tesla.png',
      name: 'Tesla Model S',
      rating: 4.9,
      price: 40.00,
      specs: ['Automatic', 'Electric', '5 Seats'],
    ),
  ];

  int currentCarIndex = 0;
  String searchQuery = '';
  List<Car> filteredCars = [];
  List<Car> favoriteCars = [];
  int _selectedIndex = 0;

  void _showNextCar() {
    setState(() {
      currentCarIndex = (currentCarIndex + 1) % cars.length;
    });
  }

  void _showPreviousCar() {
    setState(() {
      currentCarIndex = (currentCarIndex - 1 + cars.length) % cars.length;
    });
  }

  void _toggleFavorite(Car car) {
    setState(() {
      if (favoriteCars.contains(car)) {
        favoriteCars.remove(car);
      } else {
        favoriteCars.add(car);
      }
    });
  }

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavoritesPage(favoriteCars: favoriteCars),
        ),
      );
    } else if (index == 3) {
      Navigator.pushNamed(context, '/chat');
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
      if (searchQuery.isEmpty) {
        filteredCars = [];
      } else {
        filteredCars = cars.where((car) {
          final nameMatch =
              car.name.toLowerCase().contains(query.toLowerCase());
          final typeMatch = car.specs
              .any((spec) => spec.toLowerCase().contains(query.toLowerCase()));
          return nameMatch || typeMatch;
        }).toList();
      }
    });
  }

  void _onFilterPressed() {
    // Placeholder for filter logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Filter button pressed!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSearchBar(),
                      if (searchQuery.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        _buildSearchResultsSection(),
                      ] else ...[
                        const SizedBox(height: 24),
                        _buildBrandsSection(),
                        const SizedBox(height: 24),
                        _buildProminentCarSection(),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.blue[600]),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Text(
                    'Kathmandu, Nepal',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.notifications_none, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          GestureDetector(
            onTap: _onFilterPressed,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.tune, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResultsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Results',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        if (filteredCars.isEmpty)
          const Text('No cars found.', style: TextStyle(color: Colors.grey)),
        ...filteredCars.map((car) => _buildCarCard(
              image: car.image,
              name: car.name,
              rating: car.rating,
              price: car.price,
              specs: car.specs,
            )),
      ],
    );
  }

  Widget _buildBrandsSection() {
    final brands = [
      {'name': 'BMW', 'logo': 'assets/images/bmw.png'},
      {'name': 'Toyota', 'logo': 'assets/images/toyota.png'},
      {'name': 'Mercedes', 'logo': 'assets/images/Mercedes.jpg'},
      {'name': 'Tesla', 'logo': 'assets/images/tesla.png'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Brands',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllBrandsScreen(),
                  ),
                );
              },
              child: Text(
                'See All',
                style: TextStyle(color: Colors.blue[600]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                margin: const EdgeInsets.only(right: 16),
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
                    brands[index]['logo']!,
                    width: 40,
                    height: 40,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProminentCarSection() {
    final car = cars[currentCarIndex];
    final isFavorite = favoriteCars.contains(car);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Car',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: TextStyle(color: Colors.blue[600]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: _showPreviousCar,
              color: Colors.blue[600],
              iconSize: 32,
              tooltip: 'Previous',
            ),
            Expanded(
              child: _buildCarCard(
                image: car.image,
                name: car.name,
                rating: car.rating,
                price: car.price,
                specs: car.specs,
                isFavorite: isFavorite,
                onFavoriteTap: () => _toggleFavorite(car),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: _showNextCar,
              color: Colors.blue[600],
              iconSize: 32,
              tooltip: 'Next',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCarCard({
    required String image,
    required String name,
    required double rating,
    required double price,
    required List<String> specs,
    bool isFavorite = false,
    VoidCallback? onFavoriteTap,
  }) {
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
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onFavoriteTap,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey[400],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Image.asset(image,
              height: 120, width: double.infinity, fit: BoxFit.contain),
          const SizedBox(height: 12),
          Text(
            name,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            children: specs.map((spec) {
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
                    Text(
                      spec,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                ' 24${price.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[600],
                ),
              ),
              const Text('/hr', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
              Icons.home, 'Home', _selectedIndex == 0, () => _onNavBarTap(0)),
          _buildNavItem(Icons.explore, 'Explore', _selectedIndex == 1,
              () => _onNavBarTap(1)),
          _buildNavItem(Icons.favorite, 'Favorite', _selectedIndex == 2,
              () => _onNavBarTap(2)),
          _buildNavItem(Icons.chat_bubble_outline, 'Chat', _selectedIndex == 3,
              () => _onNavBarTap(3)),
          _buildNavItem(Icons.person_outline, 'Profile', _selectedIndex == 4,
              () => _onNavBarTap(4)),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue[600] : Colors.grey[400],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue[600] : Colors.grey[400],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
