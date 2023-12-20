import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphite_client/screens/admin.dart';

void main() {
  runApp(const ProviderScope(child: Graphite()));
}

class Graphite extends StatelessWidget {
  const Graphite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graphite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(5, 142, 217, 1),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const AdminScreen(),
      },
    );
  }
}
