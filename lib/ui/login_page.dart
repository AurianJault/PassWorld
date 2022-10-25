import 'package:flutter/material.dart';
import 'package:bcrypt/bcrypt.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'cle.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    const String login = "Pierre";
    const String password = 'password123';
    final String salt = BCrypt.gensalt();
    final String hash = BCrypt.hashpw(
      password,
      salt,
    );
    final crypt = encrypt(hash);

    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Title
              const Text(
                'Welcome Back !',
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
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
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
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          if (BCrypt.hashpw(passwordController.text, salt) ==
                                  decrypt(crypt) &&
                              login == emailController.text) {
                            Navigator.push(
                                context,
                                MaterialPageRoute<dynamic>(
                                    builder: (context) => const HomePage()));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text('Erreur'),
                                      content: const Text(
                                          "Le mot de passe ou le nom de l'utilisateur est incorrect !!"),
                                      actions: [
                                        TextButton(
                                          child: const Text('Ok'),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        )
                                      ],
                                    ));
                          }
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 30),

              // Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
