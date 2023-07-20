import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:new_item_experiment/blocs/selected/bloc_events.dart';
import 'package:new_item_experiment/blocs/selected/bloc_state.dart';

class SelectedBloc extends HydratedBloc<SelectedEvents, SelectedState> {
  // 1) Change this code to use the new state source
  SelectedBloc() : super(SelectedState.initial()) {
    on<AddItem>(((event, emit) => emit(SelectedState(
          item: state.item,
          selectedItems: state.selectedItems..add(event.item),
        ))));
    on<RemoveItem>(((event, emit) => emit(SelectedState(
          item: state.item,
          selectedItems: state.selectedItems..remove(event.item),
        ))));
  }

  @override
  SelectedState? fromJson(Map<String, dynamic> json) {
    return SelectedState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SelectedState state) {
    return state.toJson();
  }
}
