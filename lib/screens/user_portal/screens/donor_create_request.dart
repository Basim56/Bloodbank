import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DonorCreateRequestScreen extends StatefulWidget {
  const DonorCreateRequestScreen({super.key});

  @override
  State<DonorCreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<DonorCreateRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _address;
  String? _bloodType;
  String? _contactNo;

  Future<void> submitRequest() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final response = await http.post(
        Uri.parse('http://10.23.42.79:3004/api/donorsget'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': _name,
          'address': _address,
          'blood_type': _bloodType,
          'mobile_no': _contactNo,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Request submitted successfully');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Request submitted successfully'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        print('Failed to submit request: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Failed to submit request: ${response.statusCode}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create A Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(31, 87, 83, 83),
                    filled: true,
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    label: Text(
                      'Name',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a city';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _name = newValue!;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(31, 87, 83, 83),
                    filled: true,
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(
                      Icons.place_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    label: Text(
                      'Address',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a city';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _address = newValue!;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(31, 87, 83, 83),
                    filled: true,
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(
                      Icons.water_drop_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    label: Text(
                      'Blood Type',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a blood type';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _bloodType = newValue!;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(31, 87, 83, 83),
                    filled: true,
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    label: Text(
                      'Contact',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a contact';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _contactNo = newValue!;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(31, 87, 83, 83),
                    filled: true,
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(
                      Icons.note_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    label: Text(
                      'Add Description',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  maxLines: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40)
                      .copyWith(top: 25),
                  child: InkWell(
                    onTap: () async {
                      await submitRequest();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Center(
                        child: Text(
                          'Register',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
