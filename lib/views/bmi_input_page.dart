import 'package:bmi_calculator/components/gender_specifier.dart';
import 'package:bmi_calculator/process/bmi_calculator.dart';
import 'package:bmi_calculator/views/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/increase_decrease_btn.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

enum Gender { male, female }

class BMIInputPage extends StatefulWidget {
  const BMIInputPage({super.key});

  @override
  State<BMIInputPage> createState() => _BMIInputPageState();
}

class _BMIInputPageState extends State<BMIInputPage> {
  Gender? selectedGender;
  int height = 160;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kAppBarText,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: const GenderSpecifier(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                  ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: const GenderSpecifier(
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kLargeFont,
                            ),
                            const Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: const Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: const Color(0xFFff0067),
                            overlayColor: const Color(0x29EB1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                height = value.round();
                              });
                            },
                            min: 120.0,
                            max: 240.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          weight.toString(),
                          style: kLargeFont,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IncreaseDecreaseButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                  if (weight > 250 || weight < 0) {
                                    weight = 0;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            IncreaseDecreaseButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                  if (weight > 180 || weight < 0) {
                                    weight = 0;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          age.toString(),
                          style: kLargeFont,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IncreaseDecreaseButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                  if (age > 100 || age < 0) {
                                    age = 0;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            IncreaseDecreaseButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                  if (age > 100 || age < 0) {
                                    age = 0;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  BMICalculator calculator =
                      BMICalculator(weight: weight, height: height);
                  String name = (selectedGender == Gender.male)
                      ? 'Sir'
                      : (selectedGender == Gender.female)
                          ? 'Madam'
                          : ' ';
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      name: name,
                      height: height,
                      weight: weight,
                      age: age,
                      gender: selectedGender,
                      result: calculator.calculateBmi(),
                      resultText: calculator.calculateResultText(),
                      interpretation: calculator.interpretation(),
                      range: calculator.resultsRange(),
                    );
                  }));
                },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: const BoxDecoration(
                    color: kBottomContainerColour,
                  ),
                  child: const Center(
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
