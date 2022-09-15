import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  // File declaration
  File? image; // note: import 'dart:html'; import we can change it to import 'dart:io';

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(maxWidth: 100, maxHeight: 100, source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImagePicker'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(

            children: [
              ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: const Text('Pick Image From Gallery')),
              ElevatedButton(
                  onPressed: () {
                    pickImageCamera();
                  }, child: const Text('Pick Image From Camera')),

              image != null ? Image.file(image!): Text('No Image Selected')

            ],

          ),
        ),
      ),
    );
  }
}
