import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String selectedGender = 'Male';
  TextEditingController emergencyPhoneNumberCon = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController relationEmergencyContact = TextEditingController();
  String selectedBloodGroup = 'A+';
  DateTime selectedDOB = DateTime.now();
  List<String> genderOptions = ['Male', 'Female', 'Prefer not to say', 'Others'];
  List<String> bloodGroupOptions = ['A+', 'B+', 'AB+', 'O+', 'A-', 'B-', 'AB-', 'O-'];

  bool isValidPhoneNumber() {
    return emergencyPhoneNumberCon.text.replaceAll(RegExp(r'\D'), '').length == 10;
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
                Navigator.of(context).pop(); // Close the dialog
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
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  'User Information',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple, // Title color
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildTextField(label: 'Name', con: name),
                      const SizedBox(height: 18),
                      _buildDatePickerRow(
                        label: 'Date of Birth',
                        selectedDate: selectedDOB,
                        onDateChanged: (date) {
                          setState(() {
                            selectedDOB = date;
                          });
                        },
                      ),
                      const SizedBox(height: 18),
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
                      const SizedBox(height: 18),
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
                      const SizedBox(height: 18),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: TextFormField(
                          controller: emergencyPhoneNumberCon,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            prefix: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '(+91)',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            labelText: "Emergency Contact",
                            labelStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple, // Label color
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.purple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.purple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      _buildTextField(
                        label: 'Relationship with Emergency Contact',
                        con: relationEmergencyContact,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle form submission
                            if (isValidPhoneNumber() == false) {
                              showInvalidPhoneNumberPopup(context);
                            }

                            if (name.text == "") {
                              print("USER DIDN'T ENTER NAMEEEEEEEEEEEEEEEEEEEE");
                            } else if (relationEmergencyContact.text == "") {
                              print("USER DIDN'T ENTER FAMILY NAME");
                            } else {
                              print(name.text);
                              print(relationEmergencyContact.text);
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, TextInputType? keyboardType, required TextEditingController con}) {
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
            color: Colors.purple, // Label color
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerRow({
    required String label,
    required DateTime selectedDate,
    required ValueChanged<DateTime> onDateChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.purple, // Label color
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Date color
                ),
              ),
              GestureDetector(
                onTap: () => _selectDate(context, selectedDate, onDateChanged),
                child: const Icon(
                  Icons.calendar_today,
                  size: 24,
                  color: Colors.purple, // Calendar icon color
                ),
              ),
            ],
          ),
        ),
      ],
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

  static Widget _buildDropdownRow({
    required String label,
    required String value,
    required ValueChanged<String?> onChanged,
    required List<String> items,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.purple, // Label color
            ),
          ),
          DropdownButton<String>(
            value: value,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
