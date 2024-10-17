import 'package:flutter/material.dart';

class AccountManagementScreen extends StatelessWidget {
  const AccountManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white, // White for clean look
        iconTheme: const IconThemeData(color: Colors.blue), // Black icons for a neutral appearance
        title: const Text(
          'Account Management',
          style: TextStyle(
            color: Colors.blue, // Neutral text for AppBar title
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage Your Account',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Neutral headline text
              ),
            ),
            const SizedBox(height: 30),
            _accountOptionButton(
              text: 'Profile Name',
              icon: Icons.person_outline,
              onTap: () {
                // Handle profile info action
              },
            ),
            const SizedBox(height: 20),
            _accountOptionButton(
              text: 'Change Password',
              icon: Icons.lock_outline,
              onTap: () {
                // Handle change password action
              },
            ),
            const SizedBox(height: 20),
            _accountOptionButton(
              text: 'Logout',
              icon: Icons.logout,
              onTap: () {
                // Handle logout action
              },
            ),
            const Spacer(),
            _deleteAccountButton(context),
          ],
        ),
      ),
    );
  }

  // Account Option Button with subtle accents
  Widget _accountOptionButton({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey.shade800, size: 26), // Neutral grey icons
            const SizedBox(width: 15),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800, // Neutral text color
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  // Delete Account Button with red accents to indicate caution
  Widget _deleteAccountButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle delete account action
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                "Delete Account",
                style: TextStyle(color: Colors.red),
              ),
              content: const Text(
                "Are you sure you want to delete your account? This action cannot be undone.",
                style: TextStyle(fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform delete action
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Delete', style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.red.shade100,
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.delete_outline, color: Colors.red.shade600, size: 26), // Red delete icon
            const SizedBox(width: 15),
            Text(
              'Delete Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.red.shade600,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.red.shade300, size: 20),
          ],
        ),
      ),
    );
  }
}
