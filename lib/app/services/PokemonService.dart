import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/app/models/CharacterModel.dart';
import 'dart:developer';

import '../models/PokemonModel.dart';
class PokemonService{

  String urlGetList = "https://pokeapi.co/api/v2/pokemon/";

  dynamic _response;

  Future<dynamic> fetchListPokemon() async {
    _response = await http.get(Uri.parse(urlGetList));
    if (_response.statusCode == 200) {
      //Map<String, dynamic> retorno = json.decode(_response.body);
      //print(retorno);

      var list = json.decode(_response.body);
      List<PokemonModel> listPokemonModel = [];
      for (var item in list["results"]) {
        listPokemonModel.add((PokemonModel.fromJson(item)));
      }

      //return ParkingSpotList.fromJson(list);
      return listPokemonModel;
    } else {
      throw Exception('Failed to load cote');
    }
  }


}


