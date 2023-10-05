import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rick_and_morty/app/models/PokemonModel.dart';

import 'package:rick_and_morty/app/services/CharacterService.dart';

import '../models/CharacterModel.dart';
import '../services/PokemonService.dart';

class PokemonController extends GetxController {

  PokemonService pokemonService = PokemonService();  //instanciando o servico
  var isLoading = false.obs;
  List<PokemonModel> pokemon = <PokemonModel>[].obs;

  static PokemonController get pokemonSpotController => Get.find();

  Future<dynamic> listPokemon()  async {           //future -> evento futuro semelhante ao await
    isLoading.value = true;
    var list = await pokemonService.fetchListPokemon();
    pokemon.addAll(list);
    isLoading.value = false;
    update();
    return pokemon;
  }
}