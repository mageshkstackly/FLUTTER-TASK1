import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import 'cloud_logo.dart';

class PlatformShell extends StatelessWidget {
  final Widget child;
  final String title;

  const PlatformShell({
    super.key,
    required this.child,
    this.title = 'One Cloud Enterprise Platform',
  });

  void _navigate(
    BuildContext context,
    String route,
  ) {
    Navigator.pushReplacementNamed(
      context,
      route,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 247),

      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              const CloudLogo(
                iconSize: 38,
              ),

              const SizedBox(height: 12),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'One Cloud Enterprise Platform',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: darkBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Divider(),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    _menuItem(
                      context,
                      Icons.dashboard_outlined,
                      'Dashboard',
                      AppRoutes.home,
                    ),
                    _menuItem(
                      context,
                      Icons.cloud_outlined,
                      'Cloud Services',
                      AppRoutes.cloud,
                    ),
                    _menuItem(
                      context,
                      Icons.people_outline,
                      'Employee Management',
                      AppRoutes.employees,
                    ),
                    _menuItem(
                      context,
                      Icons.groups_outlined,
                      'CRM',
                      AppRoutes.crm,
                    ),
                    _menuItem(
                      context,
                      Icons.bar_chart_outlined,
                      'Business Reports',
                      AppRoutes.reports,
                    ),
                    _menuItem(
                      context,
                      Icons.inventory_2_outlined,
                      'GT InStock',
                      AppRoutes.gtInStock,
                    ),
                    _menuItem(
                      context,
                      Icons.person_outline,
                      'Profile',
                      AppRoutes.profile,
                    ),
                    _menuItem(
                      context,
                      Icons.notifications_outlined,
                      'Notifications',
                      AppRoutes.notifications,
                    ),
                  ],
                ),
              ),

              const Divider(),

              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.redAccent,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 235, 239),
        surfaceTintColor: const Color.fromARGB(255, 178, 5, 5),
        elevation: 0,

        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: darkBlue,
              ),
            );
          },
        ),

        titleSpacing: 0,

        title: Row(
  children: [
    const CloudLogo(
      iconSize: 20,
    ),
    const SizedBox(width: 8),

    const Flexible(
      child: Text(
        'One Cloud Enterprise Platform',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: darkBlue,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.gtInStock,
              );
            },
            icon: const Icon(
              Icons.inventory_2_outlined,
              color: skyBlue,
            ),
            label: const Text(
              'GT InStock',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 5, 6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.notifications,
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              color: darkBlue,
            ),
          ),

          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.profile,
              );
            },
            icon: const Icon(
              Icons.account_circle_outlined,
              color: darkBlue,
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),

      body: child,
    );
  }

  Widget _menuItem(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      leading: Icon(
        icon,
        color: skyBlue,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: darkBlue,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        _navigate(context, route);
      },
    );
  }
}