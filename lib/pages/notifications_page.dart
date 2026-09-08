import 'package:flutter/material.dart';

import '../widgets/cloud_logo.dart';
import '../widgets/hover_card.dart';
import '../widgets/platform_shell.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'New employee added',
        'message': 'A new employee profile has been created.',
        'icon': Icons.person_add_outlined,
      },
      {
        'title': 'Inventory alert',
        'message': 'Security Gateway stock is running low.',
        'icon': Icons.inventory_2_outlined,
      },
      {
        'title': 'Cloud service update',
        'message': 'Cloud Storage service has been updated.',
        'icon': Icons.cloud_outlined,
      },
      {
        'title': 'Business report ready',
        'message': 'Your monthly business report is available.',
        'icon': Icons.bar_chart_outlined,
      },
    ];

    return PlatformShell(
      title: 'Notifications',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(
                color: darkBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Stay updated with important enterprise activities.',
              style: TextStyle(
                color: Color.fromARGB(255, 8, 12, 14),
              ),
            ),
            const SizedBox(height: 24),
            ...notifications.map(
              (notification) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: HoverCard(
                    onTap: () {},
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: skyBlue.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            notification['icon'] as IconData,
                            color: skyBlue,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification['title'] as String,
                                style: const TextStyle(
                                  color: darkBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                notification['message'] as String,
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: skyBlue,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}