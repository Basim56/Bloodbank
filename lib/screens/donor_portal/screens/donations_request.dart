import 'dart:convert';

import 'package:blood_bank/models/donation_request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:blood_bank/screens/user_portal/widgets/request_item_trait.dart';

class MyRequests extends StatefulWidget {
  const MyRequests({super.key});

  @override
  State<MyRequests> createState() => _DonationsRequestState();
}

class _DonationsRequestState extends State<MyRequests> {
  List<DonationRequest> _donationsRequest = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequests();
  }

  void getRequests() async {
    final result =
        await http.get(Uri.parse('http://10.23.42.79:3004/api/donors'));
    print(result.body);

    // Decode the response as a list of maps
    List<dynamic> responseList = json.decode(result.body);

    // Create a list to store the UserRequest objects
    List<DonationRequest> requestedMapList = [];

    // Iterate over the first two items in the list
    for (int i = 0; i < responseList.length; i++) {
      // Cast each item to a Map<String, dynamic>
      Map<String, dynamic> item = responseList[i] as Map<String, dynamic>;

      // Create a UserRequest object for each item
      DonationRequest userRequest = DonationRequest(
        name: item["name"] ?? "",
        location: item["address"] ?? "",
        contactNo: item["mobile_no"] ?? "",
        bloodGroup: item["blood_type"] ?? "",
      );

      // Add the UserRequest object to the list
      requestedMapList.add(userRequest);
    }

    // Now you can use the requestedMapList for further processing
    // For example, print the details of the first two requests
    setState(() {
      _donationsRequest = requestedMapList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Requests'),
          centerTitle: true,
        ),
        body: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _donationsRequest.length,
            itemBuilder: (ctx, index) {
              return RequestItemTrait(
                  donationRequest: _donationsRequest[index]);
            }));
  }
}
