import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:function_tree/function_tree.dart';
import 'package:flutter/material.dart';


abstract class CalculatorEvent {}

class SetValueEvent extends CalculatorEvent {
  final String value;

  SetValueEvent(this.value);
}


abstract class CalculatorState {}

class InitialCalculatorState extends CalculatorState {
  final String displayText;

  InitialCalculatorState(this.displayText);
}

class UpdatedCalculatorState extends CalculatorState {
  final String displayText;

  UpdatedCalculatorState(this.displayText);
}


class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final TextEditingController compController = TextEditingController();

  CalculatorBloc() : super(InitialCalculatorState("0")) {
    on<SetValueEvent>((event, emit) {
      _handleSetValueEvent(event.value);
    });
  }

  void _handleSetValueEvent(String value) {
    String str = compController.text;

    switch (value) {
      case "C":
        compController.clear();
        break;
      case "AC":
        compController.text = str.substring(0, str.length - 1);
        break;
      case "X":
        compController.text += "*";
        break;
      case "=":
        compute();
        break;
      default:
        compController.text += value;
    }
    compController.selection = TextSelection.fromPosition(
        TextPosition(offset: compController.text.length));

    emit(UpdatedCalculatorState(compController.text));
  }

  void compute() {
    String text = compController.text;
    compController.text = text.interpret().toString();

    emit(UpdatedCalculatorState(compController.text));
  }

  @override
  Future<void> close() {
    compController.dispose();
    return super.close();
  }
}

