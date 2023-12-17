import 'package:flutter/material.dart';

import 'package:bachavsetu/settings/mockdrill/mock_drill_model.dart';

import 'package:bachavsetu/settings/mockdrill/_all_export.dart';

class MockDrill extends StatefulWidget {
  const MockDrill({super.key});

  @override
  State<MockDrill> createState() => _MockDrillState();
}

class _MockDrillState extends State<MockDrill> {
  static List<MockModel> main_mock_list = [
    MockModel(
      name: 'Chemical Spill',
      description: 'Chemical Spill Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const ChemicalSpill(),
    ),
    MockModel(
      name: 'Cyclone',
      description: 'Cyclone Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const Cyclone(),
    ),
    MockModel(
      name: 'Earthquake',
      description: 'Earthquake Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const Earthquake(),
    ),
    MockModel(
      name: 'Electrical Fire',
      description: 'Electrical Fire Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const ElectricalFire(),
    ),
    MockModel(
      name: 'Flood',
      description: 'Flood Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const Flood(),
    ),
    MockModel(
      name: 'Gas Fire',
      description: 'Gas Fire Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const GasFire(),
    ),
    MockModel(
      name: 'Kitchen Fire',
      description: 'Kitchen Fire Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const KitchenFire(),
    ),
    MockModel(
      name: 'Pandemic',
      description: 'Pandemic Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const Pandemic(),
    ),
    MockModel(
      name: 'Power Outage',
      description: 'Power Outage Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const PowerOutage(),
    ),
    MockModel(
      name: 'Road Accident',
      description: 'Road Accident Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const RoadAccident(),
    ),
    MockModel(
      name: 'Tornado',
      description: 'Tornado Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const Tornado(),
    ),
    MockModel(
      name: 'Tsunami',
      description: 'Tsunami Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const Tsunami(),
    ),
    MockModel(
      name: 'Wildfire',
      description: 'Wildfire Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const WildFire(),
    ),
    MockModel(
      name: 'Winter Storm',
      description: 'Winter Storm Description',
      image_url: 'https://picsum.photos/250?image=9',
      drillPage: const WinterStorm(),
    ),
  ];

  List<MockModel> filtered_mock_list = List.from(main_mock_list);

  void updateList(String value) {
    setState(() {
      filtered_mock_list = main_mock_list
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        appBar: AppBar(
          title: const Text('Mock Drill'),
          backgroundColor: Colors.deepPurple.shade50,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) => updateList(value),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFEDE7F6),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search For Mock Drill',
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Colors.deepPurple,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: filtered_mock_list.isEmpty
                    ? const Center(
                        child: Text("No Results Found"),
                      )
                    : ListView.builder(
                        itemCount: filtered_mock_list.length,
                        itemBuilder: (context, index) => Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              filtered_mock_list[index].name!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle:
                                Text(filtered_mock_list[index].description!),
                            leading: Image.network(
                              filtered_mock_list[index].image_url!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      filtered_mock_list[index].drillPage!,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ],
          ),
        )
        // body: const Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         'Mock Drill',
        //         style: TextStyle(
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       SizedBox(height: 20),
        //       Text(
        //         'Actual Mock Drill Page Coming Soon !!!',
        //         style: TextStyle(
        //           fontSize: 20,
        //         ),
        //         textAlign: TextAlign.center,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
