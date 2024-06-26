import 'package:calculator_app1/constant/colors.dart';
import 'package:calculator_app1/provider/cal_provider.dart';
import 'package:calculator_app1/screens/widgets_data.dart';
import 'package:calculator_app1/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app1/widgets/cal_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const padding = EdgeInsets.symmetric(horizontal: 25, vertical: 30);
    const decoration = BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)));

    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (state is InitialCalculatorState || state is UpdatedCalculatorState) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Text("Calculator App"),
              backgroundColor: Colors.black,
            ),
            body: Column(
              children: [
                CustomTextField(
                  controller: BlocProvider.of<CalculatorBloc>(context).compController,
                ),
                const Spacer(),
                Container(
                  height: screenHeight * 0.6,
                  width: double.infinity,
                  padding: padding,
                  decoration: decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (index) => buttonList[index]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (index) => buttonList[index + 4]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (index) => buttonList[index + 8]),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(3, (index) => buttonList[index + 12]),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(3, (index) => buttonList[index + 15]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const CalculateButton()
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Container(); // Handle other states if needed
        }
      },
    );
  }
}
