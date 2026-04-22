import 'package:flutter/material.dart';

class ClacSquarePage extends StatefulWidget {
  const ClacSquarePage({super.key});

  @override
  State<ClacSquarePage> createState() => _ClacSquarePageState();
}

class _ClacSquarePageState extends State<ClacSquarePage> {
  final TextEditingController _numberController = TextEditingController();
  num _result = 0;

  void _calcTheSquare() {
    num number = num.parse(_numberController.text.trim());
    setState(() {
      _result = number * number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculate Square')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter a number and click "Calculate Square":'),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number'),
            ),
            const SizedBox(height: 10),
            Text('$_result', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calcTheSquare,
              child: const Text('Calculate Square'),
            ),
          ],
        ),
      ),
    );
  }
}
