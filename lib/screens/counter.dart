import 'package:bytebank/components/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Counter sample using Bloc, Cubit and Builder
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class CounterContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(),
      child: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Counter"),),
      body: Center(
        // Accessing Bloc.
        // This guy is redraw when Cubit emit an event because of builder gets notified
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text("$state", style: textTheme.headline2,);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            // Accessing Bloc.
            // This guy is not redraw when Cubit emit an event
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            // Accessing Bloc.
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}