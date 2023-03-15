import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10),
                    ImageInput(),
                  ]))),
        ),
        ElevatedButton.icon(
            style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.black),
                backgroundColor:
                    MaterialStatePropertyAll(Theme.of(context).accentColor),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: MaterialStateProperty.resolveWith<double>((states) {
                  if (states.contains(MaterialState.pressed)) return 0;
                  return 0;
                })),
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('Add Place'))
      ]),
    );
  }
}
