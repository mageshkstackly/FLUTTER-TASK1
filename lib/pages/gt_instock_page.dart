import 'package:flutter/material.dart';

import '../widgets/cloud_logo.dart';
import '../widgets/hover_card.dart';
import '../widgets/platform_shell.dart';

class GTInStockPage extends StatelessWidget {
  const GTInStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'name': 'Cloud Server Pro',
        'quantity': '120 units',
        'status': 'Available',
      },
      {
        'name': 'Enterprise Storage',
        'quantity': '84 units',
        'status': 'Available',
      },
      {
        'name': 'Security Gateway',
        'quantity': '32 units',
        'status': 'Low Stock',
      },
      {
        'name': 'API Gateway',
        'quantity': '56 units',
        'status': 'Available',
      },
      {
        'name': 'Backup Device',
        'quantity': '8 units',
        'status': 'Low Stock',
      },
    ];

    return PlatformShell(
      title: 'GT InStock',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GT InStock',
              style: TextStyle(
                color: darkBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Track inventory, product availability and stock levels.',
              style: TextStyle(
                color: Color.fromARGB(255, 7, 8, 8),
              ),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final int columns =
                    constraints.maxWidth > 900 ? 4 : 2;

                return GridView.count(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.7,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _stat('Total Items', '1,842'),
                    _stat('Available', '1,624'),
                    _stat('Low Stock', '148'),
                    _stat('Out of Stock', '70'),
                  ],
                );
              },
            ),
            const SizedBox(height: 28),
            const Text(
              'Inventory Items',
              style: TextStyle(
                color: darkBlue,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            ...items.map(
              (item) {
                final bool available =
                    item['status'] == 'Available';

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: HoverCard(
                    onTap: () {},
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: skyBlue.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.inventory_2_outlined,
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
                                item['name']!,
                                style: const TextStyle(
                                  color: darkBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['quantity']!,
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          item['status']!,
                          style: TextStyle(
                            color: available
                                ? Colors.green
                                : Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
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

  Widget _stat(String title, String value) {
    return HoverCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            value,
            style: const TextStyle(
              color: darkBlue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}