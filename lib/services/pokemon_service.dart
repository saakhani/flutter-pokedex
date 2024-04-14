import 'dart:convert';

import 'package:classwork/model/pokemon.dart';
import 'package:http/http.dart' as http;


class PokemonService {
  Future<List<Pokemon>> getAllPokemon() async {
    String url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body)["pokemon"];

      //map returns an item on each iteration
      final pokemon = json.map((e) {
        return Pokemon(
          id: e["id"],
          num: e["num"],
          name: e["name"],
          img: e["img"],
          type: List<String>.from(e["type"]),
          height: e["height"],
          weight: e["weight"],
          candy: e["candy"],
          candyCount: e["candy_count"] ?? 0,
          egg: e["egg"],
          spawnChance: e["spawn_chance"] is int ? (e["spawn_chance"] as int).toDouble() : e["spawn_chance"],
          avgSpawns: e["avg_spawns"] is int ? (e["avg_spawns"] as int).toDouble() : e["avg_spawns"],
          spawnTime: e["spawn_time"],
          multipliers: List<double>.from(e["multipliers"] ?? [0.00]),
          weaknesses: List<String>.from(e["weaknesses"]),
nextEvolution: e["next_evolution"] != null ? (e["next_evolution"] as List).map((i) => Evolution.fromJson(i)).toList() : [],
prevEvolution: e["prev_evolution"] != null ? (e["prev_evolution"] as List).map((i) => Evolution.fromJson(i)).toList() : []
        );
      }).toList();

      return pokemon;
    }
    return [];
  }
}