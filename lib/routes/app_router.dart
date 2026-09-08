import 'package:flutter/material.dart';

import '../pages/account_selection_page.dart';
import '../pages/authentication_page.dart';
import '../pages/business_reports_page.dart';
import '../pages/cloud_services_page.dart';
import '../pages/crm_page.dart';
import '../pages/employee_management_page.dart';
import '../pages/forgot_password_page.dart';
import '../pages/gt_instock_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/notifications_page.dart';
import '../pages/profile_page.dart';
import '../pages/reset_link_sent_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      case AppRoutes.authentication:
        return MaterialPageRoute(
          builder: (context) => const AuthenticationPage(),
        );

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordPage(),
        );

      case AppRoutes.resetLinkSent:
        return MaterialPageRoute(
          builder: (context) => const ResetLinkSentPage(),
        );

      case AppRoutes.accountSelection:
        final String provider =
            settings.arguments is String
                ? settings.arguments as String
                : 'Google';

        return MaterialPageRoute(
          builder: (context) => AccountSelectionPage(
            provider: provider,
          ),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      case AppRoutes.cloud:
        return MaterialPageRoute(
          builder: (context) => const CloudServicesPage(),
        );

      case AppRoutes.employees:
        return MaterialPageRoute(
          builder: (context) => const EmployeeManagementPage(),
        );

      case AppRoutes.crm:
        return MaterialPageRoute(
          builder: (context) => const CRMPage(),
        );

      case AppRoutes.reports:
        return MaterialPageRoute(
          builder: (context) => const BusinessReportsPage(),
        );

      case AppRoutes.gtInStock:
        return MaterialPageRoute(
          builder: (context) => const GTInStockPage(),
        );

      case AppRoutes.notifications:
        return MaterialPageRoute(
          builder: (context) => const NotificationsPage(),
        );

      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
    }
  }
}