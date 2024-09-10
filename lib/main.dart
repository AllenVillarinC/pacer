import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: OpeningPage(),
    );
  }
}

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  double selectedSpeed = 7;
  String paceMin = '8';
  String paceSec = '34';
  String five = '00:42:51';
  String ten = '01:25:42';
  String half = '03:00:51';
  String full = '06:01:42';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Speed: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$selectedSpeed ',
                          style: const TextStyle(color: Colors.blue),
                        ),
                        const Text('km/h')
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Pace: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$paceMin:$paceSec ',
                          style: const TextStyle(color: Colors.blue),
                        ),
                        const Text('(min/km)')
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Finish Times (HH:MM:SS)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '5 km',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(five, style: const TextStyle(color: Colors.blue)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '10 km',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(ten, style: const TextStyle(color: Colors.blue)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Half-Marathon',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(half, style: const TextStyle(color: Colors.blue)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Full-Marathon',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Text(full, style: const TextStyle(color: Colors.blue)),
                  ],
                ),
                const SizedBox(height: 30),
                CupertinoButton.filled(
                  borderRadius: BorderRadius.circular(20),
                  child: const Text(
                    'Change Speed',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => showCupertinoModalPopup(
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (_) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: CupertinoPicker(
                        itemExtent: 50,
                        scrollController: FixedExtentScrollController(
                          initialItem: ((selectedSpeed - 7.0) * 10).toInt(),
                        ),
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            selectedSpeed = 7.0 + value / 10;
                            double paceMinutes = 60 / selectedSpeed;
                            double timeInHours5km = 5 / selectedSpeed;
                            int hours5km = timeInHours5km.toInt();
                            int minutes5km = (timeInHours5km * 60).toInt() % 60;
                            int seconds5km =
                                ((timeInHours5km * 3600) % 60).toInt();
                            String time5km =
                                "${hours5km.toString().padLeft(2, '0')}:${minutes5km.toString().padLeft(2, '0')}:${seconds5km.toString().padLeft(2, '0')}";
                            double timeInHours10km = 10 / selectedSpeed;
                            int hours10km = timeInHours10km.toInt();
                            int minutes10km =
                                (timeInHours10km * 60).toInt() % 60;
                            int seconds10km =
                                ((timeInHours10km * 3600) % 60).toInt();
                            String time10km =
                                "${hours10km.toString().padLeft(2, '0')}:${minutes10km.toString().padLeft(2, '0')}:${seconds10km.toString().padLeft(2, '0')}";
                            double timeInHours21_1km = 21.1 / selectedSpeed;
                            int hours21_1km = timeInHours21_1km.toInt();
                            int minutes21_1km =
                                (timeInHours21_1km * 60).toInt() % 60;
                            int seconds21_1km =
                                ((timeInHours21_1km * 3600) % 60).toInt();
                            String time21_1km =
                                "${hours21_1km.toString().padLeft(2, '0')}:${minutes21_1km.toString().padLeft(2, '0')}:${seconds21_1km.toString().padLeft(2, '0')}";
                            double timeInHours42_2km = 42.2 / selectedSpeed;
                            int hours42_2km = timeInHours42_2km.toInt();
                            int minutes42_2km =
                                (timeInHours42_2km * 60).toInt() % 60;
                            int seconds42_2km =
                                ((timeInHours42_2km * 3600) % 60).toInt();
                            String time42_2km =
                                "${hours42_2km.toString().padLeft(2, '0')}:${minutes42_2km.toString().padLeft(2, '0')}:${seconds42_2km.toString().padLeft(2, '0')}";
                            five = time5km;
                            ten = time10km;
                            half = time21_1km;
                            full = time42_2km;
                            paceMin = paceMinutes.toInt().toString();
                            double paceSeconds =
                                (60 / selectedSpeed) - paceMinutes.toInt();
                            paceSec = (paceSeconds * 60)
                                .toInt()
                                .toString()
                                .padLeft(2, '0');
                          });
                        },
                        children: [
                          for (double i = 7.0; i <= 21.1; i += 0.1)
                            Text(
                              i.toStringAsFixed(1),
                              style: const TextStyle(color: Colors.black),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
