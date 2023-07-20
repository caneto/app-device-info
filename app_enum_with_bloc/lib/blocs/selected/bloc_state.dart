import 'package:app_enum_with_bloc/enums/item_enum.dart';

class SelectedState {
  SelectedState({required this.item, required this.selectedItems});
  final List<Item> item;
  final List<Item> selectedItems;
}

class InitialState extends SelectedState {
  InitialState()
      : super(item: [Item.magical, Item.sharp, Item.heavy], selectedItems: []);
}
