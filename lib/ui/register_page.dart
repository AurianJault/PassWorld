import 'package:flutter/material.dart';
import 'package:test/Classes/Exception/storageException.dart';
import 'package:test/Classes/authentification.dart';
import 'package:test/ui/home_page.dart';
import 'package:test/ui/nav_bar.dart';
import 'popup/popupError.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Title
              const Text(
                'Want to become a member ?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 50),

              // Email Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              //Password Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        onChanged: ((value) {
                          passNotifier.value = PasswordStrength.calculate(
                              text: passwordController.text);
                        }),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PasswordStrengthChecker(
                    strength: passNotifier,
                  ),
                ]),
              ),
              const SizedBox(height: 30),
              // Sign In Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[300],
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                        onTap: () async {
                          try {
                            if (await Authentification.register(
                                (emailController.text).trim(),
                                (passwordController.text).trim())) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                      builder: (context) => const NavBar()));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('Erreur'),
                                        content: const Text(
                                            "Le nom d'utilisateur existe déjà !!"),
                                        actions: [
                                          TextButton(
                                            child: const Text('Ok'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          )
                                        ],
                                      ));
                            }
                          } on StorageException catch (e) {
                            showAlertDialog(context, e.message);
                          }
                        },
                        child: const Center(
                            child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )))),
              ),
              const SizedBox(height: 30),

              // Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already a member? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ]),
          ),
        ));
  }
}
