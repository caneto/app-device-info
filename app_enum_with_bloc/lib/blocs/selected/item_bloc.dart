import 'package:app_enum_with_bloc/blocs/selected/bloc_events.dart';
import 'package:app_enum_with_bloc/blocs/selected/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedBloc extends Bloc<SelectedEvents, SelectedState> {
  SelectedBloc() : super(InitialState()) {
    on<AddItem>(((event, emit) => emit(SelectedState(
          item: state.item,
          selectedItems: state.selectedItems..add(event.item),
        ))));
    on<RemoveItem>(((event, emit) => emit(SelectedState(
          item: state.item,
          selectedItems: state.selectedItems..remove(event.item),
        ))));
  }
}
