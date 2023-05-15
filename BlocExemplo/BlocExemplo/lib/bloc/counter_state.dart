part of 'counter_bloc.dart';

class CounterState {
  final int counterValue;

  CounterState({required this.counterValue});

  factory CounterState.initial() => CounterState(counterValue: 0);

  CounterState copyWith({int? counterValue}) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
    );
  }
}