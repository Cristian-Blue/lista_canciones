import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int cantidad = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.plus_one),
              onPressed: () => {
                    setState(() {
                      cantidad++;
                    })
                  }),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              cantidad--;
              setState(() {});
            },
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
              child: const Icon(Icons.restart_alt),
              onPressed: () => {
                    setState(() {
                      cantidad = 0;
                    })
                  })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Cantidad de Clicks"),
            Text("$cantidad"),
          ],
        ),
      ),
    );
  }
}
