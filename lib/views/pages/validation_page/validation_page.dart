import 'package:flutter/material.dart';
import 'package:template_spam_playtore/constants/colors_style.dart';
import 'package:template_spam_playtore/constants/space_style.dart';
import 'package:template_spam_playtore/dummy/listdummy.dart';
import 'package:template_spam_playtore/views/widgets/admob/native_ad_widget.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  DataDummy? dataDummy;

  @override
  void initState() {
    dataDummy = DataDummy();
    dataDummy!.genereateListDummy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
          itemCount: dataDummy!.dataList.length,
          separatorBuilder: (BuildContext context, int index) {
            if (index == 3) {
              return Container( 
                  child: const NativeAdmobCustom(
                    unitId: "ca-app-pub-3940256099942544/2247696110",
                  ));
            } else {
              return Container();
            }
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Card(
                color: tspColorPrime,
                margin: tspSpaceSymetric(vertical: 10),
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(dataDummy!.dataList[index].toString()),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
