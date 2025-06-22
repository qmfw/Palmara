import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../icons/palm_alt_icon.dart';
import 'user_profile_screen.dart';
import '../widgets/common_header.dart';
import '../widgets/step_progress_bar.dart';

class PalmScanScreen extends StatefulWidget {
  const PalmScanScreen({super.key});

  @override
  State<PalmScanScreen> createState() => _PalmScanScreenState();
}

class _PalmScanScreenState extends State<PalmScanScreen> {
  CameraController? _controller;
  bool _isCameraInitialized = false;
  bool _isLeftHand = true;
  final List<String> _steps = ['Scan', 'Profile', 'Analysis'];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;

    _controller = CameraController(
      cameras.first,
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await _controller!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

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
              const CommonHeader(title: 'Scan Your Palm'),

              // Progress Indicator
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: StepProgressBar(
                  progress: 1 / _steps.length,
                  steps: _steps,
                  backgroundColor: Colors.white.withAlpha(76),
                ),
              ),

              // Camera View
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      children: [
                        if (_isCameraInitialized && _controller != null)
                          CameraPreview(_controller!)
                        else
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF1e3a8a),
                                  Color(0xFF6366f1),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        // Guide Overlay
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        // Palm Guide
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 2,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(120),
                                ),
                                child: Center(
                                  child: PalmAltIcon(
                                    size: 75,
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Text(
                                  'Position your palm in the center\nwith fingers spread',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Instructions
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha((0.05 * 255).round()),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD700),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Ensure good lighting and place your palm flat with fingers slightly spread. We\'ll need both your left and right palms.',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Hand Selection
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHandButton(true),
                    const SizedBox(width: 24),
                    _buildHandButton(false),
                  ],
                ),
              ),

              // Capture Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserProfileScreen(),
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
                        'Capture Palm',
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
    );
  }

  Widget _buildHandButton(bool isLeft) {
    final isSelected = _isLeftHand == isLeft;
    return Column(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFD700),
                      Color(0xFF6366F1),
                    ],
                  )
                : null,
            color: isSelected ? null : Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Center(
              child: PalmAltIcon(
                size: 24,
                color:
                    isSelected ? Colors.white : Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          isLeft ? 'Left Hand' : 'Right Hand',
          style: TextStyle(
            color: isSelected
                ? const Color(0xFFFFD700)
                : Colors.white.withOpacity(0.7),
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
