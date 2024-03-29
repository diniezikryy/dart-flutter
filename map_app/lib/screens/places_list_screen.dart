import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';

import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Consumer<GreatPlaces>(
            child: Center(child: Text('Got no places yet, start adding some!')),
            builder: (context, greatPlaces, ch) => greatPlaces.items.length <= 0
                ? ch
                : ListView.builder(
                    itemCount: greatPlaces.items.length,
                    itemBuilder: (ctx, i) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(greatPlaces.items[i].image),
                      ),
                      title: Text(greatPlaces.items[i].title),
                      onTap: (() {
                        // Go to detail page
                      }),
                    ),
                  )));
  }
}
