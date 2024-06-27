import 'dart:convert';

import 'package:blood_bank/models/user_request.dart';
import 'package:blood_bank/screens/donor_portal/widgets/request_item_trait.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserRequestItem extends StatefulWidget {
  const UserRequestItem({super.key});

  @override
  State<UserRequestItem> createState() => _UserRequestItemState();
}

class _UserRequestItemState extends State<UserRequestItem> {
  List<UserRequest> _userRequests = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequests();
  }

  void getRequests() async {
    final result =
        await http.get(Uri.parse('http://10.23.43.163:3000/api/requests'));
    print(result.body);

    // Decode the response as a list of maps
    List<dynamic> responseList = json.decode(result.body);

    // Create a list to store the UserRequest objects
    List<UserRequest> requestedMapList = [];

    // Iterate over the first two items in the list
    for (int i = 0; i < 2 && i < responseList.length; i++) {
      // Cast each item to a Map<String, dynamic>
      Map<String, dynamic> item = responseList[i] as Map<String, dynamic>;

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

    // Now you can use the requestedMapList for further processing
    // For example, print the details of the first two requests
    setState(() {
      _userRequests = requestedMapList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _userRequests.length,
        itemBuilder: (ctx, index) {
          return RequestItemTrait(donationRequest: _userRequests[index]);
        });
  }
}
