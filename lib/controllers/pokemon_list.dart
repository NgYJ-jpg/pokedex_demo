import 'package:pokedex_demo/models/pokemon_basic.dart';
// import 'package:pokedex_demo/common/http_request.dart';
import 'package:pokedex_demo/common/http_client.dart';



class PokemonBasicList {
  dynamic payload;

  Future<List<PokemonBasic>?> fetchNewBatch(String? url) async {
    List<PokemonBasic>? batch;

    // await client.get('https://localhost:3000/api-sustana/v1/login');
    try {
      payload = await client.get(url ?? 'https://pokeapi.co/api/v2/pokemon/', query: {'limit': 20} ).then((val) { 
      batch = ((val['results'] as List).map((it) {
        var lst = (it['url'] as String).split('/');
        var id = lst[lst.length - 2];
        return PokemonBasic(id: int.parse(id), name: it['name'], imagePath: 'graphics/sprites/pokemon/$id.png', url: it['url']);
      }).toList());

    });
    } catch(e) {
      batch = [PokemonBasic(id: 1, name: 'reqFailure', url: '1/1/1/')];
    }
    

    return batch;
  }

  Future<List<PokemonBasic>?> next() async {
    return await fetchNewBatch(payload['next']! as String);
  }

  Future<List<PokemonBasic>?> prev() async {
    return await fetchNewBatch(payload['previous']! as String);
  }
}
