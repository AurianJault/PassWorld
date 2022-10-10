// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/coucou.dart';
void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}

class SecondRoute extends StatelessWidget {
  SecondRoute({super.key});
  

  @override
  Widget build(BuildContext context) {
var device = MediaQuery.of(context).size;
    String coucou="ça arrive";
  TextEditingController generatedPwd = TextEditingController();
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
                  width: device.width/3,
                ),
            Container(
              width: device.width/3,
              color: Colors.green,
              child: Text(
               coucou,
                style: const TextStyle(
                 color: Colors.black54,
                 fontSize: 25.0,
               ),
              )
            ),
            ElevatedButton(onPressed: ()async{await Clipboard.setData(ClipboardData(text: coucou));},
            child: const Icon(Icons.copy)
            ),
              ]
            ),
            const SizedBox(
              width: 50,
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: device.width/3,
                ),
            const Text("linear"),
            Container(
              width: device.width/3,
              height: 10,
              child: const LinearProgressIndicator(
              value: 0.5,
              semanticsLabel: 'Linear progress indicator',
            ),
            )
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

class Compte{
  var id="Aurian";
  var motdepasse="coucou";
}

class _HomePageState extends State<HomePage> {
  var myText = "Change My name";
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mdpController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }
  @override void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
          width: 400,
          child: TextField(
            controller: _nameController,
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
          width: 400,
          child: TextField(
            obscureText: true,
            controller: _mdpController,
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
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