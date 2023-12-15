import 'package:bachavsetu/login/form.dart';
import 'edit_item2.dart';
import 'package:flutter/services.dart';
import 'edit_item.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String gender = "Male";
  List<String> genderOptions = ['Male', 'Female', 'Prefer not to say', 'Others'];
  String selectedBloodGroup = 'A+';
  DateTime selectedDOB = DateTime.now();

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

  Widget _buildDatePickerRow({
    required DateTime selectedDate,
    required ValueChanged<DateTime> onDateChanged,
  }) {
    return Container(
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
              color: Colors.black54, // Calendar icon color
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: Size(60, 50),
                elevation: 3,
              ),
              icon: const Icon(Ionicons.checkmark, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Account",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              // EditItem(
              //   title: "Photo",
              //   widget: Column(
              //     children: [
              //       Image.asset(
              //         "assets/settingsAssets/avatar.png",
              //         height: 100,
              //         width: 100,
              //       ),
              //       TextButton(
              //         onPressed: () {},
              //         style: TextButton.styleFrom(
              //           foregroundColor: Colors.lightBlueAccent,
              //         ),
              //         child: const Text("Upload Image"),
              //       )
              //     ],
              //   ),
              // ),
              const EditItem(
                title: "Name",
                widget: TextField(),
              ),
              const SizedBox(height: 40),
              EditItem(
                title: "Gender",
                widget: DropdownButton<String>(
                  value: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                  items: genderOptions.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 40),
              EditItem(
                widget: _buildDatePickerRow(
                    selectedDate: selectedDOB,
                    onDateChanged: (date) {
                      setState(() {
                        selectedDOB = date;
                      });
                    }),
                title: "DOB",
              ),
              const SizedBox(height: 40),
              EditItem2(
                widget: TextFormField(
                  // controller: emergencyPhoneNumberCon,
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
                      color: Colors.black54, // Label color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              EditItem2(
                widget: TextFormField(
                  // controller: con,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    labelText: "Relationship w/ Emergency Contact",
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54, // Label color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
