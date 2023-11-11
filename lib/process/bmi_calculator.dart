import 'dart:math';

class BMICalculator {
  BMICalculator({required this.weight, required this.height});

  final int weight;
  final int height;

  late double _bmi;

  Map<String, String> bmiMap = {
    'Normal':
        'A healthy lifestyle should be maintained with a well-balanced diet and consistent exercise.\n\nHow to Maintain:\nFocus on consuming a variety of nutrients from all food groups and engage in at least 150 minutes of moderate-intensity exercise per week.\n\nAdvantages:\nLower risk of health problems, increased energy levels, and overall well-being.',
    'Overweight':
        'Prioritize a balanced diet, regular exercise, and consider seeking advice from a healthcare professional.\n\nHow to Maintain:\nConcentrate on portion control, healthier food choices, and gradually increase physical activity. Consult with a healthcare provider or nutritionist for a personalized plan.\n\nAdvantages:\nWeight loss can lead to reduced health risks and improved overall health.',
    'Thin':
        'Ensure a nutritious diet rich in healthy fats and proteins. Seek guidance from a healthcare professional.\n\nHow to Maintain:\nConsume a variety of nutrient-dense foods and consider dietary supplements if necessary. Regular strength training exercises can help build muscle mass.\n\nAdvantages:\nProper nutrition and exercise can lead to improved muscle mass, strength, and overall health.',
    'Obese':
        'Seek professional guidance for a well-balanced diet and a structured exercise routine.\n\nHow to Maintain:\nWork with healthcare professionals such as dietitians and trainers to create a tailored diet and exercise plan. Focus on gradual, sustainable changes.\n\nAdvantages:\nWeight loss can lead to significant health improvements, reducing the risk of various health issues.'
  };

  Map<String, String> bmiRangeMap = {
    'Normal': 'BMI RANGE 18.5 - 24.9',
    'Overweight': 'BMI RANGE 25 - 29.9',
    'Thin': 'BMI RANGE less than 18.5',
    'Obese': 'BMI RANGE 30 or greater',
  };

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String calculateResultText() {
    if (_bmi >= 18.5 && _bmi < 25) {
      return 'normal';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'overweight';
    } else if (_bmi > 30) {
      return 'obesity';
    } else {
      return 'thin';
    }
  }

  String interpretation() {
    if (_bmi >= 18.5 && _bmi < 25) {
      return bmiMap['Normal'].toString();
    } else if (_bmi >= 25 && _bmi < 30) {
      return bmiMap['Overweight'].toString();
    } else if (_bmi > 30) {
      return bmiMap['Obese'].toString();
    } else {
      return bmiMap['Thin'].toString();
    }
  }

  String resultsRange() {
    if (_bmi >= 18.5 && _bmi < 25) {
      return bmiRangeMap['Normal'].toString();
    } else if (_bmi >= 25 && _bmi < 30) {
      return bmiRangeMap['Overweight'].toString();
    } else if (_bmi > 30) {
      return bmiRangeMap['Obese'].toString();
    } else {
      return bmiRangeMap['Thin'].toString();
    }
  }
}
