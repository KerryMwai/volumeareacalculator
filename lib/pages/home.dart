import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volumeareacalculator/controller/calculatorchangenotifier.dart';
import 'package:volumeareacalculator/pages/area.dart';
import 'package:volumeareacalculator/pages/volume.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AreaAndVolumeChangeNotifier areaandvolume =
        Provider.of<AreaAndVolumeChangeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Volume and Area Calculator"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0.1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 300,
            height: 100,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Area:\n ${areaandvolume.area} ${areaandvolume.activeAreaUnitTo} sq",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 300,
            height: 100,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Volume:\n ${areaandvolume.volume}  ${areaandvolume.activeVolumeUnitTo} cubed",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => AreaPage())));
                  },
                  child: const Text("Calculate Area")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => VolumePage())));
                  },
                  child: const Text("Calculate Volume")),
            ],
          ),
        ],
      ),
    );
  }

// Future<void> _showMyDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('AlertDialog Title'),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: const <Widget>[
//               Text('This is a demo alert dialog.'),
//               Text('Would you like to approve of this message?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Approve'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ]););
// }
}
