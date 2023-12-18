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
      name: 'Cyclone',
      description: 'Large-scale storm with powerful winds and heavy rainfall.',
      image_url: 'assets/mock/mock_drill/cyclone.png',
      drillPage: const Cyclone(),
    ),
    MockModel(
      name: 'Earthquake',
      description: 'Sudden ground shaking caused by tectonic plate movements.',
      image_url: 'assets/mock/mock_drill/earthquake.png',
      drillPage: const Earthquake(),
    ),
    MockModel(
      name: 'Electrical Fire',
      description: 'Fire caused by short circuit.',
      image_url: 'assets/mock/mock_drill/electricalfire.png',
      drillPage: const ElectricalFire(),
    ),
    MockModel(
      name: 'Flood',
      description: 'Overflow of water onto land.',
      image_url: 'assets/mock/mock_drill/flood.png',
      drillPage: const Flood(),
    ),
    MockModel(
      name: 'Gas Fire',
      description: 'Fire caused by gas leakage.',
      image_url: 'assets/mock/mock_drill/gasfire.png',
      drillPage: const GasFire(),
    ),
    MockModel(
      name: 'House Fire',
      description: 'Uncontrolled fire within a residential structure.',
      image_url: 'assets/mock/mock_drill/housefire.png',
      drillPage: const HouseFire(),
    ),
    MockModel(
      name: 'Industrial Accident',
      description: 'Unforeseen mishaps within industrial facilities.',
      image_url: 'assets/mock/mock_drill/industrialaccident.png',
      drillPage: const IndustrialAccident(),
    ),
    MockModel(
      name: 'Landslide',
      description: 'Downward movement of rock and debris on slopes.',
      image_url: 'assets/mock/mock_drill/landslide.png',
      drillPage: const Landslide(),
    ),
    MockModel(
      name: 'Road Accident',
      description: 'Collisions or incidents involving vehicles on roads.',
      image_url: 'assets/mock/mock_drill/roadaccident.png',
      drillPage: const RoadAccident(),
    ),
    MockModel(
      name: 'Tornado',
      description: 'Violently rotating column of air.',
      image_url: 'assets/mock/mock_drill/tornado.png',
      drillPage: const Tornado(),
    ),
    MockModel(
      name: 'Tsunami',
      description: 'Series of powerful ocean waves triggered.',
      image_url: 'assets/mock/mock_drill/tsunami.png',
      drillPage: const Tsunami(),
    ),
    MockModel(
      name: 'Wildfire',
      description: 'Uncontrolled fire spreading rapidly through vegetation.',
      image_url: 'assets/mock/mock_drill/wildfire.png',
      drillPage: const WildFire(),
    ),
    MockModel(
      name: 'Winter Storm',
      description: 'Severe winter weather and snow storms.',
      image_url: 'assets/mock/mock_drill/winterstorm.png',
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
                            leading: Image.asset(
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
