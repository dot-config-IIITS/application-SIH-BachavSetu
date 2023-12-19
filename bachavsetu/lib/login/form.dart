import 'package:bachavsetu/init_page.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:bachavsetu/login/socket_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bachavsetu/providers/user_data_provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController emergencyPhoneNumberCon = TextEditingController();
  TextEditingController name = TextEditingController();
  String selectedGender = 'Male';
  String selectedBloodGroup = 'A+';
  String selectedRelationship = 'Father';
  DateTime selectedDOB = DateTime.now();
  List<String> genderOptions = [
    'Male',
    'Female',
    'Prefer not to say',
    'Others'
  ];
  List<String> bloodGroupOptions = [
    'A+',
    'B+',
    'AB+',
    'O+',
    'A-',
    'B-',
    'AB-',
    'O-'
  ];
  List<String> relationshipOptions = [
    'Father',
    'Mother',
    'Spouse',
    'Brother',
    'Sister',
    'Son',
    'Daughter',
    'Grandfather',
    'Grandmother',
    'Uncle',
    'Aunt',
    'Cousin',
    'Friend',
    'Neighbor',
    'Colleague',
    'Other',
    // MORE RELATIONS CAN BE ADDED
  ];

  bool isValidPhoneNumber() {
    return emergencyPhoneNumberCon.text.replaceAll(RegExp(r'\D'), '').length ==
        10;
  }

  void showInvalidPhoneNumberPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Invalid Phone Number"),
          content: const Text("Please enter a valid 10-digit phone number."),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
        backgroundColor: Colors.deepPurple.shade50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(label: 'Name', con: name),
              const SizedBox(height: 16),
              _buildDatePickerRow(
                label: 'Date of Birth',
                selectedDate: selectedDOB,
                onDateChanged: (date) {
                  setState(() {
                    selectedDOB = date;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildDropdownRow(
                label: 'Gender',
                value: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
                items: genderOptions,
              ),
              const SizedBox(height: 16),
              _buildDropdownRow(
                label: 'Blood Group',
                value: selectedBloodGroup,
                onChanged: (value) {
                  setState(() {
                    selectedBloodGroup = value!;
                  });
                },
                items: bloodGroupOptions,
              ),
              const SizedBox(height: 16),
              // _buildTextField(
              //   label: 'Emergency Contact',
              //   con: emergencyPhoneNumberCon,
              //   keyboardType: TextInputType.phone,
              //   prefixText: '(+91) ',
              // ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLength: 10,
                  controller: emergencyPhoneNumberCon,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Emergency Contact',
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(171, 71, 188, 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(171, 71, 188, 1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(171, 71, 188, 1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixText: '(+91) ',
                    prefixStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildDropdownRow(
                label: 'Relationship with Emergency Contact',
                value: selectedRelationship,
                onChanged: (value) {
                  setState(() {
                    selectedRelationship = value!;
                  });
                },
                items: relationshipOptions,
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // HANDLE FORM SUBMISSION
                  if (isValidPhoneNumber() == false) {
                    showInvalidPhoneNumberPopup(context);
                  }

                  if (name.text == "") {
                    print("USER DIDN'T ENTER NAME");
                  } else {
                    print(name.text);
                    context.read<UserDataModel>().updateName(name.text);
                    print(
                        '${selectedDOB.day}-${selectedDOB.month}-${selectedDOB.year}');
                    context.read<UserDataModel>().updateDOB(
                        '${selectedDOB.day}-${selectedDOB.month}-${selectedDOB.year}');
                    print(selectedGender);
                    context.read<UserDataModel>().updateGender(selectedGender);
                    print(selectedBloodGroup);
                    context
                        .read<UserDataModel>()
                        .updateBloodGroup(selectedBloodGroup);
                    print(selectedRelationship);
                    context
                        .read<UserDataModel>()
                        .updateERelation(selectedRelationship);
                    print(emergencyPhoneNumberCon.text);
                    context
                        .read<UserDataModel>()
                        .updateEContact(emergencyPhoneNumberCon.text);
                    print(context.read<UserDataModel>().phone);
                    IO.Socket socket = SocketManager.getSocket();
                    socket.on("add_details_result", (data) {
                      print(data);
                      Navigator.of(context).push(_createPageRoute());
                    });
                    socket.emit("add_details", {
                      'name': context.read<UserDataModel>().name,
                      'dob': context.read<UserDataModel>().dob,
                      'blood_group': context.read<UserDataModel>().bloodGroup,
                      'emergency_contact':
                          context.read<UserDataModel>().emergencyContact,
                      'gender': context.read<UserDataModel>().gender,
                      'relation':
                          context.read<UserDataModel>().emergencyRelation
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController con,
    TextInputType? keyboardType,
    String? prefixText,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: con,
        keyboardType: keyboardType ?? TextInputType.text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(171, 71, 188, 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(171, 71, 188, 1)),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(171, 71, 188, 1)),
            borderRadius: BorderRadius.circular(12),
          ),
          prefixText: prefixText,
          prefixStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Widget _buildDatePickerRow({
    required String label,
    required DateTime selectedDate,
    required ValueChanged<DateTime> onDateChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          TextFormField(
            readOnly: true,
            onTap: () => _selectDate(context, selectedDate, onDateChanged),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(171, 71, 188, 1),
              ),
              hintText:
                  "${"${selectedDate.toLocal()}".split(' ')[0].split('-')[2]}-${"${selectedDate.toLocal()}".split(' ')[0].split('-')[1]}-${"${selectedDate.toLocal()}".split(' ')[0].split('-')[0]}",
              hintStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: const Icon(
                Icons.calendar_today,
                size: 24,
                color: Color.fromRGBO(171, 71, 188, 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromRGBO(171, 71, 188, 1)),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromRGBO(171, 71, 188, 1)),
                borderRadius: BorderRadius.circular(12),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    DateTime selectedDate,
    ValueChanged<DateTime> onDateChanged,
  ) async {
    final DateTime? picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    ));

    if (picked != selectedDate) {
      if (picked == null) {
        onDateChanged(selectedDOB);
      } else {
        onDateChanged(picked);
      }
    }
  }

  Widget _buildDropdownRow({
    required String label,
    required String value,
    required ValueChanged<String?> onChanged,
    required List<String> items,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(171, 71, 188, 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(171, 71, 188, 1)),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(171, 71, 188, 1)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  PageRouteBuilder _createPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const InitPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var opacityAnimation = animation.drive(tween);

        var scaleTween =
            Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));

        var scaleAnimation = animation.drive(scaleTween);

        return Opacity(
          opacity: opacityAnimation.value,
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: child,
          ),
        );
      },
    );
  }
}
