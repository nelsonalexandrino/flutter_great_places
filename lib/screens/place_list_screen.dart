import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_edit_place_screen.dart';
import '../providers/great_places_provider.dart';
import '../screens/place_details_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddEditPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlacesProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapShot) => snapShot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<GreatPlacesProvider>(
                child: Center(
                  child: const Text('Não tem places'),
                ),
                builder: (context, greatPlaces, child) =>
                    greatPlaces.places.length <= 0
                        ? child
                        : ListView.builder(
                            itemCount: greatPlaces.places.length,
                            itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  greatPlaces.places[index].image,
                                ),
                              ),
                              title: Text(greatPlaces.places[index].title),
                              subtitle: Text(
                                  greatPlaces.places[index].location.address),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  PlaceDetailScreen.routeName,
                                  arguments: greatPlaces.places[index].id,
                                );
                              },
                            ),
                          ),
              ),
      ),
    );
  }
}
