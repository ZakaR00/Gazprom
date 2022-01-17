import 'dart:convert';
import 'package:dentist_flutter/models/recipe.dart';
import 'package:http/http.dart' as http;



class RecipeApi {
  static Future<List<Recipe>?> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {'limit': '18', 'start': '0', 'tag': 'list.recipe.popular'});

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': '44c38a41fdmsh4867806e348c7c1p1b3f51jsnd28ef3979fb1'
    });



   Map data = jsonDecode(response.body);
    List _temp = [];

    for(var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);

  }
}
