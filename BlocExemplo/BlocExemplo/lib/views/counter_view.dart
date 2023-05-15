import 'package:blocexemplo/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: BlocProvider(
        create: (_) => CounterBloc(),
        child: const CounterView(),
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Counter', style: TextStyle(fontSize: 24.0)),
              Text('${state.counterValue}', style: const TextStyle(fontSize: 36.0)),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 16.0),
                  FloatingActionButton(
                    onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}