import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCounter>((event, emit) => incrementCounter(event, emit));
    on<DecrementCounter>((event, emit) => decrementCounter(event, emit));
  }

  incrementCounter(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counterValue: state.counterValue + 1));
  }

  decrementCounter(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counterValue: state.counterValue - 1));
  }
}