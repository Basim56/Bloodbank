import 'package:blood_bank/models/user_request.dart';
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
  List<UserRequest> _infoList = [];
  List<UserRequest> _filteredInfoList = [];

  @override
  void initState() {
    super.initState();
    _fetchInfo();
    _searchController.addListener(_filterInfo);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchInfo() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.23.42.79:3000/api/requests'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print('API Response: $data');
        setState(() {
          _infoList = data.map((json) => UserRequest.fromJson(json)).toList();
          _filteredInfoList = _infoList;
        });
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _filterInfo() {
    final query = _searchController.text.toLowerCase();
    print('Search Query: $query');
    setState(() {
      _filteredInfoList = _infoList.where((info) {
        return (info.bloodType?.toLowerCase().contains(query) ?? false) ||
            (info.city?.toLowerCase().contains(query) ?? false) ||
            (info.hospital?.toLowerCase().contains(query) ?? false);
      }).toList();
    });
    print('Filtered List: $_filteredInfoList');
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Theme.of(context).colorScheme.primary)),
                child: _filteredInfoList.isEmpty
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
                        itemCount: _filteredInfoList.length,
                        itemBuilder: (context, index) {
                          final info = _filteredInfoList[index];
                          return ListTile(
                            title: Text(info.city ?? 'Unknown City'),
                            subtitle: Text(
                                '${info.hospital ?? 'Unknown Hospital'}\n${info.bloodType ?? 'Unknown Blood Type'}\n${info.mobileNo ?? 'Unknown Mobile No'}'),
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
