import 'package:flutter/material.dart';

class StepProgressBar extends StatelessWidget {
  final double progress;
  final List<String> steps;
  final Color backgroundColor;

  const StepProgressBar({
    super.key,
    required this.progress,
    required this.steps,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            steps.length,
            (i) => Text(
              steps[i],
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: backgroundColor,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD700)),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
