import 'package:flutter/material.dart';
import 'package:palmara/screens/dashboard_screen.dart';
import 'package:palmara/screens/history_screen.dart';
import 'package:palmara/screens/insights_screen.dart';
import 'package:palmara/screens/palm_scan_screen.dart';
import '../widgets/common_footer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              // Header
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
                          'Settings',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Customize your palmistry experience',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings_rounded,
                          color: Colors.white, size: 28),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Content with gradient background
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                  children: [
                    // Profile Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(25),
                              blurRadius: 18,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF59E0B),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text('A',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Alex Johnson',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.black)),
                                  const SizedBox(height: 2),
                                  Text('alex.johnson@email.com',
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 13)),
                                  const SizedBox(height: 2),
                                  const Text('Member since April 2023',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12)),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right_rounded,
                                color: Colors.black38, size: 28),
                          ],
                        ),
                      ),
                    ),
                    // Section Title: Account
                    Padding(
                      padding: const EdgeInsets.only(left: 28, bottom: 8),
                      child: Text('Account',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ),
                    // Account Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _settingsTile(
                              icon: Icons.person,
                              iconColor: Colors.blue,
                              label: 'Edit Profile',
                              onTap: () {},
                            ),
                            _divider(),
                            _settingsTile(
                              icon: Icons.lock,
                              iconColor: Colors.green,
                              label: 'Privacy & Security',
                              onTap: () {},
                            ),
                            _divider(),
                            _settingsTile(
                              icon: Icons.credit_card,
                              iconColor: Colors.purple,
                              label: 'Subscription',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Section Title: App Settings
                    Padding(
                      padding: const EdgeInsets.only(left: 28, bottom: 8),
                      child: Text('App Settings',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ),
                    // App Settings Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _settingsTile(
                              icon: Icons.notifications,
                              iconColor: Color(0xFFF59E0B),
                              label: 'Notifications',
                              trailing: Switch(
                                value: true,
                                onChanged: (_) {},
                                activeColor: Color(0xFFF59E0B),
                                inactiveThumbColor: Colors.grey[400],
                                inactiveTrackColor: Colors.grey[300],
                              ),
                            ),
                            _divider(),
                            _settingsTile(
                              icon: Icons.dark_mode,
                              iconColor: Colors.orange,
                              label: 'Dark Mode',
                              trailing: Switch(
                                value: false,
                                onChanged: (_) {},
                                activeColor: Color(0xFFF59E0B),
                                inactiveThumbColor: Colors.grey[400],
                                inactiveTrackColor: Colors.grey[300],
                              ),
                            ),
                            _divider(),
                            _settingsTile(
                              icon: Icons.upload_file,
                              iconColor: Colors.red,
                              label: 'Export Data',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Section Title: Support & About
                    Padding(
                      padding: const EdgeInsets.only(left: 28, bottom: 8),
                      child: Text('Support & About',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ),
                    // Support Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _settingsTile(
                              icon: Icons.help_outline,
                              iconColor: Colors.indigo,
                              label: 'Help & Support',
                              onTap: () {},
                            ),
                            _divider(),
                            _settingsTile(
                              icon: Icons.privacy_tip,
                              iconColor: Colors.green,
                              label: 'Privacy Policy',
                              onTap: () {},
                            ),
                            _divider(),
                            _settingsTile(
                              icon: Icons.info_outline,
                              iconColor: Colors.purple,
                              label: 'About Palmara',
                              trailing: const Text('Version 1.2.0',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54)),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Logout Button
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 32),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text('Log Out'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CommonFooter(
                selectedIndex: 4,
                onItemSelected: (index) {
                  if (index == 0) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                      (route) => false,
                    );
                  } else if (index == 1) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryScreen()),
                      (route) => false,
                    );
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
                    // Do nothing if already on Settings
                    return;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for divider between tiles
  Widget _divider() => const Divider(
      height: 1,
      thickness: 1,
      color: Color(0xFFF3F4F6),
      indent: 16,
      endIndent: 16);

  // Helper for settings tile
  Widget _settingsTile({
    required IconData icon,
    required Color iconColor,
    required String label,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: iconColor.withAlpha(38),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
      trailing: trailing ??
          const Icon(Icons.chevron_right_rounded, color: Colors.black38),
      onTap: onTap,
    );
  }
}
