import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ResponsiveDemo());
  }
}

class ResponsiveDemo extends StatelessWidget {
  const ResponsiveDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width using MediaQuery
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Width: ${width.toStringAsFixed(0)}px'),
      ),
      // Ternary operator - the right choice for single-widget properties like body:
      // Collection If is for children: [] lists (like in 15A's camera example)
      body: width < 600
          ? const MobileLayout()
          : const TabletLayout(),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.phone_android, size: 100),
          Text('Mobile Layout', style: TextStyle(fontSize: 24)),
          Text('Single column, stacked content'),
        ],
      ),
    );
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.tablet, size: 100),
          SizedBox(width: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tablet Layout', style: TextStyle(fontSize: 24)),
              Text('Side-by-side content'),
            ],
          ),
        ],
      ),
    );
  }
}
