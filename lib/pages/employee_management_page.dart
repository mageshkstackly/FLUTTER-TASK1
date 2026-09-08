import 'package:flutter/material.dart';

import '../widgets/cloud_logo.dart';
import '../widgets/hover_card.dart';
import '../widgets/platform_shell.dart';

class EmployeeManagementPage extends StatelessWidget {
  const EmployeeManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> employees = [
      {
        'name': 'Arun Kumar',
        'role': 'Software Developer',
        'status': 'Active',
      },
      {
        'name': 'Bhargavi',
        'role': 'UI/UX Designer',
        'status': 'Active',
      },
      {
        'name': 'Udhay',
        'role': 'Project Manager',
        'status': 'Active',
      },
      {
        'name': 'Apurwa',
        'role': 'Business Analyst',
        'status': 'On Leave',
      },
      {
        'name': 'Karthik',
        'role': 'Backend Developer',
        'status': 'Active',
      },
    ];

    return PlatformShell(
      title: 'Employee Management',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Employee Management',
              style: TextStyle(
                color: darkBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage employees, departments and workforce information.',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 6, 7),
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
                    _stat('Total Employees', '248'),
                    _stat('Active', '221'),
                    _stat('Departments', '18'),
                    _stat('On Leave', '12'),
                  ],
                );
              },
            ),
            const SizedBox(height: 28),
            const Text(
              'Employee Directory',
              style: TextStyle(
                color: darkBlue,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            ...employees.map(
              (employee) {
                final String status = employee['status']!;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: HoverCard(
                    onTap: () {},
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              skyBlue.withValues(alpha: 0.12),
                          child: Text(
                            employee['name']![0],
                            style: const TextStyle(
                              color: skyBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                employee['name']!,
                                style: const TextStyle(
                                  color: darkBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                employee['role']!,
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
                            color: status == 'Active'
                                ? Colors.green
                                : Colors.orange,
                            fontWeight: FontWeight.w600,
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