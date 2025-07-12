import 'package:flutter/material.dart';
import '../widgets/common_footer.dart';
import 'palm_scan_screen.dart';
import 'history_screen.dart';
import 'insights_screen.dart';
import 'settings_screen.dart';
import 'package:palmara/screens/ask_mystic.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _buildBody()),
            CommonFooter(
              selectedIndex: _selectedIndex,
              onItemSelected: _onItemSelected,
              onCameraTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PalmScanScreen(),
                  ),
                );
              },
              onHistoryTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
              onInsightsTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InsightsScreen(),
                  ),
                );
              },
              onSettingsTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return _buildHistoryTab();
      case 2:
        return _buildScanTab();
      case 3:
        return _buildInsightsTab();
      case 4:
        return _buildSettingsTab();
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    return Container(
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Welcome back, Alex',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFD700),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child:
                        const Icon(Icons.person, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
            // Daily Insight
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.05 * 255).round()),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  border: Border.all(color: Colors.white.withOpacity(0.12)),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today's Insight",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Your heart line indicates a day of emotional clarity. Focus on expressing your feelings honestly.',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFD700),
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Read More',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7E0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.wb_sunny_rounded,
                          color: Color(0xFFFFD700), size: 24),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Palm Analysis Summary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Palm Analysis',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFFFD700),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    child: const Text('View All'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.05 * 255).round()),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  border: Border.all(color: Colors.white.withOpacity(0.12)),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFFF3F4F6),
                      ),
                      child: const Icon(Icons.handshake_rounded,
                          color: Color(0xFF1e3a8a), size: 32),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Latest Reading',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'May 15, 2023',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              _buildTag('Love', const Color(0xFFFBCFE8),
                                  const Color(0xFFDB2777)),
                              const SizedBox(width: 4),
                              _buildTag('Career', const Color(0xFFFDE68A),
                                  const Color(0xFFCA8A04)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _buildStatCard('Readings', '3', const Color(0xFF6366F1)),
                  const SizedBox(width: 12),
                  _buildStatCard(
                      'Next Event', '28 days', const Color(0xFFFFD700)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Features
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Explore Features',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildFeatureCard(Icons.timeline_rounded, 'Line Tracker',
                      const Color(0xFF60A5FA)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AskMysticScreen(),
                        ),
                      );
                    },
                    child: _buildFeatureCard(Icons.chat_bubble_rounded,
                        'Ask Mystic', const Color(0xFF8B5CF6)),
                  ),
                  _buildFeatureCard(Icons.notifications_active_rounded,
                      'Reminders', const Color(0xFFFFD700)),
                  _buildFeatureCard(Icons.compare_rounded, 'Compare',
                      const Color(0xFFF87171)),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 11,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.05 * 255).round()),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).round()),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    return const Center(child: Text('History Tab'));
  }

  Widget _buildScanTab() {
    return const PalmScanScreen();
  }

  Widget _buildInsightsTab() {
    return const Center(child: Text('Insights Tab'));
  }

  Widget _buildSettingsTab() {
    return const Center(child: Text('Settings Tab'));
  }
}
