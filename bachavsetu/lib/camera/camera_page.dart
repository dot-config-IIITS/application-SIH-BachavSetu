import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? imageFile;
  XFile? videoFile;
  final picker = ImagePicker();
  String noteText = '';
  TextEditingController noteTextController = TextEditingController();
  String selectedDisasterOption = 'Option1';
  List<String> disasterOption = [
    'Option1',
    'Option2',
    'Option3',
    'Option4',
    'Option5',
    'Option6',
    'Option7',
    'Option8',
    'Option9',
    'Option10',
    'Option11',
    'Option12',
    'Option13',
    'Option14',
    'Option15',
  ];

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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _pickImage();
                    },
                    child: const Icon(Icons.photo),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _captureImage();
                    },
                    child: const Icon(Icons.camera),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _pickVideo();
                    },
                    child: const Icon(Icons.video_library),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _recordVideo();
                    },
                    child: const Icon(Icons.videocam),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 150,
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
                              width: 150,
                            ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: videoFile == null
                          ? const Text('No video selected')
                          : Image.file(
                              File(videoFile!.path),
                              height: 150,
                              width: 150,
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Dropdown menu for selecting the type of disaster/calamity
              Container(
                width: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select Disaster Type',
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton<String>(
                      value: selectedDisasterOption,
                      onChanged: _onDropdownChanged,
                      items: disasterOption.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Text input for adding notes
              Container(
                width: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: noteTextController,
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

  void _onDropdownChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        selectedDisasterOption = newValue;
      });
    }
  }

  void _submit() {
    print('Note: ${noteTextController.text}');
    print('Selected Disaster Type: $selectedDisasterOption');
    if (imageFile != null) {
      print('Image Path: ${imageFile!.path}');
    }
    if (videoFile != null) {
      print('Video Path: ${videoFile!.path}');
    }

    setState(() {
      imageFile = null;
      videoFile = null;
      noteTextController.clear();
      selectedDisasterOption = 'Option1';
    });
  }
}
