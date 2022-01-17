import 'package:dentist_flutter/models/recipe..card.dart';
import 'package:dentist_flutter/models/recipe.api.dart';
import 'package:dentist_flutter/models/recipe.dart';
import 'package:dentist_flutter/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe() async {
    _recipes = (await RecipeApi.getRecipe())!;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.restaurant_menu),
                  SizedBox(width: 10),
                  Text('Рецепты блюд')
                ])),
        body: _isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: _recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(
                data: Reciapp (
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime,
                    rating: _recipes[index].rating.toString(),
                    thumbnailUrl: _recipes[index].images)
                );
            }));
  }
}
