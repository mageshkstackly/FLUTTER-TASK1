import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../widgets/cloud_logo.dart';
import '../widgets/hover_card.dart';

class AccountSelectionPage extends StatelessWidget {
  final String provider;

  const AccountSelectionPage({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: HoverCard(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const CloudLogo(
                      iconSize: 48,
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Continue with $provider',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: darkBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Select an account to continue to One Cloud Enterprise Platform.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 28),

                    HoverCard(
                      padding: const EdgeInsets.all(16),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.authentication,
                        );
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                skyBlue.withValues(alpha: 0.12),
                            child: Icon(
                              provider == 'Apple'
                                  ? Icons.apple
                                  : Icons.person,
                              color: skyBlue,
                            ),
                          ),

                          const SizedBox(width: 14),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Enterprise Account',
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'user@enterprise.com',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: skyBlue,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: skyBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}