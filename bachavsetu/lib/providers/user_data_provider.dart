import 'dart:ffi';

import 'package:flutter/material.dart';

class UserDataModel extends ChangeNotifier {
  // Define your data variables here
  String name = "NULL";
  String dob = "NULL";
  String gender = "NULL";
  String emergencyContact = "NULL";
  String emergencyRelation = "NULL";
  String bloodGroup = "NULL";
  String token = "NULL";
  String phone = "0000000000";
  double latitude = 0.0;
  double longitude = 0.0;

  // Method to update the data
  void updateName(String newData) {
    name = newData;
    notifyListeners();
  }

  void updateLocation(double newLat, double newLong) {
    latitude = newLat;
    longitude = newLong;
    notifyListeners();
  }

  void updatePhone(String newData) {
    phone = newData;
    notifyListeners();
  }

  void updateGender(String newData) {
    gender = newData;
    notifyListeners();
  }

  void updateDOB(String newData) {
    dob = newData;
    notifyListeners();
  }

  void updateEContact(String newData) {
    emergencyContact = newData;
    notifyListeners();
  }

  void updateERelation(String newData) {
    emergencyRelation = newData;
    notifyListeners();
  }

  void updateBloodGroup(String newData) {
    bloodGroup = newData;
    notifyListeners();
  }

  void updateToken(String newData) {
    token = newData;
    notifyListeners();
  }
}
