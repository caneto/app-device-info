import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_item_experiment/blocs/item_bloc.dart';
import 'package:new_item_experiment/blocs/selected/bloc_events.dart';
import 'package:new_item_experiment/blocs/selected/bloc_state.dart';
import 'package:new_item_experiment/enums/item_enum.dart';

// 1) Convert from StateFullWidget to StatelessWidget
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  int _getSum(item) =>
      item.fold(0, (previousValue, element) => previousValue + element.bonus());

  @override
  Widget build(BuildContext context) {
    // 2) Add bloc builder
    return BlocBuilder<SelectedBloc, SelectedState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('App Enum with Hydrated BLoC'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  child: Text(
                    _getSum(state.selectedItems).toString(),
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                Wrap(
                  children: [
                    ...Item.values
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1),
                              child: ActionChip(
                                backgroundColor: state.selectedItems.contains(e)
                                    ? Colors.blue
                                    : null,
                                label: Text(
                                  e.name.toString(),
                                ),
                                onPressed: () {
                                  // 3) Word with the state with BlocProvider
                                  state.selectedItems.contains(e)
                                      ? BlocProvider.of<SelectedBloc>(context)
                                          .add(RemoveItem(e))
                                      : BlocProvider.of<SelectedBloc>(context)
                                          .add(AddItem(e));
                                },
                              ),
                            ))
                        .toList(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
