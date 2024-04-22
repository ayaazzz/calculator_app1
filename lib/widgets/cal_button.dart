import 'package:calculator_app1/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator_app1/constant/colors.dart';


class CalculateButton extends StatelessWidget {
  const CalculateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (state is InitialCalculatorState || state is UpdatedCalculatorState) {
              BlocProvider.of<CalculatorBloc>(context).add(SetValueEvent("="));
            }
          },
          child: Container(
            height: 160,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Center(
              child: Text(
                "=",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
