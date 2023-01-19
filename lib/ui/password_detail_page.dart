import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test/ui/edit_password_page.dart';
import 'package:test/ui/home_page.dart';

import '../Classes/account.dart';
import '../Classes/config.dart';
import '../Classes/password.dart';
class PasswordDetailPage extends StatefulWidget {
  const PasswordDetailPage({super.key, required this.p});
  final Password p;
  @override
  State<PasswordDetailPage> createState() => _PasswordDetailPage(p: p);
}

class _PasswordDetailPage extends State<PasswordDetailPage> {
  _PasswordDetailPage({required this.p});
  Password p;
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  bool obcure = true;      
  String obcures = "*";

  @override
  Widget build(BuildContext context) {
      // Media Query
      var size = MediaQuery.of(context).size;
      var w = size.width;
      var h = size.height;
      String notes;
      if(p.getNote != null && p.getNote != ''){
        notes = p.getNote!;
      } else {
        notes = '...';
      }

      // Widget
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: SingleChildScrollView(child: Column(
          children: [
            //-------------
            // PAGE TITLE
            //-------------
            Container(
            height: h * 0.075,
            decoration: BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(w * 0.02)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Password Detail',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: w * 0.05),
                ),
              ],
            ),
          ),

            SizedBox(
              height: h * 0.03,
            ),

            //-------------
            // Password detail: 
            // image and name
            //-------------
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w * 0.02),
              ),

              child: Row(
        
                children: [
                  
                  SizedBox(width: w * 0.1),
                  Image.asset('assets/${p.getWebsiteImage}.png',
                  width: w * 0.2),
                  SizedBox(width: w * 0.1),
                  Text(p.getName,
                  style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: w * 0.05,
                        ))
                ],
              ),
            ),
            SizedBox(height: h * 0.04),

            //-------------
            // Password detail:
            // info
            //-------------
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w * 0.02),
              ),

              child: Row(     
                children: [
                  SizedBox(width: w * 0.1),
                  Text('Creation date: ',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: w * 0.05)),
                  Text(formatter.format(p.getCreationDate!),
                  style: TextStyle(
                          fontSize: w * 0.05,
                        ))
                ],
              ),
            ),
            SizedBox(height: h * 0.04),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w * 0.02),
              ),

              child: Row(     
                children: [
                  SizedBox(width: w * 0.1),
                  Text('Last modification: ',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: w * 0.05)),
                  Text(formatter.format(p.getModifDate!),
                  style: TextStyle(
                          fontSize: w * 0.05,
                        ))
                ],
              ),
            ),
            SizedBox(height: h * 0.04),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w * 0.02),
              ),

              child: Row(     
                children: [
                  SizedBox(width: w * 0.1),
                  Text('Website: ',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: w * 0.05)),
                  Text(p.getWebsite!,
                  style: TextStyle(
                          fontSize: w * 0.05,
                        ))
                ],
              ),
            ),
            SizedBox(height: h * 0.04),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w * 0.02),
              ),

              child: Row(     
                children: [
                  SizedBox(width: w * 0.1),
                  Text('Username: ',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: w * 0.05)),
                  Text(p.getUsername!,
                  style: TextStyle(
                          fontSize: w * 0.05,
                        ))
                ],
              ),
            ),
            SizedBox(height: h * 0.04),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w * 0.02),
              ),

              child: Row(     
                children: [
                  SizedBox(width: w * 0.1),
                  Text('Email: ',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: w * 0.05)),
                  Text(p.getEmail!,
                  style: TextStyle(
                          fontSize: w * 0.05,
                        ))
                ],
              ),
            ),
            SizedBox(height: h * 0.04),

            Container(
                //color: Color.fromARGB(255, 186, 166, 221),
                padding: EdgeInsets.all(w * 0.02),

              child: Wrap(     
                children: [

                  // ----- TEXT
                  SizedBox(width: w * 0.074),
                  Text('Password: ',


                  // ----- PASSWORD 
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: w * 0.05)),
                  Text(
                    obcure ? (obcures * (p.getPassword.length)): p.getPassword,
                  style: TextStyle(       
                          fontSize: w * 0.05,
                        )),

                  // ----- ICONS 
                  SizedBox(width: w * 0.05),
                        InkWell(
                            onTap: (() {
                              setState(() {
                                obcure = !obcure;
                              });
                            }),
                            child: Icon(
                              const IconData(0xe51c,
                                  fontFamily: 'MaterialIcons'),
                              size: w * 0.06,
                            )),
                  SizedBox(width: w * 0.03),
                        InkWell(
                          onTap: () async {
                          await Clipboard.setData(ClipboardData(text: p.getPassword));
                        },
                        child: Icon(
                          Icons.copy,
                          size: w * 0.06,
                        ),
                        )
                ],
              ),
            ),
            SizedBox(height: h * 0.03),
            Text(
              'Notes',
            style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: w * 0.05,
                  decoration: TextDecoration.underline)),

            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
                
              // height should be fixed for vertical scrolling
              height: 150.0,
              width: w,
              decoration: BoxDecoration(
                  
                border: Border.all(
                  color: Colors.white,
                  width: 2.5,
                ),
              ),
              // SingleChildScrollView should be
              // wrapped in an Expanded Widget
              child: Expanded(
              // SingleChildScrollView contains a
              // single child which is scrollable
              child: SingleChildScrollView(
              
              // for Vertical scrolling
              scrollDirection: Axis.vertical,
              child: Text(
                notes,
                style: TextStyle(
                  fontSize: w * 0.05,
                ),
              )))),
            /*
            Text('Email: ',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: w * 0.05)),
                  Text(p.getEmail!,
                  style: TextStyle(
                          fontSize: w * 0.05,
                        ))
            */

            //-------------
            // Back button
            //-------------           
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: w * 0.2,
                            height: h * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: BorderRadius.circular(w * 0.04)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.03, vertical: h * 0.01),
                                child: Center(
                                  child: Text(
                                    'Back',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: w * 0.04),
                                  ),
                                ))),
                      ),

                       InkWell(
                        child: Container(
                            width: w * 0.15,
                            height: h * 0.05,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 231, 15, 12),
                                borderRadius: BorderRadius.circular(w * 0.04)),
                            child: Center(
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Delete Password'),
                                          content: const Text('Once you delete this password you won\'t be able to recover it. Are you sure you want to delete this password?'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Delete'),
                                              onPressed: () async{
                                                int id = p.getId;
                                                context.read<Account>().vault.removePassword(id);
                                                var path = Config();
                                                await path.setAppDirPath();
                                                context.read<Account>().saveFile(path.appDirPath.path);
                                                 Navigator.push(
                                                  context,
                                                  MaterialPageRoute<dynamic>(
                                                      builder: (context) =>
                                                          HomePage()))
                                              .then((_) => setState(() {}));
                                                            },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                              ),
                            )),
                      ),

                      InkWell(
                        onTap: () {
                          int idp = p.getId;
                          Navigator.push(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                        builder: (context) =>
                                            EditPasswordPage(p: p)))
                                .then((_) => setState(() {}));
                        },
                        child: Container(
                            width: w * 0.2,
                            height: h * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(w * 0.04)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.03, vertical: h * 0.01),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: w * 0.04),
                                  ),
                                ))),
                      ),
                    ]
                  ),
          ],
        ),))
      );
  }
}
