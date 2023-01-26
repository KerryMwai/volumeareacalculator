import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volumeareacalculator/controller/calculatorchangenotifier.dart';
import 'package:volumeareacalculator/widgets/customtextfield.dart';

class VolumePage extends StatelessWidget {
  VolumePage({super.key});
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController height = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AreaAndVolumeChangeNotifier volume =
        Provider.of<AreaAndVolumeChangeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Values for Volume"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Card(
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // First dropdown button
                      DropdownButton(
                          value: volume.activeVolumeUnitFrom,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 40,
                            color: Colors.white,
                          ),
                          items: volume.defineunits.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                "From: $items",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            volume.setActiveVolumeUnitffrom(newValue!);
                          }),
                      // Second dropdown button
                      DropdownButton(
                          value: volume.activeVolumeUnitTo,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 40,
                            color: Colors.white,
                          ),
                          items: volume.defineunits.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                "To: $items",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            volume.setActiveVolumeUnitto(newValue!);
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                inputText: length,
                hintText: "Enter Height",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                inputText: width,
                hintText: "Enter Widht",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                inputText: height,
                hintText: "Enter Height",
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!length.text.isEmpty &&
                        !width.text.isEmpty &&
                        !height.text.isEmpty) {
                      volume.calculateVolume(double.parse(length.text),
                          double.parse(width.text), double.parse(height.text));
                      volume.convertVolume();
                      Navigator.pop(context);
                    } else {
                      return;
                    }
                  },
                  child: const Text("Calculate"))
            ],
          ),
        ),
      ),
    );
  }
}
