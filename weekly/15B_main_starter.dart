import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResponsiveDemo()
    );
  }
}

class ResponsiveDemo extends StatelessWidget {
  const ResponsiveDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Make this responsive!
    // Show MobileLayout when narrow < 600 , TabletLayout when wide > 600
    // **Hints:**
    // - Ternary: `condition ? exprIfTrue : exprIfFalse`
    // - Or wrap in a Column and use Collection If (like 15A)
    return Scaffold(
        body: Center(
          child: MobileLayout(),
        ),
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