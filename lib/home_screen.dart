import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _imageFile; // to store selected image
  final ImagePicker _picker = ImagePicker();

  // 📸 Camera se image lena
  Future<void> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // 🖼️ Gallery se image lena
  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera & Gallery Access")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile != null
                ? Image.file(_imageFile!, height: 250)
                : const Icon(Icons.image, size: 120, color: Colors.grey),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: pickImageFromCamera,
              icon: const Icon(Icons.camera_alt),
              label: const Text("Open Camera"),
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: pickImageFromGallery,
              icon: const Icon(Icons.photo_library),
              label: const Text("Open Gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
