import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? imageFile;
  XFile? videoFile;
  String noteText = '';
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Page'),
        backgroundColor: Colors.deepPurple.shade50,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _pickImage();
                    },
                    child: Icon(Icons.photo),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      _captureImage();
                    },
                    child: Icon(Icons.camera),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: imageFile == null
                      ? const Text('No image selected')
                      : Image.file(
                          File(imageFile!.path),
                          height: 150,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _pickVideo();
                    },
                    child: Icon(Icons.video_library),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      _recordVideo();
                    },
                    child: Icon(Icons.videocam),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: videoFile == null
                      ? const Text('No video selected')
                      : Text('Video path: ${videoFile!.path}'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Write your note here...',
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    setState(() {
                      noteText = text;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _submit();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    _handleFile(pickedFile);
  }

  Future _captureImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    _handleFile(pickedFile);
  }

  Future _pickVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    _handleFile(pickedFile);
  }

  Future _recordVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);
    _handleFile(pickedFile);
  }

  void _handleFile(XFile? pickedFile) {
    setState(() {
      if (pickedFile != null) {
        if (pickedFile.path.endsWith('.mp4')) {
          videoFile = pickedFile;
          imageFile = null;
        } else {
          imageFile = pickedFile;
          videoFile = null;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')),
        );
      }
    });
  }

  void _submit() {
    print('Note: $noteText');
    if (imageFile != null) {
      print('Image Path: ${imageFile!.path}');
    }
    if (videoFile != null) {
      print('Video Path: ${videoFile!.path}');
    }

    setState(() {
      imageFile = null;
      videoFile = null;
      noteText = '';
    });
  }
}
