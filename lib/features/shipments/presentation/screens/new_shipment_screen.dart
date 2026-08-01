import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:amaanah/core/constants/app_colors.dart';
import 'package:amaanah/core/constants/app_strings.dart';
import 'package:amaanah/features/shipments/domain/entities/shipment.dart';
import 'package:amaanah/features/shipments/presentation/providers/shipment_provider.dart';
import 'package:amaanah/features/shipments/presentation/widgets/analysis_result_card.dart';
import 'package:amaanah/features/shipments/presentation/widgets/conversation_widget.dart';
import 'package:amaanah/features/shipments/presentation/widgets/image_attachment_widget.dart';
import 'package:amaanah/shared/widgets/app_button.dart';
import 'package:amaanah/shared/widgets/custom_app_bar.dart';

class NewShipmentScreen extends ConsumerStatefulWidget {
  const NewShipmentScreen({super.key});

  @override
  ConsumerState<NewShipmentScreen> createState() => _NewShipmentScreenState();
}

class _NewShipmentScreenState extends ConsumerState<NewShipmentScreen> {
  final TextEditingController _chatController = TextEditingController();
  final List<ConversationMessage> _messages = [];

  String? _attachedImageName;
  bool _isAnalyzing = false;
  AnalysisResultData? _analysisResult;

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _chatController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        ConversationMessage(
          text: text,
          isUser: true,
          timestamp: DateTime.now(),
        ),
      );
      _chatController.clear();
    });
  }

  void _selectPreset(String prompt) {
    setState(() {
      _chatController.text = prompt;
    });
  }

  void _selectImage(String name, IconData icon, Color color) {
    setState(() {
      _attachedImageName = name;
    });
  }

  void _clearImage() {
    setState(() {
      _attachedImageName = null;
    });
  }

  void _performAnalyze() async {
    if (_messages.isEmpty &&
        _attachedImageName == null &&
        _chatController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Please enter conversation instructions or attach an image first.'),
        ),
      );
      return;
    }

    // Auto-send text if remaining in controller
    if (_chatController.text.trim().isNotEmpty) {
      _sendMessage();
    }

    setState(() {
      _isAnalyzing = true;
      _analysisResult = null;
    });

    // Simulate analysis processing pipeline
    await Future.delayed(const Duration(milliseconds: 1400));

    final rawInput =
        _messages.isNotEmpty ? _messages.last.text : 'Industrial Parts Freight';
    final isElectronics = rawInput.toLowerCase().contains('electronics');
    final isMedical = rawInput.toLowerCase().contains('medical');

    setState(() {
      _isAnalyzing = false;
      _analysisResult = AnalysisResultData(
        trackingNumber:
            'AMN-${(100000 + (DateTime.now().millisecondsSinceEpoch % 899999))}',
        sender: 'Atlas Logistics Hub',
        recipient:
            isMedical ? 'Abuja Specialist Clinic' : 'Kano Central Warehouse',
        origin: 'Dock 4, Lagos Port',
        destination: isMedical ? 'Abuja Capital Zone' : 'Kano Industrial Zone',
        packageType: isElectronics
            ? 'Fragile Electronics'
            : isMedical
                ? 'Cold-Chain Medical Supplies'
                : 'Heavy Industrial Cargo',
        estimatedWeight: isElectronics ? '120 kg' : '450 kg',
        aiLogisticsInsight: isMedical
            ? 'Recommend express cold-chain routing via Express Highway 1. Temperature sensors active.'
            : 'Optimal transit route selected via A2 Northern Corridor. Weather and road risk: Low.',
        confidenceScore: 0.96,
      );
    });
  }

  void _saveShipment() async {
    if (_analysisResult == null) return;

    final shipment = Shipment(
      id: const Uuid().v4(),
      trackingNumber: _analysisResult!.trackingNumber,
      sender: _analysisResult!.sender,
      recipient: _analysisResult!.recipient,
      origin: _analysisResult!.origin,
      destination: _analysisResult!.destination,
      status: ShipmentStatus.pending,
      createdAt: DateTime.now(),
      estimatedDelivery: DateTime.now().add(const Duration(days: 2)),
      notes: 'Extracted from conversation & cargo image.',
    );

    final success =
        await ref.read(shipmentsProvider.notifier).addShipment(shipment);

    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.success,
            content: Text(
                'Shipment ${_analysisResult!.trackingNumber} saved to offline database!'),
          ),
        );
        setState(() {
          _messages.clear();
          _attachedImageName = null;
          _analysisResult = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save shipment.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'New Shipment',
        showOfflineBadge: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Conversation Section
            ConversationWidget(
              messages: _messages,
              controller: _chatController,
              onSend: _sendMessage,
              onSelectPreset: _selectPreset,
            ),
            const SizedBox(height: 24),

            // Image Attachment Section
            ImageAttachmentWidget(
              selectedSampleName: _attachedImageName,
              onSelectImage: _selectImage,
              onClearImage: _clearImage,
            ),
            const SizedBox(height: 28),

            // Analyze Action Button
            ElevatedButton.icon(
              onPressed: _isAnalyzing ? null : _performAnalyze,
              icon: _isAnalyzing
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : const Icon(Icons.analytics_outlined),
              label: Text(
                  _isAnalyzing ? 'Analyzing Inputs...' : 'Analyze Shipment'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            const SizedBox(height: 24),

            // Extracted Analysis Output Card
            if (_analysisResult != null) ...[
              AnalysisResultCard(
                result: _analysisResult!,
                onSaveShipment: _saveShipment,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
