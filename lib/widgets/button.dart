import 'package:calculator_app1/constant/colors.dart';
import 'package:calculator_app1/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Button1 extends StatelessWidget {
  const Button1({
    Key? key,
    required this.label,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String label;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (state is InitialCalculatorState || state is UpdatedCalculatorState) {
              BlocProvider.of<CalculatorBloc>(context).add(SetValueEvent(label));
            }
          },
          child: Material(
            elevation: 3,
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(50),
            child: CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.secondary2Color,
              child: Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

