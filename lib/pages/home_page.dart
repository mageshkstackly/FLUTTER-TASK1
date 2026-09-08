import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../widgets/cloud_logo.dart';
import '../widgets/hover_card.dart';
import '../widgets/platform_shell.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HoverCard(
              color: lightBlue,
              child: Row(
                children: [
                  const CloudLogo(
                    iconSize: 38,
                  ),
                  const SizedBox(width: 18),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Manage your enterprise operations from one powerful cloud platform.',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;

                int columns = 1;

                if (width > 1100) {
                  columns = 4;
                } else if (width > 700) {
                  columns = 2;
                }

                return GridView.count(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.7,
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  children: [
                    _metric(
                      Icons.people_outline,
                      'Employees',
                      '248',
                    ),
                    _metric(
                      Icons.cloud_outlined,
                      'Cloud Services',
                      '36',
                    ),
                    _metric(
                      Icons.groups_outlined,
                      'Active Leads',
                      '128',
                    ),
                    _metric(
                      Icons.inventory_2_outlined,
                      'Stock Items',
                      '1,842',
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 28),

            const Text(
              'Quick Access',
              style: TextStyle(
                color: darkBlue,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            LayoutBuilder(
              builder: (context, constraints) {
                int columns = constraints.maxWidth > 800 ? 4 : 2;

                return GridView.count(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  children: [
                    _quick(
                      context,
                      Icons.cloud_outlined,
                      'Cloud Services',
                      AppRoutes.cloud,
                    ),
                    _quick(
                      context,
                      Icons.people_outline,
                      'Employees',
                      AppRoutes.employees,
                    ),
                    _quick(
                      context,
                      Icons.groups_outlined,
                      'CRM',
                      AppRoutes.crm,
                    ),
                    _quick(
                      context,
                      Icons.bar_chart_outlined,
                      'Reports',
                      AppRoutes.reports,
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 28),

            HoverCard(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.gtInStock,
                );
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: skyBlue.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.inventory_2_outlined,
                      color: skyBlue,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GT InStock',
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Monitor inventory, stock levels and product availability.',
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: skyBlue,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _metric(
    IconData icon,
    String title,
    String value,
  ) {
    return HoverCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: skyBlue.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: skyBlue,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: darkBlue,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quick(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return HoverCard(
      onTap: () {
        Navigator.pushNamed(
          context,
          route,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: skyBlue,
            size: 34,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}