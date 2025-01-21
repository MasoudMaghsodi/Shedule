import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shedule/gen/assets.gen.dart';

class SheduleModel {
  String name;
  SvgPicture icon;
  Color colorMain;
  Color boxCornerColor;

  SheduleModel(
      {required this.name,
      required this.icon,
      required this.colorMain,
      required this.boxCornerColor});
}

final List<SheduleModel> sheduleModel = [
  SheduleModel(
      name: 'Mathematics',
      icon: Assets.img.shedule.squareRootOfXMathFormula.svg(fit: BoxFit.cover),
      colorMain: Color(0xffFF7648),
      boxCornerColor: Color(0xffFFC278)),
  SheduleModel(
      name: 'Geography',
      icon: Assets.img.shedule.earth.svg(fit: BoxFit.cover),
      colorMain: Color(0xff8F98FF),
      boxCornerColor: Color(0xff182A88)),
  SheduleModel(
      name: 'Programming',
      icon: Assets.img.shedule.squareRootOfXMathFormula.svg(fit: BoxFit.cover),
      colorMain: Color(0xffFFC278),
      boxCornerColor: Color(0xffFF7648)),
];
