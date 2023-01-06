import 'package:flutter/material.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/Exception/storageException.dart';
import 'package:test/Classes/account.dart';
import 'package:test/Classes/api_client.dart';
import 'package:test/Classes/authentification.dart';
import 'package:test/Classes/cle.dart';
import 'package:test/ui/nav_bar.dart';
import '../Classes/config.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'PopUp/popupError.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<Config>().setAppDirPath();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? dropDownValue;

  @override
  Widget build(BuildContext context) {
    List<Account> users = Authentification.allUser(
        context.read<Config>().appDirPath.path); // TODO c'est de la merde

    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height;

    var users1 = ["rearnal", "tilevadoux", "aujault", "corichard", "nifranco"];

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

              // User Selection
              DropdownButton(
                hint: Text("Select User"),
                value: dropDownValue,
                items: users.map((Account user) {
                  return DropdownMenuItem(
                    value: user.id,
                    child: Text(user.id),
                  );
                }).toList(),
                onChanged: (String? newVal) {
                  setState(() {
                    dropDownValue = newVal!;
                  });
                },
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
                  child: InkWell(
                    onTap: () async {
                      if (await Authentification.authentication(
                          // check if empty
                          dropDownValue!,
                          (passwordController.text).trim())) {
                        context.read<Account>().setId = emailController.text;
                        await context.read<Config>().setAppDirPath();
                        print(context.read<Config>().appDirPath.path);
                        context
                            .read<Account>()
                            .fillVault(context.read<Config>().appDirPath.path);

                        // context
                        //     .read<Account>()
                        //     .changeMasterPassword(passwordController.text); LIGNE QUI BUG SA MERE LA P*TE
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
                                      "Le mot de passe ou le nom de l'utilisateur est incorrect !!"),
                                  actions: [
                                    TextButton(
                                      child: const Text('Ok'),
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ],
                                ));
                      }
                    },
                    child: const Center(
                      child: Text(
                        'Unlock',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                                builder: (context) => const LoginPage()));
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