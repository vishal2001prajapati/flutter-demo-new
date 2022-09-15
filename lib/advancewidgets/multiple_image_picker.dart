import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImagePicker extends StatefulWidget {
  const MultipleImagePicker({Key? key}) : super(key: key);

  @override
  State<MultipleImagePicker> createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFilterList = [];

  void selectImages() async {
    final List<XFile>? selectImages = await imagePicker.pickMultiImage();
    if (selectImages!.isNotEmpty) {
      imageFilterList!.addAll(selectImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Image Picker'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  selectImages();
                },
                child: const Text('Pick Images From Gallery')),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: ((BuildContext context, int index) {
                    return Image.file(File(imageFilterList![index].path),
                        fit: BoxFit.cover);
                  }),
                  itemCount: imageFilterList!.length),
            ))
          ],
        ),
      ),
    );
  }
}
