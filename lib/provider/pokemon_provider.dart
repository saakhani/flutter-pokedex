import 'package:classwork/model/pokemon.dart';
import 'package:classwork/services/pokemon_service.dart';
import 'package:flutter/material.dart';

class PokemonProvider extends ChangeNotifier {
  final _service = PokemonService();
  bool isLoading = false;
  List<Pokemon> _pokemon = [];
  List<Pokemon> get pokemon => _pokemon;

  Future<void> getAllPokemon() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAllPokemon();

    _pokemon = response;
    isLoading = false;
    notifyListeners();
  }
}
