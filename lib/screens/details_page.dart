import 'package:classwork/model/pokemon.dart';
import 'package:classwork/provider/pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, pokemon});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokemonProvider>(context, listen: false).getAllPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      title: Text(''),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20, bottom: 12),
          child: Text(
            pokemon.name,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 254, 230, 230)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(pokemon.img, scale: 0.75,),
              ],
            ),
             Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                        Text(
                          'Height',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                        Text(
                          'Weight',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                        Text(
                          'Spawn Time',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                        Text(
                          'Weakness',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                         Text(
                          'Pre Evolution',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                        Text(
                          'Next Evolution',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                      ],
                    ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          pokemon.name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                        Text(
                          pokemon.height,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                        Text(
                          pokemon.weight,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                        Text(
                          pokemon.spawnTime,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                        Text(
                          pokemon.weaknesses[0],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(142, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        )
    );
  }
}