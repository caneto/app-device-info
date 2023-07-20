import 'package:app_enum_with_bloc/enums/item_enum.dart';

abstract class SelectedEvents {}

class AddItem extends SelectedEvents {
  AddItem(this.item);
  final Item item;
}

class RemoveItem extends SelectedEvents {
  RemoveItem(this.item);
  final Item item;
}
