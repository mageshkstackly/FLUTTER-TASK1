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
      title: 'Dashboard',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _welcomeSection(),

            const SizedBox(height: 22),

            _sectionTitle(
              'Business Overview',
              'Monitor your enterprise performance at a glance.',
            ),

            const SizedBox(height: 14),

            LayoutBuilder(
              builder: (context, constraints) {
                int columns = 1;

                if (constraints.maxWidth >= 1000) {
                  columns = 4;
                } else if (constraints.maxWidth >= 650) {
                  columns = 2;
                }

                return GridView.count(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.8,
                  children: [
                    _metricCard(
                      context,
                      Icons.people_outline,
                      'Employees',
                      '248',
                      '12 new this month',
                    ),
                    _metricCard(
                      context,
                      Icons.cloud_outlined,
                      'Cloud Services',
                      '36',
                      '32 services active',
                    ),
                    _metricCard(
                      context,
                      Icons.groups_outlined,
                      'Active Leads',
                      '128',
                      '18 new leads',
                    ),
                    _metricCard(
                      context,
                      Icons.inventory_2_outlined,
                      'Stock Items',
                      '1,842',
                      '92% availability',
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 26),

            _sectionTitle(
              'Quick Access',
              'Access your most frequently used enterprise modules.',
            ),

            const SizedBox(height: 14),

            LayoutBuilder(
              builder: (context, constraints) {
                int columns = 1;

                if (constraints.maxWidth >= 1000) {
                  columns = 4;
                } else if (constraints.maxWidth >= 650) {
                  columns = 2;
                }

                return GridView.count(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.55,
                  children: [
                    _quickAccessCard(
                      context,
                      Icons.cloud_outlined,
                      'Cloud Services',
                      'Manage cloud infrastructure',
                      AppRoutes.cloud,
                    ),
                    _quickAccessCard(
                      context,
                      Icons.people_outline,
                      'Employee Management',
                      'Manage employees and teams',
                      AppRoutes.employees,
                    ),
                    _quickAccessCard(
                      context,
                      Icons.groups_outlined,
                      'CRM',
                      'Manage customers and leads',
                      AppRoutes.crm,
                    ),
                    _quickAccessCard(
                      context,
                      Icons.bar_chart_outlined,
                      'Business Reports',
                      'View business analytics',
                      AppRoutes.reports,
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 26),

            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= 850) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _recentActivity(),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: _systemStatus(),
                      ),
                    ],
                  );
                }

                return Column(
                  children: [
                    _recentActivity(),
                    const SizedBox(height: 18),
                    _systemStatus(),
                  ],
                );
              },
            ),

            const SizedBox(height: 26),

            _businessSummary(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _welcomeSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: skyBlue.withValues(alpha: 0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const CloudLogo(iconSize: 38),
          const SizedBox(width: 18),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: darkBlue,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 7),
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
    );
  }

  Widget _sectionTitle(
    String title,
    String subtitle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: darkBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _metricCard(
    BuildContext context,
    IconData icon,
    String title,
    String value,
    String subtitle,
  ) {
    return HoverCard(
      onTap: () {},
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: skyBlue.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(14),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: darkBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickAccessCard(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    String route,
  ) {
    return HoverCard(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: skyBlue.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: skyBlue,
              size: 30,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: darkBlue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentActivity() {
    return HoverCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Activity',
            style: TextStyle(
              color: darkBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _activityItem(
            Icons.person_add_alt_1_outlined,
            'New employee added',
            'HR Management',
            '10 min ago',
          ),
          _activityItem(
            Icons.cloud_done_outlined,
            'Cloud service updated',
            'Cloud Services',
            '35 min ago',
          ),
          _activityItem(
            Icons.groups_outlined,
            'New CRM lead created',
            'CRM',
            '1 hour ago',
          ),
          _activityItem(
            Icons.bar_chart_outlined,
            'Business report generated',
            'Reports',
            '2 hours ago',
          ),
        ],
      ),
    );
  }

  Widget _activityItem(
    IconData icon,
    String title,
    String category,
    String time,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: skyBlue.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: skyBlue,
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: darkBlue,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  category,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _systemStatus() {
    return HoverCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'System Status',
            style: TextStyle(
              color: darkBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),
          _statusRow(
            'Cloud Infrastructure',
            'Operational',
          ),
          _statusRow(
            'Database Services',
            'Operational',
          ),
          _statusRow(
            'CRM Services',
            'Operational',
          ),
          _statusRow(
            'Security Services',
            'Protected',
          ),
        ],
      ),
    );
  }

  Widget _statusRow(
    String title,
    String status,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: darkBlue,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            status,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _businessSummary() {
    return HoverCard(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enterprise Performance',
            style: TextStyle(
              color: darkBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Overall platform performance for the current month.',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 20),
          _progressItem(
            'Cloud Utilization',
            0.82,
            '82%',
          ),
          const SizedBox(height: 16),
          _progressItem(
            'Employee Productivity',
            0.74,
            '74%',
          ),
          const SizedBox(height: 16),
          _progressItem(
            'Customer Engagement',
            0.68,
            '68%',
          ),
        ],
      ),
    );
  }

  Widget _progressItem(
    String title,
    double value,
    String percentage,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: darkBlue,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              percentage,
              style: const TextStyle(
                color: skyBlue,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 8,
            backgroundColor: const Color.fromARGB(255, 246, 247, 248).withValues(alpha: 0.10),
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color.fromARGB(255, 224, 229, 232),
            ),
          ),
        ),
      ],
    );
  }
}