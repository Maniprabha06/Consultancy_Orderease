import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:orderease_new/orderdetailspage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  File? _imageFile;
  String _name = '';
  String? _imageUrl;
  bool _isPermanentProfilePicture = false;

  bool _isEditing = false;
  final _nameController = TextEditingController();

  List<Map<String, dynamic>> openOrders = [];
  String selectedTable = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _retrieveOpenOrders();
  }

  Future<void> _loadUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          _name = userDoc['fullName'];
          _imageUrl = userDoc['profileImageUrl'];
          _isPermanentProfilePicture = userDoc['isPermanentProfilePicture'] ?? false;
          _nameController.text = _name;
        });
      }
    }
  }

  Future<void> _retrieveOpenOrders() async {
    final querySnapshot = await _firestore.collection('orders').where('closed', isEqualTo: false).get();
    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        openOrders = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      });
    }
  }

  Future<void> _checkPermission() async {
    final permissionStatus = await Permission.photos.request();

    if (permissionStatus.isGranted) {
      _pickImage();
    } else if (permissionStatus.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Permission permanently denied. Please enable photo access in settings.'),
        ),
      );
      await openAppSettings();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission denied. Cannot access photos.')),
      );
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      await _uploadImage();
    } else {
      print('No image selected.');
    }
  }

  Future<void> _uploadImage() async {
    final user = _auth.currentUser;
    if (user != null && _imageFile != null) {
      final storageRef = _storage.ref().child('profile_images/${user.uid}');
      final uploadTask = storageRef.putFile(_imageFile!);

      await uploadTask.whenComplete(() async {
        try {
          final downloadUrl = await storageRef.getDownloadURL();
          setState(() {
            _imageUrl = downloadUrl;
          });
          await _updateUserProfile();
        } catch (e) {
          print('Error getting download URL: $e');
        }
      });
    } else {
      print('Error: User not signed in or image file not available.');
    }
  }

  Future<void> _updateUserProfile() async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'fullName': _name,
        'profileImageUrl': _imageUrl,
        'isPermanentProfilePicture': true,
      });
    } else {
      print('Error: User not signed in.');
    }
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  Future<void> _saveChanges() async {
    setState(() {
      _name = _nameController.text;
    });
    await _updateUserProfile();
    _toggleEditMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile Page',
          style: GoogleFonts.acme(fontSize: 20.0),
        ),
        centerTitle: false,
        backgroundColor: Colors.pink,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: _toggleEditMode,
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: _imageUrl != null && _isPermanentProfilePicture
                      ? NetworkImage(_imageUrl!)
                      : null,
                  child: _imageUrl == null || !_isPermanentProfilePicture
                      ? const Icon(Icons.account_circle, size: 80)
                      : null,
                ),
                if (_isEditing)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.edit),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            if (_isEditing)
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(label: Text('Name')),
              )
            else
              Text(
                _name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            const Text(
              'Open Orders:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: openOrders.length,
              itemBuilder: (context, index) {
                final orderData = openOrders[index];
                final tableNumber = orderData['tableNumber'];

                return ListTile(
                  title: Text(
                    'Table $tableNumber',
                    style: GoogleFonts.acme(fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailsPage(
                          tableNumber: tableNumber,
                          orderDetails: orderData['orderDetails'] as List<dynamic>,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            if (_isEditing)
              ElevatedButton(
                onPressed: _saveChanges,
                child: const Text('Save'),
              ),
          ],
        ),
      ),
    );
  }
}
