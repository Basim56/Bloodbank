import 'package:blood_bank/models/donation_request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<DonationRequest> _donors = [];
  List<DonationRequest> _filteredDonors = [];

  @override
  void initState() {
    super.initState();
    _fetchDonors();
    _searchController.addListener(_filterDonors);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchDonors() async {
    final response =
        await http.get(Uri.parse('http://10.23.42.79:3004/api/donors'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _donors = data.map((json) => DonationRequest.fromJson(json)).toList();
        _filteredDonors = _donors;
      });
    } else {
      // Handle the error
    }
  }

  void _filterDonors() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredDonors = _donors
          .where((donor) => donor.bloodGroup.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: _searchController,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Theme.of(context).colorScheme.primary)),
              child: Center(
                child: Text(
                  'Filters',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Theme.of(context).colorScheme.primary)),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Theme.of(context).colorScheme.primary)),
                child: _filteredDonors.isEmpty
                    ? Center(
                        child: Text(
                          'No results found',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _filteredDonors.length,
                        itemBuilder: (context, index) {
                          final donor = _filteredDonors[index];
                          return ListTile(
                            title: Text(donor.name),
                            subtitle: Text(
                                '${donor.bloodGroup}\n${donor.location}\n${donor.contactNo}'),
                            isThreeLine: true,
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
