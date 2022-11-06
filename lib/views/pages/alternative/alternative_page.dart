import 'package:firemax_football/bloc/alternative/alternative_bloc.dart';
import 'package:firemax_football/models/detail.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/validation/validation_bloc.dart';
import '../../../constants/constant.dart';
import '../../widgets/loading_widget.dart';

class AlternativePage extends StatefulWidget {
  const AlternativePage({super.key});

  @override
  State<AlternativePage> createState() => _AlternativePageState();
}

class _AlternativePageState extends State<AlternativePage> {
  late AlternativeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AlternativeBloc>(context);
    _bloc.add(LoadAlternative());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Alternative Server"),
        ),
        body: BlocBuilder<AlternativeBloc, AlternativeState>(
          builder: (context, state) {
            if (state is AlternativeWaiting) {
              return SizedBox(
                height: Constant.xSizeHeight(context),
                child: const Center(child: CustomLoading()),
              );
            }
            if (state is AlternativeLoaded) {
              return ListView.builder(
                itemCount: state.modelAlternative.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = state.modelAlternative.data![index];
                  return BlocBuilder<ValidationBloc, ValidationState>(
                    builder: (context, statVal) {
                      if (statVal is ValidationLoaded) {
                        return InkWell(
                          onTap: () {
                            GoRoute.push(
                              context: context,
                              routeName: Constant.xScreenEmbedPLayer,
                              modelValidation: statVal.modelValidation,
                              modelDetail: ModelDetail(
                                title: data.club,
                                url: data.link!.server1!.link!,
                              ),
                            );
                          },
                          child: Container(
                            width: Constant.xSizeWidth(context),
                            padding: Constant.xSpaceSymetric(
                                horizontal: 8, vertical: 10),
                            margin: Constant.xSpaceSymetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: Constant.xColorDarkSub,
                              borderRadius:
                                  BorderRadius.circular(Constant.xDefaultSize),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.hari!,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Text(data.jam!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  data.club!,
                                  style: Theme.of(context).textTheme.headline6,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  );
                },
              );
            }
            return Container();
          },
        ));
  }
}
