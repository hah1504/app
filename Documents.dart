import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:authentification/signup.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Documents extends StatefulWidget {
  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    //var imageUrl;
    return Scaffold(
      appBar: AppBar(title: Text('Documents Upload'), centerTitle: true),
      body: Column(children: <Widget>[
        (imageUrl != null)
            ? Image.network(imageUrl)
            : Placeholder(
                fallbackHeight: 200.0, fallbackWidth: double.infinity),
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          child: Text('Upload Image'),
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue,
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 10, fontStyle: FontStyle.normal),
          ),
          onPressed: () => uploadImage(),
        )
      ]),
    );
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    // Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      // Select Image
      // ignore: deprecated_member_use
      image = (await _picker.getImage(source: ImageSource.gallery))!;
      var file = File(image.path);
      if (image != null) {
        //Upload to Firebase
        var snapshot =
            await _storage.ref().child('folderName/imageName').putFile(file);
        //.onComplete;
        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No path received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }
}
