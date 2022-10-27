import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class BlokirPage extends StatelessWidget {
  const BlokirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<ValidationBloc, ValidationState>(
        builder: (context, state) {
          if (state is ValidationLoaded) {
            var data = state.modelValidation.systemApp!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.title!,
                      style: Theme.of(context).textTheme.headline1),
                  const SizedBox(height: 20),
                  CustomCacheImg(url: data.image!, height: 150),
                  const SizedBox(height: 10),
                  Text(
                    data.content!,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Uri uri = Uri.parse(data.url!);
                      _launchURL(context, uri);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.xColorDarkSub,
                    ),
                    child: const Text("update"),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      )),
    );
  }

  _launchURL(BuildContext context, Uri url) async {
    if (!await launchUrl(url)) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("URL not Found !")));
    }
  }
}
