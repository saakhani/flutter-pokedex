import 'package:classwork/provider/pokemon_provider.dart';
import 'package:classwork/screens/details_page.dart';
import 'package:classwork/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonProvider(),
      child: MaterialApp(
        title: 'Pokedex',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {
          '/details': (context) => const DetailsPage(),
        },
      ),
    );
  }
}

void main() => runApp(const MyApp());