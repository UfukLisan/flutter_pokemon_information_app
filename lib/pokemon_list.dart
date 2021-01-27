//      Author: Ufuk Lisan            E-mail=lisanufuk@gmail.com
//      https://github.com/UfukLisan

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/model/pokedex.dart';
import 'package:http/http.dart' as http;

import 'file:///C:/flutter_applications/flutter_pokedex_app/lib/pokemon_detail.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Pokedex pokedex;
  Future<Pokedex> data;

  Future<Pokedex> getPokemon() async {
    var response = await http.get(url);
    var jsonDecoded = jsonDecode(response.body);
    pokedex = Pokedex.fromJson(jsonDecoded);
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<Pokedex> gettedPokedex) {
                if (gettedPokedex.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (gettedPokedex.connectionState ==
                    ConnectionState.done) {
                  return GridView.count(
                    crossAxisCount: 2,
                    children: gettedPokedex.data.pokemon.map((poke) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PokemonDetail(
                                        pokemon: poke,
                                      )));
                        },
                        child: Hero(
                            tag: poke.img,
                            child: Card(
                              elevation: 6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 150,
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/giphy_dowloand.gif",
                                      image: poke.img,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    poke.name,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                      );
                    }).toList(),
                  );

                  /*GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Text(gettedPokedex.data.pokemon[index].name);
                  });*/

                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<Pokedex> gettedPokedex) {
                if (gettedPokedex.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (gettedPokedex.connectionState ==
                    ConnectionState.done) {
                  return GridView.extent(
                    maxCrossAxisExtent: 300,
                    children: gettedPokedex.data.pokemon.map((poke) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PokemonDetail(
                                        pokemon: poke,
                                      )));
                        },
                        child: Hero(
                            tag: poke.img,
                            child: Card(
                              elevation: 6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 150,
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/giphy_dowloand.gif",
                                      image: poke.img,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    poke.name,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                      );
                    }).toList(),
                  );

                  /*GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Text(gettedPokedex.data.pokemon[index].name);
                  });*/

                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          }
        },
      ),
    );
  }
}
