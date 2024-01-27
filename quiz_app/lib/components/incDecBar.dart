import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// class getSliderVal {
//   static double sliderVal = 10;
// }

class BudgetSliderWidget extends StatefulWidget {
  final int correctAnswers;
  BudgetSliderWidget({super.key, this.correctAnswers = 10});
  @override
  _BudgetSliderWidgetState createState() => _BudgetSliderWidgetState();
}

class _BudgetSliderWidgetState extends State<BudgetSliderWidget> {
  int value = 0; // Initial value for the slider
  final int min = 0; // Minimum value for the slider
  final int max = 10; // Maximum value for the slider

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          customWidths: CustomSliderWidths(
            progressBarWidth: 10, // Thinner progress bar
            trackWidth: 7, // Thinner track
            shadowWidth: 0, // No shadow for a flat design
          ),
          customColors: CustomSliderColors(
            progressBarColor: Colors.deepPurple.shade500,
            trackColor: Colors.grey[300]!, // Lighter track color for minimalism
            dotColor: Colors.transparent,
          ),
          infoProperties: InfoProperties(
              mainLabelStyle: TextStyle(
                fontSize: 30, // Smaller font size for labels
                color: Colors.black,
                fontWeight: FontWeight.w600, // Less bold for minimalism
              ),
              modifier: (num value) {
                final budget = value.toInt();
                // int roundedValue = (budget / 1000).round() * 1000;
                // return '$roundedValue';
                return '${widget.correctAnswers}/10';
              }),
          startAngle: 270,
          angleRange: 360,
          size: 250,
          // animationEnabled: false, // Disable the animation for a snap effect
        ),
        initialValue: widget.correctAnswers.toDouble(), // Set the initial value
        min: min.toDouble(),
        max: max.toDouble(),
      ),
    );
  }
}
