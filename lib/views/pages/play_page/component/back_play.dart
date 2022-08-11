import 'package:firemax_football/bloc/validation/validation_bloc.dart'; 
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget backPlay(BuildContext context, Color color) {
  return BlocBuilder<ValidationBloc, ValidationState>(
    builder: (context, state) {
      if (state is ValidationLoaded) {
        return IconButton(
            onPressed: () {
              GoRoute.back(
                context: context,
                modelValidation: state.modelValidation,
              );
            },
            icon:   Icon(
              Icons.arrow_back,
              color: color,
            ));
      }
      return Container();
    },
  );
}
