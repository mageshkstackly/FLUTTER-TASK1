import 'package:flutter/material.dart';

import '../widgets/cloud_logo.dart';
import '../widgets/hover_card.dart';
import '../widgets/platform_shell.dart';

class BusinessReportsPage extends StatelessWidget {
  const BusinessReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformShell(
      title: 'Business Reports',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Business Reports',
              style: TextStyle(
                color: darkBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Monitor business performance and enterprise analytics.',
              style: TextStyle(
                color: Color.fromARGB(255, 1, 7, 10),
              ),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final int columns =
                    constraints.maxWidth > 900 ? 3 : 2;

                return GridView.count(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.65,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _report('Revenue', '\$2.4M'),
                    _report('Growth', '18.6%'),
                    _report('Customers', '1,284'),
                    _report('Projects', '86'),
                    _report('Profit Margin', '32.4%'),
                    _report('Satisfaction', '94%'),
                  ],
                );
              },
            ),
            const SizedBox(height: 28),
            HoverCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Monthly Business Progress',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  _progress('Revenue Target', 0.82),
                  const SizedBox(height: 18),
                  _progress('Customer Target', 0.74),
                  const SizedBox(height: 18),
                  _progress('Project Target', 0.91),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _report(String title, String value) {
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

  Widget _progress(String title, double value) {
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
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '${(value * 100).round()}%',
              style: const TextStyle(
                color: skyBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 9,
            backgroundColor: skyBlue.withValues(alpha: 0.10),
            color: skyBlue,
          ),
        ),
      ],
    );
  }
}