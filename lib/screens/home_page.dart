import 'package:classwork/provider/pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokemonProvider>(context, listen: false).getAllPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(''),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20, bottom: 12),
          child: Text(
            "Pokedex",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(195, 0, 0, 0)),
          ),
        ),
      ),
      ),
       body: Consumer<PokemonProvider>(builder: (context, value, child) {
        return value.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
              child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      padding: EdgeInsets.all(5),
                      itemCount: value.pokemon.length,
                      itemBuilder: (context, index) {
                        final pokemon = value.pokemon[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/details', arguments: pokemon);
                          },
                          child: Card(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 23),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(pokemon.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  Chip(backgroundColor: Color.fromARGB(255, 3, 76, 202) , shape: RoundedRectangleBorder(
                                      borderRadius:
                                                BorderRadius.circular(30)),
                                                  label: Text(pokemon.type[0]),
                                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
              ),
            );
       }
       ),
    );
  }
}