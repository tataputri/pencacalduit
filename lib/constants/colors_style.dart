import 'package:flutter/cupertino.dart';

const Color xColorMain = Color(0xff100F0F);
const Color xColorSubMain = Color(0xff2C3333);
const Color xColorPrimary = Color(0xffFFFFFF);
const Color xColorSubPrimary = Color(0xffF1F1F1);
const Color xColorVariant = Color(0xff59CE8F);
const Color xColorSubVariant = Color(0xFFAFF5CF);
const Color xColorAction = Color(0xffFF1E00);

LinearGradient xGradientLight = const LinearGradient(
  colors: [xColorVariant, xColorSubVariant],
  tileMode: TileMode.clamp,
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

LinearGradient xGradientDark = const LinearGradient(
  colors: [xColorMain, xColorSubMain],
  tileMode: TileMode.clamp,
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
