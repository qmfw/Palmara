import 'package:flutter/material.dart';
import '../widgets/common_header.dart';

class AskMysticScreen extends StatelessWidget {
  const AskMysticScreen({super.key});

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
              const CommonHeader(
                title: 'Ask Mystic',
                subtitle: 'Based on your palm reading',
              ),
              // Chat area
              Expanded(
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  children: [
                    // Date indicator
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey[200]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(10),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Today',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Bot message
                    _buildBotMessage(
                      context,
                      'Greetings, Alex. I sense you have questions about your future. Your palm reveals a path of great potential. What would you like to know today?',
                    ),
                    const SizedBox(height: 12),
                    // User message
                    _buildUserMessage(
                      context,
                      'When will I meet my soulmate?',
                    ),
                    const SizedBox(height: 12),
                    // Bot message
                    _buildBotMessage(
                      context,
                      'I see a significant romantic connection forming around your 28th year. Your heart line shows a deep capacity for love and a meaningful relationship that begins unexpectedly during a time of personal growth.',
                    ),
                    const SizedBox(height: 12),
                    // User message
                    _buildUserMessage(
                      context,
                      'Will I be successful in my career?',
                    ),
                    const SizedBox(height: 12),
                    // Bot message
                    _buildBotMessage(
                      context,
                      'Your fate line indicates significant career advancement between ages 32-37. I see a period of challenge followed by recognition and success. Your head line shows creative problem-solving abilities that will serve you well. Financial stability increases notably at 37, with a significant property acquisition.',
                    ),
                  ],
                ),
              ),
              // Suggested questions
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildSuggestionChip('Will I have children?',
                          Colors.amber[200]!, Colors.amber[800]!),
                      _buildSuggestionChip('How long will I live?',
                          Colors.blue[200]!, Colors.blue[800]!),
                      _buildSuggestionChip('When will I travel abroad?',
                          Colors.purple[200]!, Colors.purple[800]!),
                    ],
                  ),
                ),
              ),
              // Input area
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.emoji_emotions_outlined,
                        color: Colors.amber[700]),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Ask the mystic...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber[600],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        icon:
                            const Icon(Icons.send_rounded, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBotMessage(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.amber[500],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserMessage(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.amber[500]!,
                  Colors.amber[700]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestionChip(String label, Color bgColor, Color textColor) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Text(
              label,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
