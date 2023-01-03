import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/doctor.dart';
import 'package:test/Classes/password.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import 'package:test/ui/widget/Doctor_password_widget.dart';
import '../Classes/account.dart';
import '../Classes/localization/translation.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    // Passwords's Strenght
    List<List<Password>> list = Doctor.strenght(context.read<Account>());
    // Media Query
    var size = MediaQuery.of(context).size;
    var w = size.width;
    var h = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(25),
                    child: PageTitleW(title: LanguageTranslation.of(context)!.text('health_care'))),
                ],
              ),
            const SizedBox(
              width: 20,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    LanguageTranslation.of(context)!.text('subtitle'),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.045
                      ),
                    ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              color: Colors.red,
              height: 50,
              width: w * 0.80,
              child: DropdownButton<Password>(
                hint:Text(
                  LanguageTranslation.of(context)!.text('critical_passwords'),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: w * 0.035
                  ),
                ),
                icon: const Icon(Icons.arrow_drop_down),
                items: list[0].map<DropdownMenuItem<Password>>(
                  (val) => DropdownMenuItem<Password>(
                    value: val,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: DoctorPasswordWidget(
                        password: val,
                        color: Colors.red,
                      ),
                    )
                  )
                ).toList(),
                onChanged: ((value) {})
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.orange,
              height: 50,
              width: w * 0.80,
              child: DropdownButton<Password>(
                hint:Text(
                  LanguageTranslation.of(context)!.text('medium_passwords'),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: w * 0.035),
                  ),
                icon: const Icon(Icons.arrow_drop_down),
                items: list[1].map<DropdownMenuItem<Password>>((val) =>
                  DropdownMenuItem<Password>(
                    value: val,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: DoctorPasswordWidget(
                        password: val, color: Colors.orange)
                    )
                  )
                ).toList(),
                onChanged: ((value) {})),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.blueGrey,
              height: 50,
              width: w * 0.80,
              child: DropdownButton<Password>(
                hint:Text(
                  LanguageTranslation.of(context)!.text('reused_passwords'),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: w * 0.035),
                ),
                icon: const Icon(Icons.arrow_drop_down),
                items: Doctor.reused(context.read<Account>())
                  .map<DropdownMenuItem<Password>>((val) =>
                    DropdownMenuItem<Password>(
                      value: val,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: DoctorPasswordWidget(
                          password: val, color: Colors.blueGrey)
                      )
                    )
                  ).toList(),
                onChanged: ((value) {})),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.lightGreen,
              height: 50,
              width: w * 0.80,
              child: DropdownButton<Password>(
                hint:Text(
                  LanguageTranslation.of(context)!.text('critical_passwords'),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: w * 0.035
                  ),
                ),
              icon: const Icon(Icons.arrow_drop_down),
              items: Doctor.timeUsed(context.read<Account>())
                .map<DropdownMenuItem<Password>>((val) =>
                  DropdownMenuItem<Password>(
                    value: val,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: DoctorPasswordWidget(
                        password: val, color: Colors.lightGreen
                      )
                    )
                  )
                ).toList(),
              onChanged: ((value) {})),
            ),
          ],
        )
      ),
    );
  }
}
