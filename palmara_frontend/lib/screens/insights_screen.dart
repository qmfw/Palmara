import 'package:flutter/material.dart';
import 'package:palmara/screens/dashboard_screen.dart';
import 'package:palmara/screens/history_screen.dart';
import 'package:palmara/screens/settings_screen.dart';
import 'package:palmara/screens/palm_scan_screen.dart';
import '../widgets/common_footer.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Insights',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Personalized palmistry insights for you',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.lightbulb_rounded,
                              color: Colors.white, size: 28),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildCalendarSection(context),
                    _buildTodaysInsight(context),
                    _buildUpcomingEvents(context),
                    _buildLineChangeTracker(context),
                  ],
                ),
              ),
              CommonFooter(
                selectedIndex: 3,
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
                    return;
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
      ),
    );
  }

  Widget _buildCalendarSection(BuildContext context) {
    // New calendar design
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
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
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('May 2023',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    )),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left_rounded,
                          color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right_rounded,
                          color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Center(
              child: SizedBox(
                width: 260,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                      .map((d) => Text(d,
                          style: const TextStyle(fontWeight: FontWeight.w900)))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 4),
            _buildCalendarGrid(
                31, 1, 16, {8: Colors.pink, 15: Colors.blue, 28: Colors.green}),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid(int daysInMonth, int firstWeekday, int selectedDay,
      Map<int, Color> eventDays) {
    final List<Widget> rows = [];
    int day = 1;
    for (int week = 0; week < 6; week++) {
      final List<Widget> cells = [];
      for (int wd = 0; wd < 7; wd++) {
        if (week == 0 && wd < firstWeekday) {
          cells.add(const SizedBox(width: 32, height: 32));
        } else if (day > daysInMonth) {
          cells.add(const SizedBox(width: 32, height: 32));
        } else {
          final isSelected = day == selectedDay;
          final hasEvent = eventDays.containsKey(day);
          final eventColor = eventDays[day];
          cells.add(Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFF59E0B) : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  '$day',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight:
                        isSelected ? FontWeight.w900 : FontWeight.normal,
                  ),
                ),
                if (hasEvent)
                  Positioned(
                    bottom: 6,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: eventColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ));
          day++;
        }
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: cells,
      ));
    }
    return Column(children: rows);
  }

  Widget _buildTodaysInsight(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Today's Insight",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              )),
          const SizedBox(height: 8),
          Container(
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
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emotional Clarity Day',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Your heart line indicates a day of emotional clarity. Focus on expressing your feelings honestly and openly with those close to you.',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
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
                      color: Color(0xFFF59E0B), size: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEvents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upcoming Events',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              )),
          const SizedBox(height: 8),
          Column(
            children: [
              _buildEventCard(
                  context,
                  'Career Opportunity',
                  'Your fate line indicates a significant career opportunity approaching. Be prepared to showcase your skills.',
                  Colors.green,
                  '28'),
              _buildEventCard(
                  context,
                  'Relationship Milestone',
                  'Your heart line shows a deepening connection with someone special. An important conversation is likely.',
                  Colors.pink,
                  'Jun 5'),
              _buildEventCard(
                  context,
                  'Health Focus',
                  'Your life line suggests a period of renewed energy. A good time to start a new fitness routine.',
                  Colors.blue,
                  'Jun 12'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, String title, String desc,
      Color color, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              date,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ),
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Text(desc, style: const TextStyle(fontSize: 13)),
      ),
    );
  }

  Widget _buildLineChangeTracker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Palm Line Changes',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white,
                  )),
              TextButton(
                onPressed: () {},
                child: const Text('View All',
                    style: TextStyle(
                        color: Color(0xFFF59E0B),
                        fontWeight: FontWeight.w500,
                        fontSize: 13)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
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
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Heart Line Evolution',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 8),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Apr → May',
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                    'Your heart line has deepened by 8%, indicating stronger emotional connections forming in your life.',
                    style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
