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
        // something to watch for: be careful to always use setState when you're 
        // mutating stateful data. in this case, likes/dislikes are being changed without setState
        // but the component still re-renders, because fetchNewDog() *does* use setState.
        GestureDetector(
          onTap: () {
            // fix: onTap was not working but onLongPress (and any other gesture detection) was, because
            //      I had an onTap downwards in the tree directly around the image itself. That onTap handler
            //      overwrote this one.
            fetchNewDog();
            likes += 1;
            // note also: despite the state change (and *expected* re-render) occurring before the likes+=1,
            //            you still see the new number re-rendered. -> flutter re-renders at the end of a code block
            //            as a performance optimisation.
          },  // React (web) analogue: <SomeComponent onClick={() => {}}
          onLongPress: () {
            fetchNewDog();
            dislikes += 1;
            print("dislikes: $dislikes");
          },
          child: SizedBox(
            height: 300,
            child: dogImageUrl.isEmpty 
              ? const Text("Loading dog...")
              : Image.network(dogImageUrl)
          ),
        ),

        const SizedBox(height: 24),
        
        const Text("press dog to get new dog"),

        DisplayLikes(numLikes: likes),
        DisplayLikes(numLikes: dislikes, forDislikes: true),


      ]
    );
  }
}