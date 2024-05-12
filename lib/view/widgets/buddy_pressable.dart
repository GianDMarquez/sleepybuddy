import 'package:flutter/material.dart';

class BuddyPressed extends StatefulWidget {
  const BuddyPressed({super.key});

  @override
  State<BuddyPressed> createState() => _BuddyPressedState();
}

class _BuddyPressedState  extends State<BuddyPressed> {
   final List<double> _sizes = [100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0];
  // Initial index for the list
  int _sizeIndex = 0;

  void _toggleGrow() {
    setState(() {
      _sizeIndex = (_sizeIndex + 1) % _sizes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleGrow,
      child: AnimatedContainer(
        duration: const Duration(seconds: 4), // Animation duration
        width: _sizes[_sizeIndex],
        height: _sizes[_sizeIndex],
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Container border radius
        ),
        child: Image.asset("assets/images/logo_buddy_pressable.png"),
      ),
    );
  }
}
