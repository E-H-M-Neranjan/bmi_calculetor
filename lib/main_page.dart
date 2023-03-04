import 'package:bmi_calculetor/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 50;

  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            "Height",
                            style: kText,
                          ),
                          Text(
                            "$height",
                            style: kInputLabelColor,
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height > 30) height--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                // ignore: prefer_const_constructors
                                child: Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height < 220) height++;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                // ignore: prefer_const_constructors
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            "Weight",
                            style: kText,
                          ),
                          Text(
                            "$weight",
                            style: kInputLabelColor,
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 30) weight--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                // ignore: prefer_const_constructors
                                child: Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 300) weight++;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                // ignore: prefer_const_constructors
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    const Text(
                      "BMI",
                      style: kText,
                    ),
                    Text(
                      bmi.toStringAsFixed(2),
                      style: kInputLabelColor.copyWith(
                          color: kOutputTextColor, fontSize: 60),
                    ),
                    Text(
                      getResult(bmi),
                      style: kOutputText,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmi) {
    if (bmi >= 25) {
      return "Over Weight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else {
      return "Under Weight";
    }
  }
}
