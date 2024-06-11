import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sobatternak_application/features/profile/EditProfil.dart';
import 'package:sobatternak_application/features/profile/GantiPassword.dart';
import 'package:sobatternak_application/features/profile/TentangKami.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  String? _imageUrl;
  String? _name;
  String? _email;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').child(user.uid);
      DataSnapshot snapshot = await userRef.get();

      if (snapshot.exists) {
        if (mounted) {
          setState(() {
            _name = snapshot.child('name').value as String?;
            _email = snapshot.child('email').value as String?;
            _imageUrl = snapshot.child('profileImageUrl').value as String?;
          });
        }
      }
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      await _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('profile_images/${user.uid}');
      UploadTask uploadTask = ref.putFile(_image!);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').child(user.uid);
      await userRef.update({'profileImageUrl': downloadUrl});

      if (mounted) {
        setState(() {
          _imageUrl = downloadUrl;
        });
      }
    } catch (e) {
      print('Failed to upload image: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Hentikan proses asinkron di sini jika ada
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromRGBO(85, 35, 124, 0.923),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: AvatarClipper(),
              child: Container(
                height: 250,
                color: Color.fromRGBO(85, 35, 124, 0.923),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 60),
                  Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: _imageUrl != null
                                ? NetworkImage(_imageUrl!)
                                : AssetImage('assets/images/profile/placeholder.png') as ImageProvider,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _name ?? 'Name not available',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _email ?? 'Email not available',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EditProfileScreen()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              side: BorderSide(color: Colors.transparent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ).copyWith(
                              side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                                if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                                  return BorderSide(color: Colors.grey);
                                }
                                return BorderSide(color: Colors.transparent);
                              }),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.edit, size: 24),
                                    SizedBox(width: 8),
                                    Text('Edit Profile'),
                                  ],
                                ),
                                Divider(thickness: 1, color: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 0),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GantiPasswordScreen()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              side: BorderSide(color: Colors.transparent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ).copyWith(
                              side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                                if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                                  return BorderSide(color: Colors.grey);
                                }
                                return BorderSide(color: Colors.transparent);
                              }),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.lock, size: 24),
                                    SizedBox(width: 8),
                                    Text('Ubah Password'),
                                  ],
                                ),
                                Divider(thickness: 1, color: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 0),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TentangKamiScreen()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              side: BorderSide(color: Colors.transparent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ).copyWith(
                              side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                                if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                                  return BorderSide(color: Colors.grey);
                                }
                                return BorderSide(color: Colors.transparent);
                              }),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.help, size: 24),
                                    SizedBox(width: 8),
                                    Text('Tentang Kami'),
                                  ],
                                ),
                                Divider(thickness: 1, color: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 0),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TentangKamiScreen()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              side: BorderSide(color: Colors.transparent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ).copyWith(
                              side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                                if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                                  return BorderSide(color: Colors.grey);
                                }
                                return BorderSide(color: Colors.transparent);
                              }),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.logout, size: 24),
                                    SizedBox(width: 8),
                                    Text('Keluar'),
                                  ],
                                ),
                                Divider(thickness: 1, color: Colors.grey),
                              ],
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
        ],
      ),
    );
  }
}

class AvatarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 50; // Radius of the avatar
    double centerX = size.width / 2;
    double centerY = 120; // Adjust the Y position of the avatar clip

    Path path = Path();
    path.lineTo(0, centerY - radius);
    path.quadraticBezierTo(centerX, centerY + radius, size.width, centerY - radius);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
