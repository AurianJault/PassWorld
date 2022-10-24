import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    var salut = "coucou";
    double currentSliderValue = 20;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.home),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Generator",
                style: TextStyle(fontSize: 45),
              ),
            ),
          ]),
          const SizedBox(
            width: 50,
            height: 30,
          ),
          Row(children: [
            Container(
              width: device.width / 6,
            ),
            Container(
                width: device.width * 2 / 3,
                color: Colors.green,
                child: Text(
                  salut,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 25.0,
                  ),
                )),
            ElevatedButton(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: salut));
                },
                child: const Icon(Icons.copy)),
          ]),
          const SizedBox(
            width: 50,
            height: 30,
          ),
          Row(
            children: [
              Container(
                width: device.width / 6,
              ),
              const Text("Length", style: TextStyle(fontSize: 20)),
            ],
          ),
          Row(children: <Widget>[
            Container(
              width: device.width / 6,
            ),
            Container(
              width: device.width * 2 / 3,
              height: 10,
              child: Slider(
                value: currentSliderValue,
                max: 100,
                divisions: 20,
                label: currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    currentSliderValue = value;
                  });
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(currentSliderValue.toString(),
                style: const TextStyle(fontSize: 25)),
          ])
        ],
      )),
    );
  }
}
