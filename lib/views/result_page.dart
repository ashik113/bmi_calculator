import 'package:flutter/material.dart';

import '../constants.dart';
import 'bmi_input_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.height,
      required this.weight,
      required this.age,
      required this.gender,
      required this.result,
      required this.resultText,
      required this.interpretation,
      required this.range,
      this.name});

  final int height;
  final int weight;
  final int age;
  final Gender? gender;
  final String result;
  final String resultText;
  final String interpretation;
  final String range;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Hello, $name',
                          style: kResultPageTitle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Check your report here!!',
                          textAlign: TextAlign.left,
                          style: kLabelTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Card(
                margin: const EdgeInsets.all(10.0),
                color: kActiveCardColour,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // ListTile(
                      //   autofocus: true,
                      //   contentPadding: const EdgeInsets.all(15.0),
                      //   leading: const Icon(Icons.person),
                      //   title: const Text(
                      //     'MR. MOHAMED ASHIK',
                      //     style: kResultCardTitleTextStyle,
                      //   ),
                      //   subtitle: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'WEIGHT: $weight',
                      //         style: kResultCardTextStyle,
                      //       ),
                      //       Text(
                      //         'HEIGHT: $height',
                      //         style: kResultCardTextStyle,
                      //       ),
                      //       Text(
                      //         'AGE: $age',
                      //         style: kResultCardTextStyle,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const Text('BMI RESULT', style: kResultPageReportTitle),
                      Text(resultText.toUpperCase(),
                          style: kResultLabelTextStyle),
                      Text(
                        range,
                        style: kLabelTextStyle,
                      ),
                      Text(result, style: kLargeFont),
                      Text(
                        interpretation,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(top: 45.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kBottomContainerColour,
                ),
                child: const Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
