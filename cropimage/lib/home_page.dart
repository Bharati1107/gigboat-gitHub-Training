// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, duplicate_ignore

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceType { gallery, camera }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void getImageFile(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Example"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton.extended(
              label: const Text("Camera"),
              onPressed: () => getImageFile(context, ImageSourceType.camera),
              heroTag: UniqueKey(),
              icon: const Icon(Icons.camera),
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton.extended(
              label: const Text("Gallery"),
              onPressed: () => getImageFile(context, ImageSourceType.gallery),
              heroTag: UniqueKey(),
              icon: const Icon(Icons.photo_library),
            )
          ],
        ),
      ),
    );
  }
}
//import 'package:flutter/material.dart';

class ImageFromGalleryEx extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final type;
  // ignore: use_key_in_widget_constructors
  const ImageFromGalleryEx(this.type);

  @override
  // ignore: no_logic_in_create_state, unnecessary_this
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  // ignore: prefer_typing_uninitialized_variables
  var _image;
  var imagePicker;
  var type;
  //ImageProvider imageProvider = const ImageProvider();
  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    //print(_image.LengthSync());
    return Scaffold(
      appBar: AppBar(
          title: Text(type == ImageSourceType.camera
              ? "Image from Camera"
              : "Image from Gallery")),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 52,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                  print(_image.LengthSync());
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Colors.red[200]),
                child: _image != null
                    ? Image.file(
                        _image,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        decoration: BoxDecoration(color: Colors.red[200]),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
