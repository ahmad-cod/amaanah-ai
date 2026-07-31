import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../../domain/entities/shipment.dart';
import '../providers/shipment_provider.dart';

class AddShipmentScreen extends ConsumerStatefulWidget {
  const AddShipmentScreen({super.key});

  @override
  ConsumerState<AddShipmentScreen> createState() => _AddShipmentScreenState();
}

class _AddShipmentScreenState extends ConsumerState<AddShipmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _senderController = TextEditingController();
  final _recipientController = TextEditingController();
  final _originController = TextEditingController();
  final _destinationController = TextEditingController();
  final _notesController = TextEditingController();
  
  bool _isLoading = false;

  @override
  void dispose() {
    _senderController.dispose();
    _recipientController.dispose();
    _originController.dispose();
    _destinationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final trackingNum = 'AMN-${(100000 + (DateTime.now().millisecondsSinceEpoch % 899999))}';
    final shipment = Shipment(
      id: const Uuid().v4(),
      trackingNumber: trackingNum,
      sender: _senderController.text.trim(),
      recipient: _recipientController.text.trim(),
      origin: _originController.text.trim(),
      destination: _destinationController.text.trim(),
      status: ShipmentStatus.pending,
      createdAt: DateTime.now(),
      estimatedDelivery: DateTime.now().add(const Duration(days: 3)),
      notes: _notesController.text.trim().isNotEmpty ? _notesController.text.trim() : null,
    );

    final success = await ref.read(shipmentsProvider.notifier).addShipment(shipment);

    if (mounted) {
      setState(() => _isLoading = false);
      if (success) {
        context.pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save shipment locally.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.addShipmentTitle,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                controller: _senderController,
                label: 'Sender Name / Company',
                prefixIcon: Icons.person_outline,
                validator: (val) => val == null || val.isEmpty ? 'Please enter sender name' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _recipientController,
                label: 'Recipient Name',
                prefixIcon: Icons.person,
                validator: (val) => val == null || val.isEmpty ? 'Please enter recipient name' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _originController,
                label: 'Origin Warehouse / Address',
                prefixIcon: Icons.location_on_outlined,
                validator: (val) => val == null || val.isEmpty ? 'Please enter origin location' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _destinationController,
                label: 'Destination Address',
                prefixIcon: Icons.flag_outlined,
                validator: (val) => val == null || val.isEmpty ? 'Please enter destination' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _notesController,
                label: 'Notes / Handling Instructions',
                prefixIcon: Icons.note_outlined,
                maxLines: 3,
              ),
              const SizedBox(height: 32),
              AppButton(
                text: 'Save Shipment',
                icon: Icons.check,
                isLoading: _isLoading,
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
