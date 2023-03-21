import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_project/data/info_db.dart';
import 'package:starwars_project/model/fetch_http_model.dart';
import 'package:starwars_project/model/info_model.dart';
import 'package:starwars_project/provider/api/fetch_api.dart';
import 'package:starwars_project/screens/about/components/row_about.dart';

showModal({required BuildContext context, required HttpModel person}) {
  Api api = Provider.of<Api>(context, listen: false);
  showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            color: Colors.white70,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {
                          InfoDao()
                              .save(InfoModel(name: person.name.toString()));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('${person.name} é favorito agora!')));
                          api.refresh();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.star_border,
                          size: 40,
                        ))
                  ],
                ),
              ),
              RowAbout(left: 'Nome', right: person.name.toString()),
              RowAbout(
                  left: 'Ano do nascimento',
                  right: person.birthYear.toString()),
              RowAbout(left: 'Altura', right: '${person.height} cm'),
              RowAbout(left: 'Peso', right: '${person.mass} quilos'),
              RowAbout(left: 'Gênero', right: person.gender.toString()),
            ]),
          ),
        );
      });
}
