import 'dart:convert';
import 'dart:io';

import 'package:bachavsetu/login/socket_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  late List<String> stateNames;
  Map<String, List<String>> districts = {};
  late String selectedStateName;
  late String selectedDistrict;
  String feedback = '';

  @override
  void initState() {
    super.initState();
    selectedStateName = '';
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
        title: const Text('Feedback Form'),
        backgroundColor: Colors.deepPurple.shade50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Flexible
            // (child:DropdownButtonFormField<String>(
            //   decoration: const InputDecoration(labelText: 'Select State'),
            //   value: selectedStateName,
            //   items: stateNames.map((stateName) {
            //     return DropdownMenuItem<String>(
            //       value: stateName,
            //       child: Text(stateName),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       selectedStateName = value!;
            //       selectedDistrict =
            //           districts[value]!.isNotEmpty ? districts[value]![0] : '';
            //     });
            //   },
            // ),)
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
            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter Your Feedback Here',
                hintText: 'Enter Your Feedback Here',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              onChanged: (value) {
                setState(() {
                  feedback = value;
                });
              },
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                IO.Socket socket = SocketManager.getSocket();
                socket.emit("feedback", {
                  'state': selectedStateName,
                  'district': selectedDistrict,
                  'feedback': feedback,
                });
                showSubmittedPopup(context);
                print(
                    'State: $selectedStateName, District: $selectedDistrict, Feedback: $feedback');
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void showSubmittedPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Thank you for sending a feedback."),
          content: const Text(
              "We will try to resolve the issue as soon as possible and make our app better."),
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
