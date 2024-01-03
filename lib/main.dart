import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/word_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WordController controller = Get.put(WordController());

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('A Random idea'),
          const BigCard(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.changeWord();
                },
                child: const Text('Next'),
              ),
              IconButton(
                onPressed: () {
                  controller.updateFavorite();
                },
                icon: Obx(() {
                  List favorites = controller.favorites;

                  return Icon(favorites.contains(controller.word)
                      ? Icons.favorite
                      : Icons.favorite_outline);
                }),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyFavoritePage(),
                ),
              );
            },
            child: const Text('Vew Favorite Word'),
          ),
        ],
      ),
    ));
  }
}

class BigCard extends StatelessWidget {
  const BigCard({super.key});

  @override
  Widget build(BuildContext context) {
    WordController wordController = Get.find<WordController>();

    return Obx(
      () => Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(wordController.word),
        ),
      ),
    );
  }
}

class MyFavoritePage extends StatelessWidget {
  const MyFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    List favorites = Get.find<WordController>().favorites;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                (context),
                context,
              );
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(favorites[index]),
            );
          },
          itemCount: favorites.length,
        ),
      ),
    );
  }
}
