import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GarbageProbability extends StatefulWidget {
  const GarbageProbability({super.key});

  @override
  State<GarbageProbability> createState() => _GarbageProbabilityState();
}

class _GarbageProbabilityState extends State<GarbageProbability> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Probable Garbage Pickups'),
      ),
      body: Container(
        child: const Center(
          child: Text('Garbage Pickup Requests'),
        ),
      ),
    );
  }
}