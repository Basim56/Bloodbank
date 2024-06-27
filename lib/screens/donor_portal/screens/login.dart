import 'package:blood_bank/screens/donor_portal/screens/tabs.dart';
import 'package:blood_bank/screens/donor_portal/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DonorLoginScreen extends StatefulWidget {
  const DonorLoginScreen({super.key});

  @override
  State<DonorLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DonorLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _emailAddress;
  String? _password;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final response = await http.post(
          Uri.parse('http://10.23.42.79:3001/api/auth/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': _emailAddress!,
            'password': _password!,
          }),
        );

        if (response.statusCode == 200) {
          final responseBody = jsonDecode(response.body);
          final token = responseBody['token'];
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Success'),
                content: Text('Login successful'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => const DonorTabs()),
                      );
                    },
                  ),
                ],
              );
            },
          );
        } else {
          final errorResponse = jsonDecode(response.body);
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Error'),
              content: Text(errorResponse['message'] ?? 'An error occurred'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred: $e'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo/logo_1_.png',
              height: 200,
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
              height: 40,
            ),
            Expanded(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              )),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _emailAddress = newValue;
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
                                Icons.lock_outline,
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _password = newValue;
                          },
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: _submit,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.primary),
                            child: Center(
                              child: Text(
                                'Login',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Uncomment and modify this part if you have a ForgotPasswordScreen
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (ctx) => ForgotPasswordScreen()));
                      //     },
                      //     child: Container(
                      //       padding: const EdgeInsets.symmetric(vertical: 5),
                      //       width: double.infinity,
                      //       decoration:
                      //           const BoxDecoration(color: Colors.white),
                      //       child: Center(
                      //         child: Text(
                      //           'Forgot Password?',
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .headlineMedium!
                      //               .copyWith(
                      //                   color: Theme.of(context)
                      //                       .colorScheme
                      //                       .primary),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              'Don\'t have an account yet? ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color:
                                          const Color.fromARGB(255, 87, 83, 83),
                                      fontSize: 18),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const SignUp()));
                                },
                                child: Text(
                                  'Register Now.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 20),
                                ))
                          ],
                        ),
                      ))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
