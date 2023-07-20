import 'package:new_item_experiment/enums/item_enum.dart';

class SelectedState {
  SelectedState({required this.item, required this.selectedItems});
  final List<Item> item;
  final List<Item> selectedItems;

// 1) add toJson method
  Map<String, dynamic> toJson() => {
        'items': item.map((e) => e.toString()).toList(),
        'selectedItems': selectedItems.map((e) => e.toString()).toList(),
      };
// 2) add fromJson factory
  factory SelectedState.fromJson(Map<String, dynamic> json) => SelectedState(
        item: (json['items'].map<Item>((e) => getItemType(e)).toList()),
        selectedItems:
            json['selectedItems'].map<Item>((e) => getItemType(e)).toList(),
      );
// 3) add an initial state factory
  factory SelectedState.initial() => SelectedState(
        item: Item.values,
        selectedItems: [],
      );
}

// 4) remove the initial state class, it is now handled in factory (step 4)
// class InitialState extends SelectedState {
//   InitialState()
//       : super(item: [Item.magical, Item.sharp, Item.heavy], selectedItems: []);
// }

Item getItemType(String item) {
  switch (item) {
    case 'Item.magical':
      return Item.magical;
    case 'Item.sharp':
      return Item.sharp;
    case 'Item.heavy':
      return Item.heavy;
    default:
      return Item.heavy;
  }
}
