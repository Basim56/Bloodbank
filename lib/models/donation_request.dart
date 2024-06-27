import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();

class DonationRequest {
  DonationRequest(
      {required this.name,
      required this.contactNo,
      required this.bloodGroup,
      required this.location})
      : id = uuid.v4();
  final String id;
  final String name;
  final String location;
  final String contactNo;
  final String bloodGroup;

  factory DonationRequest.fromJson(Map<String, dynamic> json) {
    return DonationRequest(
      name: json['name'],
      bloodGroup: json['blood_type'],
      location: json['address'],
      contactNo: json['mobile_no'],
    );
  }
}
