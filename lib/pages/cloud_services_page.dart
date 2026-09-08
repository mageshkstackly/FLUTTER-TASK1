import 'package:flutter/material.dart';

import '../widgets/cloud_logo.dart';
import '../widgets/hover_card.dart';
import '../widgets/platform_shell.dart';

class CloudServicesPage extends StatelessWidget {
  const CloudServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {
        'title': 'Cloud Storage',
        'description': 'Secure and scalable cloud storage.',
        'icon': Icons.cloud_queue_outlined,
      },
      {
        'title': 'Cloud Computing',
        'description': 'Powerful enterprise computing resources.',
        'icon': Icons.computer_outlined,
      },
      {
        'title': 'Database Services',
        'description': 'Reliable and secure database solutions.',
        'icon': Icons.storage_outlined,
      },
      {
        'title': 'Security Center',
        'description': 'Protect your enterprise infrastructure.',
        'icon': Icons.security_outlined,
      },
      {
        'title': 'API Management',
        'description': 'Manage and monitor your APIs.',
        'icon': Icons.api_outlined,
      },
      {
        'title': 'Backup & Recovery',
        'description': 'Keep your business data protected.',
        'icon': Icons.backup_outlined,
      },
    ];

    return PlatformShell(
      title: 'Cloud Services',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cloud Services',
              style: TextStyle(
                color: darkBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Manage your enterprise cloud infrastructure and services.',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 24),

            LayoutBuilder(
              builder: (context, constraints) {
                int columns = 1;

                if (constraints.maxWidth >= 1000) {
                  columns = 3;
                } else if (constraints.maxWidth >= 600) {
                  columns = 2;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1.45,
                  ),
                  itemBuilder: (context, index) {
                    final service = services[index];

                    return HoverCard(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${service['title']} selected',
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: skyBlue.withValues(
                                alpha: 0.10,
                              ),
                              borderRadius:
                                  BorderRadius.circular(16),
                            ),
                            child: Icon(
                              service['icon'] as IconData,
                              color: skyBlue,
                              size: 34,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Text(
                            service['title'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: darkBlue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            service['description'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}