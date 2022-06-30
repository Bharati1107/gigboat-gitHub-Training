// //import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class MemoryImageApp extends StatefulWidget {
//   const MemoryImageApp({Key? key}) : super(key: key);

//   @override
//   State<MemoryImageApp> createState() => _MemoryImageAppState();
// }

// class _MemoryImageAppState extends State<MemoryImageApp> {
//  // File file = File('/Users/Bharati Patil/Downloads/demo/girl.png');//download folder la target karat
//   Uint8List? imageByteData;
//   void getImage() async {
//     Uint8List data =
//         (await rootBundle.load("assets/eggroll.jpg")).buffer.asUint8List();
//     setState(() {
//       // ignore: avoid_print
//       print(data);
//       imageByteData = data;
//     });
//   }

//   @override
//   void initState() {
//     // ignore: todo
//     // TODO: implement initState
//     super.initState();
//     getImage();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Memory Image Demo"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Image.memory(
//                 imageByteData!,
//                 fit: BoxFit.contain,
//                 errorBuilder: (context, exception, stackTrace) {
//                   return const Center(
//                     child: Text("Something Goes Wrong!! Image Not Loaded"),
//                   );
//                 },
//               ),
//               Image.network(
//                 "http://images2.fanpop.com/image/photos/10300000/Tigers-tigers-10309255-1280-1024.jpg",
//                 height: 300,
//                 width: 300,
//                 fit: BoxFit.contain,
//               ),
//               //Image.file(file),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
