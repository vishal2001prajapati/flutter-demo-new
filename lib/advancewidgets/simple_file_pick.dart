// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
//
// class SimpleFilePicker extends StatefulWidget {
//   const SimpleFilePicker({Key? key}) : super(key: key);
//
//   @override
//   State<SimpleFilePicker> createState() => _SimpleFilePickerState();
// }
//
// class _SimpleFilePickerState extends State<SimpleFilePicker> {
//   List<XFile>? imageFilterList = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('file picker'),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: ElevatedButton(
//           onPressed: () async {
//             final result =
//                 await FilePicker.platform.pickFiles(allowMultiple: true);
//             if (result == null) return;
//             // open single file
//             final file = result.files.first;
//             openFiles(file);
//             openFilesNew(result.files);
//             print('Name--> ${file.name}');
//             print('Bytes--> ${file.bytes}');
//             print('Extension--> ${file.extension}');
//             print('Path--> ${file.path}');
//
//             final newFile = await saveFilePermanetley(file);
//             print('From path--> ${file.path}');
//             print('To path--> ${newFile.path}');
//           },
//           child: Text('pick file'),
//         ),
//       ),
//     );
//   }
//
//   void openFiles(PlatformFile file) {
//     OpenFile.open(file.path!);
//   }
//
//   Future<File> saveFilePermanetley(PlatformFile file) async {
//     final appStorage = await getApplicationDocumentsDirectory();
//     final newFile = File('${appStorage.path}/${file.name}');
//     return File(file.path!).copy(newFile.path);
//   }
//
//   void openFilesNew(List<PlatformFile> files) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//             const BottomNavigationPanel()));
//
//
//     GridView.builder(
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//         itemBuilder: ((BuildContext context, int index) {
//           return Image.file(File(imageFilterList![index].path),
//               fit: BoxFit.cover);
//         }),
//         itemCount: imageFilterList!.length);
//   }
// }
