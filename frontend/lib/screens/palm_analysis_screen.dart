import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import 'dashboard_screen.dart';
import '../widgets/step_progress_bar.dart';

class PalmAnalysisScreen extends StatelessWidget {
  const PalmAnalysisScreen({super.key});

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
              const CommonHeader(title: 'Palm Analysis'),
              // Progress Indicator
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: StepProgressBar(
                  progress: 1.0,
                  steps: const ['Scan', 'Profile', 'Analysis'],
                  backgroundColor: Colors.white.withAlpha(77),
                ),
              ),
              // Palm Image with Overlays (Placeholder)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha((0.05 * 255).round()),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(Icons.image,
                            size: 80, color: Colors.white.withOpacity(0.5)),
                      ),
                      // You can add CustomPaint or SVG overlays here if needed
                    ],
                  ),
                ),
              ),
              // Analysis Result Cards
              Expanded(
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  children: [
                    _buildAnalysisCard(
                      context,
                      color: const Color(0xFFF8FAFC),
                      icon: Icons.favorite,
                      iconColor: Colors.pink,
                      title: 'Love & Relationships',
                      text:
                          'Your heart line indicates a passionate nature with deep emotional connections. You will meet your soulmate at age 28, with significant relationships at ages 32 and 37.',
                    ),
                    _buildAnalysisCard(
                      context,
                      color: const Color(0xFFFFF1F2),
                      icon: Icons.work,
                      iconColor: Colors.pink,
                      title: 'Career & Wealth',
                      text:
                          'Your fate line shows strong career advancement around age 34. Financial stability increases at 37, with a significant property acquisition. Your head line indicates creative problem-solving abilities.',
                    ),
                    _buildAnalysisCard(
                      context,
                      color: const Color(0xFFE0F2FE),
                      icon: Icons.health_and_safety,
                      iconColor: Colors.blue,
                      title: 'Health & Vitality',
                      text:
                          'Your life line indicates good overall health with a potential lifespan of 84 years. Pay attention to stress management in your mid-30s. Your vitality remains strong throughout life.',
                    ),
                    _buildAnalysisCard(
                      context,
                      color: const Color(0xFFD1FAE5),
                      icon: Icons.event,
                      iconColor: Colors.green,
                      title: 'Future Events',
                      text:
                          'Key life events: Marriage in Italy at age 32, first child (daughter) at 34, and significant career advancement between 32-37. Travel opportunities appear frequently in your 40s.',
                    ),
                    const SizedBox(height: 16),
                    // Action Buttons
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFD700),
                                Color(0xFF6366F1),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            constraints: const BoxConstraints(minHeight: 56),
                            child: const Text(
                              'Go To Home',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 56),
                          side: const BorderSide(color: Color(0xFFFFD700)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Share Results',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFD700),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnalysisCard(BuildContext context,
      {required Color color,
      required IconData icon,
      required Color iconColor,
      required String title,
      required String text}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.03 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text(text, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
