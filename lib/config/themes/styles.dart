import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/dimensions.dart';

/*
Text Styles
*/

final soraButtonText = TextStyle(
  fontSize: Dimensions.standardTextSize,
  fontWeight: FontWeight.bold,
  fontFamily: 'Sora',
  color: app_colors.white,
);

final soraNormalText = TextStyle(
  fontSize: Dimensions.headerTextSize,
  fontWeight: FontWeight.bold,
  fontFamily: 'Sora',
  color: app_colors.primaryBlack,
);

final soraSubtitleText = TextStyle(
  fontSize: Dimensions.standardTextSize,
  fontFamily: 'Sora',
  color: app_colors.primaryBlack,
);

final soraSubtitleBoldText = soraSubtitleText.copyWith(
  fontWeight: FontWeight.w600,
);

final soraSmallSubtitleText = soraSubtitleText.copyWith(
  fontSize: Dimensions.smallTextSize,
);

final soraSmallText = TextStyle(
  fontSize: Dimensions.verySmallTextSize,
  fontWeight: FontWeight.w700,
  fontFamily: 'Sora',
  color: app_colors.primaryBlack,
);

final soraExtremelySmallText = soraSmallText.copyWith(
  fontSize: Dimensions.extremelySmallTextSize,
);

final interNormalText = TextStyle(
  fontSize: Dimensions.standardTextSize,
  fontFamily: 'Inter',
  color: app_colors.primaryBlack,
);

final interNormalBoldText = TextStyle(
  fontSize: Dimensions.standardTextSize,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
  color: app_colors.primaryBlack,
);

final interSmallText = interNormalText.copyWith(
  fontSize: Dimensions.smallTextSize,
);

final moneyText = TextStyle(
  fontSize: Dimensions.d36,
  fontWeight: FontWeight.bold,
  fontFamily: 'Sora',
  color: app_colors.primaryWhite,
);

final moneySmallText = moneyText.copyWith(
  fontSize: Dimensions.d20 + Dimensions.d1 + (Dimensions.d1 * 0.69),
  color: app_colors.primaryBlue,
);

final moneyVerSmallText = moneySmallText.copyWith(
  fontSize: Dimensions.d18 + (Dimensions.d1 * 0.9),
);

final currencySmallText = moneySmallText.copyWith(
  fontFamily: 'Roboto',
  fontSize: Dimensions.d20 + Dimensions.d2 + (Dimensions.d1 * 0.69),
);

final currencyVerSmallText = moneyVerSmallText.copyWith(
  fontFamily: 'Roboto',
  fontSize: Dimensions.d10 + Dimensions.d9 + (Dimensions.d1 * 0.9),
);

final moneyTextFieldText = moneyText.copyWith(
  fontFamily: 'Inter',
  color: app_colors.primaryBlue,
);

final textFieldText = interNormalText.copyWith(color: app_colors.primaryBlack);

final textFieldHintText = interNormalText.copyWith(color: app_colors.hintAsh);

final moneyFieldHintText =
    moneyTextFieldText.copyWith(color: app_colors.hintAsh);

/*
Button Styles
*/

final wideButton = ElevatedButton.styleFrom(
  backgroundColor: app_colors.primaryBlue,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Dimensions.d5),
  ),
);

final wideButtonDisabled = ElevatedButton.styleFrom(
  backgroundColor: app_colors.buttonAsh,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Dimensions.d5),
  ),
);

final wideButtonOutlined = OutlinedButton.styleFrom(
  backgroundColor: Colors.transparent,
  foregroundColor: Colors.transparent,
  surfaceTintColor: Colors.transparent,
  shadowColor: Colors.transparent,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.d5)),
  side: BorderSide(
    color: app_colors.primaryBlue,
    width: Dimensions.d1,
  ),
);

final elevatedButton = ElevatedButton.styleFrom(
  backgroundColor: app_colors.tileBlue,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.d4)),
  minimumSize: Size.zero,
  elevation: 0.4,
  padding: EdgeInsets.all(Dimensions.d8),
);

/*
Clickable Text Button Styles
*/

final clickableText = TextButton.styleFrom(
  padding: EdgeInsets.symmetric(vertical: Dimensions.d4),
  alignment: Alignment.centerLeft,
  minimumSize: Size.zero,
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
);
