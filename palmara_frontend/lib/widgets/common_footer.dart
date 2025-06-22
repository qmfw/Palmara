import 'package:flutter/material.dart';

class CommonFooter extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final VoidCallback? onCameraTap;
  final VoidCallback? onHistoryTap;
  final VoidCallback? onInsightsTap;
  final VoidCallback? onSettingsTap;

  const CommonFooter({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.onCameraTap,
    this.onHistoryTap,
    this.onInsightsTap,
    this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    // Always use gold for highlight color
    const Color highlightColor = Color(0xFFFFD700);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(
            context,
            icon: Icons.home_rounded,
            label: 'Home',
            index: 0,
            highlightColor: highlightColor,
          ),
          _buildNavItem(
            context,
            icon: Icons.history_rounded,
            label: 'History',
            index: 1,
            onTap: onHistoryTap,
            highlightColor: highlightColor,
          ),
          _buildCenterButton(context, highlightColor),
          _buildNavItem(
            context,
            icon: Icons.insights_rounded,
            label: 'Insights',
            index: 3,
            onTap: onInsightsTap,
            highlightColor: highlightColor,
          ),
          _buildNavItem(
            context,
            icon: Icons.settings_rounded,
            label: 'Settings',
            index: 4,
            onTap: onSettingsTap,
            highlightColor: highlightColor,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    VoidCallback? onTap,
    Color? highlightColor,
  }) {
    final isSelected = selectedIndex == index;
    final Color activeColor = highlightColor ?? const Color(0xFF6366F1);
    final Color inactiveColor = Colors.grey[400]!;
    return GestureDetector(
      onTap: onTap ?? () => onItemSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? activeColor : inactiveColor,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterButton(BuildContext context, Color highlightColor) {
    final isSelected = selectedIndex == 2;
    return Transform.translate(
      offset: const Offset(0, -20),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFFFD700),
            width: 2,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: highlightColor.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: IconButton(
          onPressed: onCameraTap ?? () => onItemSelected(2),
          icon: const Icon(
            Icons.camera_alt_rounded,
            color: Color(0xFFFFD700),
            size: 24,
          ),
        ),
      ),
    );
  }
}
