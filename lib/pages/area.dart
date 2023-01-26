
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volumeareacalculator/controller/calculatorchangenotifier.dart';
import 'package:volumeareacalculator/widgets/customtextfield.dart';

class AreaPage extends StatelessWidget {
  AreaPage({super.key});
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AreaAndVolumeChangeNotifier area =
        Provider.of<AreaAndVolumeChangeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Values for Area"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Card(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // First dropdown button
                  DropdownButton(
                      value: area.activeAreaUnitFrom,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 40,
                        color: Colors.white,
                      ),
                      items: area.defineunits.map((String items) {
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
                        area.setActiveAreaUnitfrom(newValue!);
                      }),
                  // Second dropdown button
                  DropdownButton(
                      value: area.activeAreaUnitTo,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 40,
                        color: Colors.white,
                      ),
                      items: area.defineunits.map((String items) {
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
                        area.setActiveAreaUnitto(newValue!);
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
          ElevatedButton(
              onPressed: () {
                if (!length.text.isEmpty && !width.text.isEmpty) {
                  area.calculateArea(
                      double.parse(length.text), double.parse(width.text));
                  area.convertArea();
                  Navigator.pop(context);
                } else {
                  return;
                }
              },
              child: const Text("Calculate"))
        ],
      )),
    );
  }
}
