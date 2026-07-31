import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ConversationMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  const ConversationMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class ConversationWidget extends StatelessWidget {
  final List<ConversationMessage> messages;
  final TextEditingController controller;
  final VoidCallback onSend;
  final Function(String) onSelectPreset;

  const ConversationWidget({
    super.key,
    required this.messages,
    required this.controller,
    required this.onSend,
    required this.onSelectPreset,
  });

  static const List<String> quickPrompts = [
    "Ship 25 crates of electronics from Lagos Central Dock to Kano Hub.",
    "Fragile medical supplies requiring temperature-controlled delivery to Abuja.",
    "50 pallets of industrial spare parts for urgent delivery to Port Harcourt.",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.chat_bubble_outline, color: AppColors.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Logistics Conversation & Instructions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Preset suggestions chip list
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: quickPrompts.map((prompt) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ActionChip(
                  avatar: const Icon(Icons.auto_awesome, size: 14, color: AppColors.primary),
                  label: Text(
                    prompt,
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: AppColors.primary.withOpacity(0.08),
                  side: BorderSide.none,
                  onPressed: () => onSelectPreset(prompt),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 12),

        // Message bubbles container
        Container(
          constraints: const BoxConstraints(maxHeight: 220),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: messages.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      'Type or select shipment details above to start conversation.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondaryLight,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return Align(
                      alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: msg.isUser
                              ? AppColors.primary
                              : AppColors.primary.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          msg.text,
                          style: TextStyle(
                            color: msg.isUser ? Colors.white : AppColors.textPrimaryLight,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
        const SizedBox(height: 8),

        // Input field row
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter cargo description or destination details...',
                  hintStyle: const TextStyle(fontSize: 13),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onSubmitted: (_) => onSend(),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              icon: const Icon(Icons.send_rounded),
              style: IconButton.styleFrom(backgroundColor: AppColors.primary),
              onPressed: onSend,
            ),
          ],
        ),
      ],
    );
  }
}
