import 'package:blood_bank/screens/admin_portal/show_blood_prediction.dart';
import 'package:blood_bank/screens/donor_portal/screens/tabs.dart';
import 'package:blood_bank/screens/donor_portal/screens/signup.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AdminLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _emailAddress;
  String? _password;

  void _submit() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => ShowBloodPrediction()),
    );
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
