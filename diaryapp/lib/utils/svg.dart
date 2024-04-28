import 'package:diaryapp/models/diary_model.dart';
import 'package:flutter_svg/svg.dart';

getFeelingSvg(String string) {
  switch (string) {
    case "smile":
      return SvgPicture.asset(Feeling.smile.asset,
          semanticsLabel: Feeling.smile.description);
    case "anger":
      return SvgPicture.asset(Feeling.anger.asset,
          semanticsLabel: Feeling.anger.description);
    case "sad":
      return SvgPicture.asset(Feeling.sad.asset,
          semanticsLabel: Feeling.sad.description);
    case "neutral":
      return SvgPicture.asset(Feeling.neutral.asset,
          semanticsLabel: Feeling.neutral.description);
    default:
      return SvgPicture.asset(Feeling.neutral.asset,
          semanticsLabel: Feeling.neutral.description);
  }
}
