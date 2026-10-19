import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

import './display_likes.dart'; // you don't need to ./ but can if you want


class RandomDogImage extends StatefulWidget {

  const RandomDogImage({super.key});

  // so we pack all our stuff inside a mutable comparment
  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}


class _RandomDogImageState extends State<RandomDogImage> {

  String dogImageUrl = '';
  int    likes       = 0;
  int    dislikes    = 0;

  static Future<String> getRandomDogUrl() async {
    const dogEndpoint = 'https://dog.ceo/api/breeds/image/random';
    var response      = await get(Uri.parse(dogEndpoint));

    return jsonDecode(response.body)['message'];
  }

  Future<void> fetchNewDog() async {
    if (!mounted) return;

    setState(() { dogImageUrl = ''; });
    final url = await getRandomDogUrl();

    setState(() { dogImageUrl = url; });
  }

  Widget _buildDogImage() {
    return GestureDetector(
      onTap: () {
        getRandomDogUrl().then(
          (url) {
            setState(() {
              dogImageUrl = url;
              likes += 1;
            });
          });
      },
      onLongPress: () {
        getRandomDogUrl().then(
          (url) {
            setState(() {
              dogImageUrl = url;
              dislikes += 1;
            });
          });
      },
      child: SizedBox(
        height: 300,
        child: dogImageUrl.isEmpty 
          ? const Text("Loading dog...")
          : Image.network(dogImageUrl)
      ),
    );
  }


  @override
  void initState() {
    super.initState(); 
    fetchNewDog();
  }


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[   
        _buildDogImage(),
        const SizedBox(height: 24),
        const Text("press dog to get new dog"),
        DisplayLikes(numLikes: likes),
        DisplayLikes(numLikes: dislikes, forDislikes: true),
      ]
    );
  }
}