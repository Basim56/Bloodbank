import 'dart:convert';
import 'package:blood_bank/screens/donor_portal/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      const String apiUrl = 'http://10.23.42.79:3001/api/auth/register';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Registration successful
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Registration successful'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (ctx) => const DonorLoginScreen()),
                    );
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Handle registration failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: ${response.body}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Image.asset(
                'assets/images/logo/logo_1_.png',
                height: 120,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text.rich(TextSpan(
                text: 'Dare',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
                children: [
                  const TextSpan(
                      text: '    To', style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: '    Donate',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold))
                ])),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      // controller: _usernameController,
                      decoration: InputDecoration(
                          fillColor: const Color.fromARGB(31, 87, 83, 83),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                          label: Text(
                            'User name',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      // controller: _emailController,
                      decoration: InputDecoration(
                          fillColor: const Color.fromARGB(31, 87, 83, 83),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                          label: Text(
                            'Email',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        email = newValue!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      // controller: _passwordController,
                      decoration: InputDecoration(
                          fillColor: const Color.fromARGB(31, 87, 83, 83),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                          label: Text(
                            'Password',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          )),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        password = newValue!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: const Color.fromARGB(31, 87, 83, 83),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                          label: Text(
                            'Contact',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your contact number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: const Color.fromARGB(31, 87, 83, 83),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.water_drop_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                          label: Text(
                            'Blood Group',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your blood group';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: const Color.fromARGB(31, 87, 83, 83),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                          label: Text(
                            'Location',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your location';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: _register,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.primary),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Already have an account? ',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: const Color.fromARGB(255, 87, 83, 83),
                                  fontSize: 18),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const DonorLoginScreen()));
                            },
                            child: Text(
                              'Try Logging in.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 20),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
