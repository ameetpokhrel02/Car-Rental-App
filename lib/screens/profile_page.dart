import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _showAction(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(action)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Profile Header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage(
                        'assets/images/profile_avatar.png'), // Replace with your asset
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Hello, Jack',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Account Section
            _buildSectionTitle('Account'),
            _buildMenuTile(context, Icons.edit, 'Edit Profile',
                () => _showAction(context, 'Edit Profile tapped')),
            _buildMenuTile(context, Icons.directions_car, 'My Cars',
                () => _showAction(context, 'My Cars tapped')),
            const SizedBox(height: 24),
            // Activity Section
            _buildSectionTitle('Activity'),
            _buildMenuTile(context, Icons.history, 'Rental History',
                () => _showAction(context, 'Rental History tapped')),
            _buildMenuTile(context, Icons.star, 'Reviews',
                () => _showAction(context, 'Reviews tapped')),
            const SizedBox(height: 24),
            // Settings Section
            _buildSectionTitle('Settings'),
            _buildMenuTile(context, Icons.settings, 'App Settings',
                () => _showAction(context, 'App Settings tapped')),
            _buildMenuTile(context, Icons.help_outline, 'Help & Support',
                () => _showAction(context, 'Help & Support tapped')),
            const SizedBox(height: 32),
            // Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: Text('Logout',
                    style: GoogleFonts.poppins(
                        color: Colors.red, fontWeight: FontWeight.w600)),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.red),
                onTap: () => _showAction(context, 'Logout tapped'),
                tileColor: Colors.red.withOpacity(0.05),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildMenuTile(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[600]),
        title: Text(title, style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
