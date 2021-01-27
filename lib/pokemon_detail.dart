//      Author: Ufuk Lisan            E-mail=lisanufuk@gmail.com
//      https://github.com/UfukLisan

import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/model/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;
  PokemonDetail({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(
        builder: (context, oriantation) {
          if (oriantation != Orientation.portrait) {
            return verticalBody(context);
          } else {
            return horizantalBody(context);
          }
        },
      ),
    );
  }

  Stack verticalBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width - 20,
          height: MediaQuery.of(context).size.height * (7 / 10),
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Height: " + pokemon.height,
                ),
                Text(
                  "Weight: " + pokemon.weight,
                ),
                Text(
                  "Types: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((type) => Chip(
                            backgroundColor: Colors.deepOrange.shade400,
                            label: Text(
                              type,
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                      .toList(),
                ),
                Text(
                  "Prev Evolution: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.prevEvolution != null
                      ? pokemon.prevEvolution
                          .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade400,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList()
                      : [Text("First Evolution")],
                ),
                Text(
                  "Next Evolution: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution != null
                      ? pokemon.nextEvolution
                          .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade400,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList()
                      : [Text("Final Evolution")],
                ),
                Text(
                  "Weakness",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses != null
                      ? pokemon.weaknesses
                          .map((weakness) => Chip(
                                backgroundColor: Colors.deepOrange.shade400,
                                label: Text(
                                  weakness,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList()
                      : [Text("None Weakneses")],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: pokemon.img,
              child: Container(
                width: 150,
                height: 150,
                child: Image.network(
                  pokemon.img,
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ],
    );
  }

  Widget horizantalBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (3 / 4),
      width: MediaQuery.of(context).size.width - 30,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  width: 200,
                  child: Image.network(
                    pokemon.img,
                    fit: BoxFit.fill,
                  ),
                )),
            flex: 2,
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height: " + pokemon.height,
                  ),
                  Text(
                    "Weight: " + pokemon.weight,
                  ),
                  Text(
                    "Types: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((type) => Chip(
                              backgroundColor: Colors.deepOrange.shade400,
                              label: Text(
                                type,
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                        .toList(),
                  ),
                  Text(
                    "Prev Evolution: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map((evolution) => Chip(
                                  backgroundColor: Colors.deepOrange.shade400,
                                  label: Text(
                                    evolution.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList()
                        : [Text("First Evolution")],
                  ),
                  Text(
                    "Next Evolution: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map((evolution) => Chip(
                                  backgroundColor: Colors.deepOrange.shade400,
                                  label: Text(
                                    evolution.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList()
                        : [Text("Final Evolution")],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map((weakness) => Chip(
                                  backgroundColor: Colors.deepOrange.shade400,
                                  label: Text(
                                    weakness,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList()
                        : [Text("None Weakneses")],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
