import 'package:app_enum_with_bloc/enums/item_enum.dart';

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
