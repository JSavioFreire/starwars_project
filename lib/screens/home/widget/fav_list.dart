import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_project/data/info_db.dart';
import 'package:starwars_project/provider/api/fetch_api.dart';

class FavList extends StatelessWidget {
  const FavList({super.key});

  @override
  Widget build(BuildContext context) {
    Api api = Provider.of<Api>(context);
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 50),
          child: Text(
            'Favoritos',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FutureBuilder(
                future: InfoDao().findAll(),
                builder: ((context, snapshot) {
                  List? item = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      const CircularProgressIndicator();
                      break;
                    case ConnectionState.waiting:
                      const CircularProgressIndicator();
                      break;
                    case ConnectionState.active:
                      const CircularProgressIndicator();
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasData && item != null) {
                        if (item.isNotEmpty) {
                          return ListView.builder(
                              itemCount: item.length,
                              itemBuilder: (context, index) {
                                final eachPerson = item[index];
                                return Row(
                                  children: [
                                    Text(eachPerson),
                                    IconButton(
                                        onPressed: () {
                                          InfoDao().delete(eachPerson);
                                          api.refresh();
                                        },
                                        icon: const Icon(Icons.delete))
                                  ],
                                );
                              });
                        }
                        return const Center(
                            child: Text(
                                'Ainda não adicionou nenhum personagem como favorito'));
                      }
                      return (const Center(
                        child: Text('Erro no banco de dados'),
                      ));
                  }
                  return Container();
                })),
          ),
        ),
      ],
    );
  }
}
