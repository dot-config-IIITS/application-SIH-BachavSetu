import 'package:flutter/material.dart';
import 'mock_drill_model.dart';

class MockDrill extends StatefulWidget {
  const MockDrill({super.key});

  @override
  State<MockDrill> createState() => _MockDrillState();
}

class _MockDrillState extends State<MockDrill> {
  static List<MockModel> main_mock_list = [
    MockModel(
      name: 'Mock Drill 1',
      description: 'Mock Drill 1 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 2',
      description: 'Mock Drill 2 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 3',
      description: 'Mock Drill 3 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 4',
      description: 'Mock Drill 4 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 5',
      description: 'Mock Drill 5 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 6',
      description: 'Mock Drill 6 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 7',
      description: 'Mock Drill 7 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 8',
      description: 'Mock Drill 8 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 9',
      description: 'Mock Drill 9 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 10',
      description: 'Mock Drill 10 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 11',
      description: 'Mock Drill 11 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 12',
      description: 'Mock Drill 12 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 13',
      description: 'Mock Drill 13 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 14',
      description: 'Mock Drill 14 Description',
      image_url: 'https://picsum.photos/250?image=9',
    ),
    MockModel(
      name: 'Mock Drill 15',
      description: 'Mock Drill 15 Description',
      image_url: 'https://picsum.photos/250?image=9',
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
                    // borderRadius: BorderRadius.circular(8),
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
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: const EdgeInsets.all(5),
                          title: Text(
                            filtered_mock_list[index].name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle:
                              Text(filtered_mock_list[index].description!),
                          leading: Image.network(
                              filtered_mock_list[index].image_url!),
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
