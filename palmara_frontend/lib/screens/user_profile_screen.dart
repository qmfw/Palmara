import 'package:flutter/material.dart';
import 'package:palmara/screens/palm_scan_screen.dart';
import 'palm_analysis_screen.dart';
import '../widgets/common_header.dart';
import '../widgets/step_progress_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _gender;
  String? _zodiac;
  final List<String> _interests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: Column(
            children: [
              // Header
              CommonHeader(
                title: 'Your Profile',
                onBackPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PalmScanScreen()),
                  );
                },
              ),
              // Progress Indicator
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: StepProgressBar(
                  progress: 2 / 3,
                  steps: const ['Scan', 'Profile', 'Analysis'],
                  backgroundColor: Colors.white.withAlpha(77),
                ),
              ),
              // Form
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'To provide a more accurate reading, please share some personal details with us.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Name
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: const TextStyle(color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Color(0xFFFFD700), width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Date of Birth
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            labelStyle: const TextStyle(color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Color(0xFFFFD700), width: 2),
                            ),
                          ),
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2000),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Color(0xFFFFD700), // gold
                                      onPrimary:
                                          Colors.black, // text color on gold
                                      onSurface:
                                          Colors.black, // default text color
                                    ), // background of dialog
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors
                                            .black, // Cancel and OK buttons
                                      ),
                                    ),
                                    dialogTheme: const DialogThemeData(
                                        backgroundColor: Colors.white),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        // Gender
                        const Text('Gender',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900)),
                        Row(
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'male',
                                  groupValue: _gender,
                                  onChanged: (val) =>
                                      setState(() => _gender = val),
                                  activeColor: const Color(0xFFFFD700),
                                  fillColor: WidgetStateProperty.all<Color>(
                                      Colors.white),
                                ),
                                const Text('Male',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'female',
                                  groupValue: _gender,
                                  onChanged: (val) =>
                                      setState(() => _gender = val),
                                  activeColor: const Color(0xFFFFD700),
                                  fillColor: WidgetStateProperty.all<Color>(
                                      Colors.white),
                                ),
                                const Text('Female',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'other',
                                  groupValue: _gender,
                                  onChanged: (val) =>
                                      setState(() => _gender = val),
                                  activeColor: const Color(0xFFFFD700),
                                  fillColor: WidgetStateProperty.all<Color>(
                                      Colors.white),
                                ),
                                const Text('Other',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Zodiac
                        DropdownButtonFormField<String>(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Zodiac Sign',
                            labelStyle: const TextStyle(color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Color(0xFFFFD700), width: 2),
                            ),
                          ),
                          value: _zodiac,
                          items: [
                            'Aries',
                            'Taurus',
                            'Gemini',
                            'Cancer',
                            'Leo',
                            'Virgo',
                            'Libra',
                            'Scorpio',
                            'Sagittarius',
                            'Capricorn',
                            'Aquarius',
                            'Pisces'
                          ]
                              .map((sign) => DropdownMenuItem(
                                    value: sign,
                                    child: Text(sign,
                                        style: const TextStyle(
                                            color: Colors.black)),
                                  ))
                              .toList(),
                          onChanged: (val) => setState(() => _zodiac = val),
                        ),
                        const SizedBox(height: 16),
                        // Email
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: const TextStyle(color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Color(0xFFFFD700), width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Interests
                        const Text('Areas of Interest',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildInterestChip('Love & Relationships'),
                            _buildInterestChip('Career & Wealth'),
                            _buildInterestChip('Health & Vitality'),
                            _buildInterestChip('Future Events'),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Continue Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PalmAnalysisScreen(),
                                ),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                constraints:
                                    const BoxConstraints(minHeight: 56),
                                child: const Text(
                                  'Continue to Analysis',
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInterestChip(String label) {
    final selected = _interests.contains(label);
    return FilterChip(
      label: Text(label, style: const TextStyle(color: Colors.black)),
      selected: selected,
      onSelected: (val) {
        setState(() {
          if (val) {
            _interests.add(label);
          } else {
            _interests.remove(label);
          }
        });
      },
      selectedColor: const Color(0xFFFFD700),
      checkmarkColor: Colors.white,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: selected ? const Color(0xFFFFD700) : Colors.white,
        ),
      ),
    );
  }
}
