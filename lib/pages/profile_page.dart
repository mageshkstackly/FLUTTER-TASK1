import 'package:flutter/material.dart';

import '../widgets/cloud_logo.dart';
import '../widgets/hover_card.dart';
import '../widgets/platform_shell.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformShell(
      title: 'Profile',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                color: darkBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage your account information and preferences.',
              style: TextStyle(
                color: Color.fromARGB(255, 1, 9, 13),
              ),
            ),
            const SizedBox(height: 24),
            HoverCard(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 42,
                    backgroundColor: lightBlue,
                    child: Icon(
                      Icons.person,
                      color: skyBlue,
                      size: 45,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Enterprise User',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'user@enterprise.com',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 25),
                  _info(
                    Icons.person_outline,
                    'Full Name',
                    'Enterprise User',
                  ),
                  _info(
                    Icons.email_outlined,
                    'Email',
                    'user@enterprise.com',
                  ),
                  _info(
                    Icons.business_outlined,
                    'Department',
                    'Technology',
                  ),
                  _info(
                    Icons.work_outline,
                    'Role',
                    'Administrator',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: skyBlue,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: darkBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}