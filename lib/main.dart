import 'dart:math';
import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Game',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int firstDice = 1;
  int secondDice = 1;
  int total = 2;

  final Random random = Random();

  void rollDice() {
    setState(() {
      firstDice = random.nextInt(6) + 1;
      secondDice = random.nextInt(6) + 1;

      total = firstDice + secondDice;
    });
  }

  void resetDice() {
    setState(() {
      firstDice = 1;
      secondDice = 1;
      total = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isWinner = total >= 10;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dice Game'),
        leading: const Icon(Icons.casino),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              const SizedBox(height: 15),

              Text(
                'Total: $total',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isWinner
                          ? Icons.sentiment_very_satisfied
                          : Icons.sentiment_very_dissatisfied,
                      size: 150,
                      color: isWinner
                          ? Colors.greenAccent
                          : Colors.redAccent,
                    ),

                    const SizedBox(height: 15),

                    Text(
                      isWinner ? 'You Win!' : 'You Lose!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: isWinner
                            ? Colors.greenAccent
                            : Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Dice(value: firstDice),
                  Dice(value: secondDice),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: rollDice,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Roll',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: resetDice,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Reset',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}