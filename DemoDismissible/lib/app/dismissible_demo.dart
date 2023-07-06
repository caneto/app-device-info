
import 'package:flutter/material.dart';

class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({Key? key}) : super(key: key);

  @override
  State<DismissibleDemo> createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  List<String> items = [
    "Assistir",
    "Jeans",
    "Camisa",
    "Camiseta",
    "Xícara",
    "Sapato",
    "Boné",
    "Shorts",
    "Calça",
    "Mais baixo",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("Demonstração Flutter Dismissible"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              background: Container(
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.red),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('Mover para favoritos',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.delete, color: Colors.white),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('Mover para lixeira',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              key: ValueKey<String>(items[index]),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              confirmDismiss: (DismissDirection direction) async {
                if (direction == DismissDirection.startToEnd) {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Adicionar presente ao carrinho"),
                        content: const Text(
                            "Tem certeza que deseja adicionar este presente em seu carrinho"),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Sim")),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("Não"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Remover presente"),
                        content: const Text(
                            "Tem certeza de que deseja remover este item de presente?"),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Sim")),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("Não"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: ListTile(
                leading: const Icon(
                  Icons.card_giftcard_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  items[index],
                  style: TextStyle(
                      color: Colors.black.withOpacity(.6), fontSize: 18),
                ),
                subtitle: Text(
                  "Este presente é para você",
                  style: TextStyle(color: Colors.green.withOpacity(.6)),
                ),
              ),
            );
          },
        ));
  }
}