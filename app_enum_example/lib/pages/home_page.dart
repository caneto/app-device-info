import 'package:app_enum_example/enums/item_enum.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> items = [Item.magical, Item.sharp, Item.heavy];
  List<Item> selected = [];

  int _getSum(item) =>
      item.fold(0, (previousValue, element) => previousValue + element.bonus());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App: Decorators-like Enum'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              child: Text('${_getSum(selected)}'),
            ),
            Wrap(
              children: [
                ...items
                    .map((item) => ActionChip(
                          backgroundColor: selected.contains(item)
                              ? Colors.blue
                              : Colors.grey,
                          label: Text(item.name.toString()),
                          onPressed: () {
                            setState(() {
                              selected.contains(item)
                                  ? selected.remove(item)
                                  : selected.add(item);
                            });
                          },
                        ))
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
