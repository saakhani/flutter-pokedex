
import 'package:classwork/model/pokemon.dart';
import 'package:dio/dio.dart';


class PokemonService {
  final dio = Dio();

  Future<List<Pokemon>> getAllPokemon() async {
    Response response =
        await dio.get('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

    if (response.statusCode == 200) {
      final json = response.data as List;

      //map returns an item on each iteration
      final pokemon = json.map((e) {
        return Pokemon(
          id: e['id'],
          num: e['num'],
          name: e['name'],
          img: e['img'],
          type: List<String>.from(e['type']),
          height: e['height'],
          weight: e['weight'],
          candy: e['candy'],
          candyCount: e['candy_count'],
          egg: e['egg'],
          spawnChance: e['spawn_chance'],
          avgSpawns: e['avg_spawns'],
          spawnTime: e['spawn_time'],
          multipliers: List<double>.from(e['multipliers']),
          weaknesses: List<String>.from(e['weaknesses']),
        );
      }).toList();

      return pokemon;
    }
    return [];
  }
}