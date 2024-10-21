// ignore_for_file: use_build_context_synchronously

import 'package:collage_allerts_app/api/firestore_serves.dart';
import 'package:collage_allerts_app/const.dart';
import 'package:collage_allerts_app/widgets/custom_button.dart';
import 'package:collage_allerts_app/widgets/custtom_snackbar.dart';
import 'package:flutter/material.dart';

class AddNewAlertScreen extends StatefulWidget {
  const AddNewAlertScreen({super.key});

  @override
  _AddNewAlertScreenState createState() => _AddNewAlertScreenState();
}

class _AddNewAlertScreenState extends State<AddNewAlertScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _sendFromController = TextEditingController();
  final TextEditingController _addedByController = TextEditingController();

  Future<void> _addAlert(BuildContext context) async {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final addedBy = _addedByController.text;

    if (title.isNotEmpty && description.isNotEmpty && addedBy.isNotEmpty) {
      try {
        await _firestoreService.addAlert(
            title, description, DateTime.now(), addedBy, context);
        SnackBarHelper.showCustomSnackBar(
          context,
          'Alert added successfully!',
        );
        _titleController.clear();
        _descriptionController.clear();
        _sendFromController.clear();
        _addedByController.clear();
      } catch (error) {
        SnackBarHelper.showCustomSnackBar(
          context,
          'Failed to add alert: $error',
        );
      }
    } else {
      SnackBarHelper.showCustomSnackBar(
        context,
        'Please fill in all fields!',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      appBar: AppBar(
        title: const Text('Add New Alert'),
        backgroundColor: color3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: color2),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: color2),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: color2),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: color2),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            TextField(
              controller: _addedByController, // حقل "Added By"
              decoration: InputDecoration(
                labelText: 'Added By',
                labelStyle: TextStyle(color: color2),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: color2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CusttomButtonWidget(
              onPressed: () => _addAlert(context),
              text: 'Add Alert',
            ),
          ],
        ),
      ),
    );
  }
}
