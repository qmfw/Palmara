import 'package:flutter/material.dart';
import 'package:palmara/screens/dashboard_screen.dart';
import 'package:palmara/screens/insights_screen.dart';
import 'package:palmara/screens/palm_scan_screen.dart';
import 'package:palmara/screens/settings_screen.dart';
import '../widgets/common_footer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Content
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1e3a8a),
                      Color(0xFF1e40af),
                      Color(0xFF3730a3),
                      Color(0xFF4338ca),
                      Color(0xFF6366f1),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 12),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 12,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Reading History',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Track your palm reading journey over time',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.menu_book_rounded,
                                color: Colors.white, size: 28),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    // Filter tabs (on white)
                    Container(
                      child: _buildFilterTabs(context),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: _buildHistoryList(context),
                    ),
                  ],
                ),
              ),
            ),
            CommonFooter(
              selectedIndex: 1,
              onItemSelected: (index) {
                if (index == 0) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen()),
                    (route) => false,
                  );
                } else if (index == 1) {
                  // Do nothing if already on History
                  return;
                } else if (index == 2) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PalmScanScreen()),
                    (route) => false,
                  );
                } else if (index == 3) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InsightsScreen()),
                    (route) => false,
                  );
                } else if (index == 4) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                    (route) => false,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTab(context, 'All Readings', true),
            _buildTab(context, 'Left Hand', false),
            _buildTab(context, 'Right Hand', false),
            _buildTab(context, 'Detailed Reports', false),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 4),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: selected ? const Color(0xFFFFD700) : Colors.white,
          foregroundColor: selected ? Colors.indigo[900] : Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: selected ? Colors.indigo[200]! : Colors.grey[200]!,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.indigo[900] : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      children: [
        _buildMonthDivider('May 2023'),
        _buildHistoryItem(context, 'Full Palm Reading', 'May 15',
            'Both hands analyzed', ['Love', 'Career', 'Health']),
        _buildHistoryItem(context, 'Quick Reading', 'May 8', 'Left hand only',
            ['Love', 'Future']),
        _buildMonthDivider('April 2023'),
        _buildHistoryItem(context, 'First Reading', 'Apr 22',
            'Both hands analyzed', ['Love', 'Career', 'Health', 'Future']),
      ],
    );
  }

  Widget _buildMonthDivider(String month) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              month,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
          const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, String title, String date,
      String subtitle, List<String> tags) {
    final tagColors = [
      Colors.indigo[100],
      Colors.pink[100],
      Colors.blue[100],
      Colors.green[100],
    ];
    final tagTextColors = [
      Colors.indigo[800],
      Colors.pink[800],
      Colors.blue[800],
      Colors.green[800],
    ];
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200],
                ),
                child: const Icon(Icons.image, size: 32, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        Text(date,
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style:
                            TextStyle(color: Colors.grey[700], fontSize: 12)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      children: [
                        for (int i = 0; i < tags.length; i++)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: tagColors[i % tagColors.length],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              tags[i],
                              style: TextStyle(
                                color: tagTextColors[i % tagTextColors.length],
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFFE5E7EB),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFF59E0B),
                  textStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('View Details'),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black.withOpacity(0.7),
                  textStyle: const TextStyle(fontSize: 12),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('Compare'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
