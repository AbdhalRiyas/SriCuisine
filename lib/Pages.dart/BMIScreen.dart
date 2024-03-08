import 'package:flutter/material.dart';

class BMIPageScreen extends StatefulWidget {
  @override
  _BMIPageScreenState createState() => _BMIPageScreenState();
}

class _BMIPageScreenState extends State<BMIPageScreen> {
  double _height = 0.0;
  double _weight = 0.0;
  double _bmi = 0.0;
  String _selectedGender = 'Male'; // Default gender is Male
  String _category = '';
  String _calorieIntake = '';

  void _calculateBMI() {
    setState(() {
      if (_height > 0 && _weight > 0) {
        _bmi = _weight / ((_height / 100) * (_height / 100));
        _category = _getCategory(_bmi);
      } else {
        _bmi = 0.0;
        _category = '';
        _calorieIntake = '';
      }
    });
  }

  String _getCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  void _calculateCalorieIntake() {
    double baseCalories = 2000;
    switch (_category) {
      case 'Underweight':
        _calorieIntake = (baseCalories * 1.2).toStringAsFixed(0);
        break;
      case 'Normal weight':
        _calorieIntake = (baseCalories * 1.2).toStringAsFixed(0);
        break;
      case 'Overweight':
        _calorieIntake = (baseCalories * 1.2).toStringAsFixed(0);
        break;
      case 'obese':
        _calorieIntake = (baseCalories * 1.2).toStringAsFixed(0);
        break;
      default:
        _calorieIntake = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Height (cm)',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _height = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Weight (kg)',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _weight = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio<String>(
                      value: 'Male',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    const Text('Male'),
                    Radio<String>(
                      value: 'Female',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    const Text('Female'),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: const Text('Calculate BMI'),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BMI: ${_bmi.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'You are in the $_category range',
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    // Text(
                    //   'Daily Calorie Intake: $_calorieIntake kcal',
                    //   style: const TextStyle(fontSize: 18),
                    //   textAlign: TextAlign.center,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
