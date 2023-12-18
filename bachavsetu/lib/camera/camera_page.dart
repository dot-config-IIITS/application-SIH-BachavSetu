import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String selectedDisasterOption = 'Road Accident';
  List<String> disasterOption = [
    'Cyclone',
    'Earthquake',
    'Fire',
    'Flood',
    'Industrial Accident',
    'Land Slide',
    'Power Outage',
    'Road Accident',
    'Tornado',
    'Tsunami',
    'Wild Fire',
    'Winter Storm',
  ];

  late List<String> stateNames;
  Map<String, List<String>> districts = {};
  late String selectedStateName;
  late String selectedDistrict;
  String feedback = '';

  @override
  void initState() {
    super.initState();
    selectedStateName = 'xd';
    selectedDistrict = '';
    stateNames = [];
    _loadStatesAndDistricts();
  }

  Future<void> _loadStatesAndDistricts() async {
    final String data = await rootBundle
        .loadString('assets/settingsAssets/states_districts.json');
    final Map<String, dynamic> statesData = json.decode(data);

    statesData.forEach((key, value) {
      stateNames.add(value['name']);
      districts[value['name']] = List<String>.from(value['districts']);
    });

    setState(() {
      selectedStateName = stateNames.isNotEmpty ? stateNames[0] : '';
      selectedDistrict = districts[selectedStateName]!.isNotEmpty
          ? districts[selectedStateName]![0]
          : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report A Disaster'),
        backgroundColor: Colors.deepPurple.shade50,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         _pickImage();
              //       },
              //       child: const Icon(Icons.photo),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         _captureImage();
              //       },
              //       child: const Icon(Icons.camera),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         _pickVideo();
              //       },
              //       child: const Icon(Icons.video_library),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         _recordVideo();
              //       },
              //       child: const Icon(Icons.videocam),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 15),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       width: 150,
              //       height: 150,
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.grey),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Center(
              //         child: imageFile == null
              //             ? const Text('No image selected')
              //             : Image.file(
              //                 File(imageFile!.path),
              //                 height: 150,
              //                 width: 150,
              //               ),
              //       ),
              //     ),
              //     Container(
              //       width: 150,
              //       height: 150,
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.grey),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Center(
              //         child: videoFile == null
              //             ? const Text('No video selected')
              //             : Image.file(
              //                 File(videoFile!.path),
              //                 height: 150,
              //                 width: 150,
              //               ),
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _captureImage();
                        },
                        child: const Icon(Icons.camera),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _pickImage();
                        },
                        child: const Icon(Icons.photo),
                      ),
                    ],
                  ),
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
                ],
              ),

              const SizedBox(height: 20),
              // Dropdown menu for selecting the type of disaster/calamity
              Container(
                width: 350,
                height: 60,
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
                    Flexible(
                      child: DropdownButton<String>(
                        underline: Container(),
                        value: selectedDisasterOption,
                        onChanged: _onDropdownChanged,
                        items: disasterOption.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 350,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select State',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: DropdownButton<String>(
                        underline: Container(),
                        isExpanded: true,
                        value: selectedStateName,
                        onChanged: (value) {
                          setState(() {
                            selectedStateName = value!;
                            selectedDistrict = districts[value]!.isNotEmpty
                                ? districts[value]![0]
                                : '';
                          });
                        },
                        items: stateNames.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(
                              option,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 350,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select District',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: DropdownButton<String>(
                        underline: Container(),
                        isExpanded: true,
                        value: selectedDistrict,
                        onChanged: (value) {
                          setState(() {
                            selectedDistrict = value!;
                          });
                        },
                        items: districts[selectedStateName]?.map((district) {
                              return DropdownMenuItem<String>(
                                value: district,
                                child: Text(district),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Text input for adding notes
              Container(
                width: 350,
                height: 60,
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
              const SizedBox(height: 30),
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
