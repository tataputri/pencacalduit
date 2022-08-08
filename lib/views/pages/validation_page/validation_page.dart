import 'package:flutter/material.dart'; 
import 'package:template_spam_playtore/dummy/listdummy.dart'; 
import 'package:template_spam_playtore/views/widgets/cache_img_widget.dart';
import 'package:template_spam_playtore/views/widgets/dialog_widget.dart'; 

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
    return   Scaffold(
      body: Center(
          child: InkWell(
            onTap: () => customDialog(context, title: "Labore fugiat nisi nulla laboris voluptate ad.", content: "Labore dolor ad esse eiusmod elit do proident Lorem. Occaecat anim aute eu laboris cupidatat irure proident quis quis sunt officia minim id. Aute pariatur nulla occaecat eiusmod dolore in in occaecat ipsum nulla proident.", img: "https://images.pexels.com/photos/12823102/pexels-photo-12823102.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            child:const CustomCacheImg(
                  url:
              'https://images.pexels.com/photos/12823102/pexels-photo-12823102.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
          )),
    );
  }
}
