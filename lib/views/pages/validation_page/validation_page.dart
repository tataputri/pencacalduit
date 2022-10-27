import 'package:firemax_football/bloc/validation/validation_bloc.dart'; 
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  late ValidationBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of(context);
    bloc.add(LoadValidation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constant.xColorDark,
        body: BlocConsumer<ValidationBloc, ValidationState>(
          listener: (context, state) {
            if (state is ValidationLoaded) {
              if (state.modelValidation.systemApp!.status == false) {
                GoRoute.pushReplace(
                    context: context,
                    routeName: Constant.xScreenDash,
                    modelValidation: state.modelValidation);
              } else {
                GoRoute.pushReplace(
                    context: context,
                    routeName: Constant.xScreenBlokir,
                    modelValidation: state.modelValidation);
              }
            }
          },
          builder: (context, state) {
            if (state is ValidationWaiting) {
              return const Center(
                child: CustomLoading(
                  color: Constant.xColorAccents,
                  width: 30,
                  height: 30,
                ),
              );
            }
            if (state is ValidationLoaded) {
              return Container();
            }
            return Container();
          },
        ));
  }
}
