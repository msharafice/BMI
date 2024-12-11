import 'package:flutter/material.dart';
import '../bars/leftbar.dart';
import '../bars/rightbar.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _textResult = "";
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double _bmiResult = 0;
  int group = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     const Text(
            //       'US unit',
            //       style: TextStyle(color: Colors.white, fontSize: 20),
            //     ),
            //     Radio(
            //       value: 1,
            //       groupValue: group,
            //       onChanged: (int? value) {
            //         setState(() {
            //           group = value!;
            //         });
            //       },
            //     ),
            //     const Text(
            //       'Metric unit',
            //       style: TextStyle(color: Colors.white, fontSize: 20),
            //     ),
            //     Radio(
            //       value: 2,
            //       groupValue: group,
            //       onChanged: (int? value) {
            //         setState(() {
            //           group = value!;
            //         });
            //       },
            //     )
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 130,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w300,
                        color: Colors.yellow),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        helperText: 'Height in cm',
                        helperStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        hintText: 'Height',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.7),
                        )),
                    keyboardType: TextInputType.number,
                    controller: heightController,
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w300,
                        color: Colors.yellow),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        helperText: 'Weight in kg',
                        helperStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        hintText: 'Weight',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.7),
                        )),
                    keyboardType: TextInputType.number,
                    controller: weightController,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                calculatebmiMetric();
              },
              child: const Text(
                'calculate',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _bmiResult.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 90.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _textResult,
              style: const TextStyle(
                fontFamily: 'Bnazanin',
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 60),
            const RightBar(barwidth: 80),
            const RightBar(barwidth: 50),
            const RightBar(barwidth: 90),
            const LeftBar(barwidth: 60),
            const LeftBar(barwidth: 40),
          ],
        ),
      ),
    );
  }

  void calculatebmiMetric() {
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);
    setState(() {
      _bmiResult = weight / pow(height, 2);
      if (_bmiResult > 25) {
        _textResult = "😱وزنت خیلی زیاده";
      } else if (_bmiResult <= 25 && _bmiResult >= 18.5) {
        _textResult = "🤗وزنت نرماله";
      } else {
        _textResult = "😳خیلی لاغری";
      }
    });
  }

  void calculatebmiUS() {
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);
    setState(() {
      _bmiResult = 703 * weight / pow(height, 2);
      if (_bmiResult > 25) {
        _textResult = "😱وزنت خیلی زیاده";
      } else if (_bmiResult <= 25 && _bmiResult >= 18.5) {
        _textResult = "🤗وزنت نرماله";
      } else {
        _textResult = "😳خیلی لاغری";
      }
    });
  }
}
