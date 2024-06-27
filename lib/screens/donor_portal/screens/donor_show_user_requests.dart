import 'dart:convert';

import 'package:blood_bank/models/user_request.dart';
import 'package:blood_bank/screens/donor_portal/widgets/request_item_trait.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DonorShowUserRequests extends StatefulWidget {
  const DonorShowUserRequests({super.key});

  @override
  State<DonorShowUserRequests> createState() => _UserRequestItemState();
}

class _UserRequestItemState extends State<DonorShowUserRequests> {
  List<UserRequest> _userRequests = [];
  @override
  void initState() {
    super.initState();
    getRequests();
  }

  void getRequests() async {
    final result =
        await http.get(Uri.parse('http://10.23.42.79:3000/api/requests'));
    print(result.body);

    // Decode the response as a list of maps
    List<dynamic> responseList = json.decode(result.body);

    // Create a list to store the UserRequest objects
    List<UserRequest> requestedMapList = [];

    // Iterate over each item in the list
    for (final listItem in responseList) {
      // Cast each item to a Map<String, dynamic>
      Map<String, dynamic> item = listItem as Map<String, dynamic>;

      // Create a UserRequest object for each item
      UserRequest userRequest = UserRequest(
        city: item["city"] ?? "",
        hospital: item["hospital"] ?? "",
        bloodType: item["blood_type"] ?? "",
        mobileNo: item["mobile_no"] ?? "",
      );

      // Add the UserRequest object to the list
      requestedMapList.add(userRequest);
    }
    setState(() {
      _userRequests = requestedMapList;
    });

    // Now you can use the requestedMapList for further processing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Requests'),
      ),
      body: ListView.builder(
          itemCount: _userRequests.length,
          itemBuilder: (ctx, index) {
            return RequestItemTrait(donationRequest: _userRequests[index]);
          }),
    );
  }
}
