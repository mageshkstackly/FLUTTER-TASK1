import 'package:flutter/material.dart';

import '../widgets/cloud_logo.dart';
import '../widgets/hover_card.dart';
import '../widgets/platform_shell.dart';

class CRMPage extends StatelessWidget {
  const CRMPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> leads = [
      {
        'company': 'Acme Corporation',
        'service': 'Enterprise Plan',
        'status': 'Hot',
      },
      {
        'company': 'Global Tech',
        'service': 'Cloud Migration',
        'status': 'Warm',
      },
      {
        'company': 'Nova Solutions',
        'service': 'CRM Package',
        'status': 'Hot',
      },
      {
        'company': 'Skyline Systems',
        'service': 'Security Service',
        'status': 'Cold',
      },
    ];

    return PlatformShell(
      title: 'CRM',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Customer Relationship Management',
              style: TextStyle(
                color: darkBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Track customers, leads, opportunities and business relationships.',
              style: TextStyle(
                color: Color.fromARGB(255, 11, 13, 15),
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
                    _stat('Total Customers', '1,284'),
                    _stat('Active Leads', '128'),
                    _stat('Opportunities', '64'),
                    _stat('Conversion', '72%'),
                  ],
                );
              },
            ),
            const SizedBox(height: 28),
            const Text(
              'Recent Leads',
              style: TextStyle(
                color: darkBlue,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            ...leads.map(
              (lead) {
                final String status = lead['status']!;

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
                            Icons.business_outlined,
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
                                lead['company']!,
                                style: const TextStyle(
                                  color: darkBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                lead['service']!,
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          status,
                          style: TextStyle(
                            color: status == 'Hot'
                                ? Colors.redAccent
                                : status == 'Warm'
                                    ? Colors.orange
                                    : Colors.grey,
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