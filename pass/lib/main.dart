// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/fonction.dart';
import 'package:test/crypt.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:encrypt/encrypt.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({super.key});

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  TextEditingController generatedPwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // déclaration variables :
var device = MediaQuery.of(context).size;
    String salut=coucou();
    double currentSliderValue = 20;

    return Scaffold(
      floatingActionButton:
         FloatingActionButton(onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.home),
        ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            Row(
              children:  <Widget>[
                Container(
              padding: const EdgeInsets.all(15),
              child: const Text("Generator",style: TextStyle(fontSize: 45),),
                ),
              ]
            ),
            const SizedBox(
              width: 50,
              height: 30,
            ),
            Row(
              children:[
                Container(
                  width: device.width/6,
                ),
            Container(
              width: device.width*2/3,
              color: Colors.green,
              child: Text(
               salut,
                style: const TextStyle(
                 color: Colors.black54,
                 fontSize: 25.0,
               ),
              )
            ),
            ElevatedButton(onPressed: ()async{await Clipboard.setData(ClipboardData(text: salut));},
            child: const Icon(Icons.copy)
            ),
              ]
            ),
            const SizedBox(
              width: 50,
              height: 30,
            ),
            Row(
              children:[
                Container(
                  width: device.width/6,
                ),
                const Text("Length",style: TextStyle(fontSize: 20)),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: device.width/6,
                ),
            Container(
              width: device.width*2/3,
              height: 10,
              child: Slider(
                value: currentSliderValue,
                max: 100,
                divisions: 20,
                label: currentSliderValue.round().toString(),
                onChanged: (double value) {setState((){currentSliderValue = value;});
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
              Text(currentSliderValue.toString(),style: const TextStyle(fontSize: 25)),
              ]
            )
          ],
        )
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
// Déclaration de valeurs :
  TextEditingController nameController = TextEditingController();
  TextEditingController mdpController = TextEditingController();

  
  @override
  void initState() {
    super.initState();
  }
  @override void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    final String login = "Pierre";
    final String password = 'password123';
    final String salt = BCrypt.gensalt();
    final String hash = BCrypt.hashpw(
        password,
        salt,
      );
    final crypt = encrypt(hash);
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Passworld",
          style: TextStyle(fontSize: 45,fontWeight: FontWeight.w900),
          ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Le meilleur gestionnaire de mot de passe du monde",
          style: TextStyle(fontSize: 15 ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: device.width*4/6,
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(                        
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.0)
              ),
              hintText: "Enter your mail adress",
              labelText: "Email",
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: device.width*4/6,
          child: TextField(
            obscureText: true,
            controller: mdpController,
            decoration: InputDecoration(
              hoverColor: Colors.red,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
              hintText: "Enter your password",
              labelText: "Password",
            ),
          ),
        ),const SizedBox(
          height: 75.0,
        ),
        ElevatedButton(onPressed: (){
          if(BCrypt.hashpw(mdpController.text,salt) == decrypt(crypt) && login == nameController.text){
            Navigator.push(context, MaterialPageRoute<dynamic>(builder: (context) => ThirdRoute()));
          }
          else{
              showDialog(context: context, builder: (context) => AlertDialog(
              title: Text('Erreur'),
              content: Text("Le mot de passe ou le nom de l'utilisateur est incorrect !!"),
              actions: [
                TextButton(
                  child: Text('Ok'),
                  onPressed: ()=>Navigator.pop(context),
                ) 
              ],
            ));
            }
        },
          child: const Text(
          "Connexion",
          style: TextStyle(fontSize: 25)
          )
        ),
      ],
    ),
  ),
);
}
}