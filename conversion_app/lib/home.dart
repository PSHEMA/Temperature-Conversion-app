import 'package:flutter/material.dart';

class TemperatureConversionHome extends StatefulWidget {
  const TemperatureConversionHome({super.key});

  @override
  _TemperatureConversionHomeState createState() =>
      _TemperatureConversionHomeState();
}

class _TemperatureConversionHomeState extends State<TemperatureConversionHome> {
  final _temperatureController = TextEditingController();
  String _conversionType = 'F to C';
  String _result = '';

  void _convert() {
    double inputTemp = double.tryParse(_temperatureController.text) ?? 0;
    double outputTemp;

    if (_conversionType == 'F to C') {
      outputTemp = (inputTemp - 32) * 5 / 9;
    } else {
      outputTemp = inputTemp * 9 / 5 + 32;
    }

    setState(() {
      _result = outputTemp.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Conversion',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _temperatureController,
              decoration: const InputDecoration(
                labelText: 'Enter Temperature',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('F to C'),
                    leading: Radio(
                      value: 'F to C',
                      groupValue: _conversionType,
                      onChanged: (value) {
                        setState(() {
                          _conversionType = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('C to F'),
                    leading: Radio(
                      value: 'C to F',
                      groupValue: _conversionType,
                      onChanged: (value) {
                        setState(() {
                          _conversionType = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: const Text('Convert'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _result.isEmpty
                  ? 'Result will be shown here'
                  : 'Converted Temperature: $_result',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
