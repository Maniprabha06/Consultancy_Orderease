import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;
  String _name = '';
  int _age = 0;
  int _experience = 0;
  String _email = '';
  String _city = '';

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile Page',
          style: GoogleFonts.acme(
            fontSize: 20.0,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.pink,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                  child: _imageFile == null
                      ? const Icon(Icons.account_circle, size: 80)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: _pickImage,
                    icon: Icon(Icons.edit),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Input fields for user details
            TextFormField(
              decoration: InputDecoration(label: const Text('Name')),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(label: const Text('Age')),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _age = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(label: const Text('Experience')),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _experience = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(label: const Text('Email')),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(label: const Text('City')),
              onChanged: (value) {
                setState(() {
                  _city = value;
                });
              },
            ),
            const SizedBox(height: 50),
            // Save and Cancel Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement logic to save user details
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement logic to cancel changes
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
