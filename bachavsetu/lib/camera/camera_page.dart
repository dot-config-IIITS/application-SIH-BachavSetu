import 'dart:io';
import 'dart:convert';
import 'package:bachavsetu/login/socket_manager.dart';
import 'package:bachavsetu/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';

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
      // backgroundColor: Colors.deepPurple.shade100,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
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
                  color: Colors.grey[100],
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
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedDisasterOption = newValue;
                            });
                          }
                        },
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
                  color: Colors.grey[100],
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
                  color: Colors.grey[100],
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
                  color: Colors.grey[100],
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
                  _submit(context);
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

  void _submit(BuildContext context) async {
    print('Note: ${noteTextController.text}');
    print('Selected Disaster Type: $selectedDisasterOption');
    IO.Socket socket = SocketManager.getSocket();
    if (imageFile != null) {
      showSubmittedPopup(context);
      print('Image Path: ${imageFile!.path}');
      List<int> bytes = await File(imageFile!.path).readAsBytes();
      socket.emit("report_danger_site", {
        'file_data': bytes,
        'coordinates': [
          context.read<UserDataModel>().latitude,
          context.read<UserDataModel>().longitude
        ],
        'type': selectedDisasterOption,
        'state': selectedStateName,
        'district': selectedDistrict,
        'extension': '.jpg',
        'text': noteTextController.text,
      });
    } else if (videoFile != null) {
      final inputFile = File(videoFile!.path);
      final outputDir = await getTemporaryDirectory();
      final outputFilePath = '${outputDir.path}/compressed_video.mp4';
      await FFmpegKit.execute(
        '-i ${inputFile.path} -vf scale=854:480 -c:a copy $outputFilePath',
      );
      showSubmittedPopup(context);
      List<int> bytes = await File(outputFilePath).readAsBytes();
      socket.emit("report_danger_site", {
        'file_data': bytes,
        'coordinates': [
          context.read<UserDataModel>().latitude,
          context.read<UserDataModel>().longitude
        ],
        'type': selectedDisasterOption,
        'state': selectedStateName,
        'district': selectedDistrict,
        'extension': '.mp4',
        'text': noteTextController.text,
      });
    } else {
      showPopup(context);
    }

    setState(() {
      imageFile = null;
      videoFile = null;
      noteTextController.clear();
      selectedDisasterOption = 'Road Accident';
    });
    socket.on("report_danger_site_result", (data) {
      print(data);
    });
  }

  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("No image or video file."),
          content: const Text(
              "Please select a valid image or video file before submitting."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showSubmittedPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Thank you for reporting."),
          content: const Text(
              "Your report has successfully been sent for verification. Help will arrive soon."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
