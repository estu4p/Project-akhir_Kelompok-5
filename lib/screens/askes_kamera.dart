import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccessImage extends StatefulWidget {
  const AccessImage({super.key});

  @override
  State<AccessImage> createState() => _AccessImageState();
}

class _AccessImageState extends State<AccessImage> {
  File? imageCamera;
  File? imageGalery;

  Future camera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.camera);
    imageCamera = File(imagePicked!.path);
    setState(() {});
  }

  Future galery() async {
    WidgetsFlutterBinding.ensureInitialized();
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    imageGalery = File(imagePicked!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue,
        title: const Text(
          'Akses Kamera',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        shape: const Border(
          bottom: BorderSide(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                await galery();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 1,
                        color: Colors.grey.shade400
                        // offset: Offset(4, 8),
                        ),
                  ],
                ),
                child: const Text(
                  'Access Gallery',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () async {
                await camera();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 1,
                        color: Colors.grey.shade400
                        // offset: Offset(4, 8),
                        ),
                  ],
                ),
                child: const Text(
                  'Access Camera',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 200),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Images',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, color: Colors.black),
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: imageGalery == null && imageCamera == null
                      ? const Text('Tidak ada foto')
                      : const Text(''),
                ),
                imageGalery != null
                    ? SizedBox(
                        height: 120,
                        width: 120,
                        child: Image.file(
                          imageGalery!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Center(
                        child: Text(''),
                      ),
                const SizedBox(width: 20),
                imageCamera != null
                    ? SizedBox(
                        height: 120,
                        width: 120,
                        child: Image.file(
                          imageCamera!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Text(' '),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:projekakhir_teori/screens/home.dart';

// class FeedbackPage extends StatefulWidget {
//   @override
//   _FeedbackPageState createState() => _FeedbackPageState();
// }

// class _FeedbackPageState extends State<FeedbackPage> {
//   TextEditingController saranController = TextEditingController();
//   TextEditingController kesanController = TextEditingController();

//   String submittedSaran = '';
//   String submittedKesan = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Saran & Kesan'),
        // backgroundColor: Colors.black,
        // foregroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Kirimkan Saran & Kesan Anda:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: saranController,
//               decoration: const InputDecoration(labelText: 'Saran'),
//               maxLines: 1,
//             ),
//             const SizedBox(height: 5),
//             TextField(
//               controller: kesanController,
//               decoration: const InputDecoration(labelText: 'Kesan'),
//               maxLines: 1,
//             ),
//             const SizedBox(height: 15),
//             ElevatedButton(
//               onPressed: () {
//                 // Store the submitted values
//                 setState(() {
//                   submittedSaran = saranController.text;
//                   submittedKesan = kesanController.text;
//                 });

//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: const Text('Feedback Submitted'),
//                     content: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Saran: $submittedSaran'),
//                         const SizedBox(height: 10),
//                         Text('Kesan: $submittedKesan'),
//                       ],
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context); // Close the dialog
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => HomeScreen()),
//                           );
//                         },
//                         child: const Text('OK'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//               ),
//               child: const Text('Kirim'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
