import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/clickable_texts/clickable_text.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/auth/welcome_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/widgets/scaffolds/plain_scaffold.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const String id = '/onboarding_screen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  late int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      pageColor: app_colors.background,
      imagePadding: EdgeInsets.zero,
      imageFlex: 2,
      contentMargin: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(
        top: Dimensions.standardSpacing,
        bottom: Dimensions.standardPaddingSize,
      ),
    );

    return PlainScaffold(
      isBackButtonPresent: false,
      isScrollable: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Dimensions.d70),
          Expanded(
            child: IntroductionScreen(
              key: introKey,
              globalBackgroundColor: app_colors.background,
              pages: [
                PageViewModel(
                  titleWidget: firstTitle,
                  bodyWidget: const BodyText(
                    text:
                        'Get your parcels delivered with minimal effort anywhere you are.',
                  ),
                  image: _buildImage('onboarding_1.png'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  titleWidget: secondTitle,
                  bodyWidget: const BodyText(
                    text:
                        'Track your parcels live and receive regular updates on your shipment',
                  ),
                  image: _buildImage('onboarding_2.png'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  titleWidget: thirdTitle,
                  bodyWidget: const BodyText(
                      text:
                          'Perfect for individuals, small businesses and pretty much anyone who need to deliver a package'),
                  image: _buildImage('onboarding_3.png'),
                  decoration: pageDecoration,
                ),
              ],
              onChange: (page) {
                setState(() {
                  pageNumber = page;
                });
              },
              showDoneButton: false,
              showNextButton: false,
              showSkipButton: false,
              showBackButton: true,
              back: const CircleAvatar(
                backgroundColor: app_colors.primaryBlue,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              curve: Curves.fastLinearToSlowEaseIn,
              dotsDecorator: DotsDecorator(
                size: Size(Dimensions.d12, Dimensions.d5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.d25),
                ),
                color: const Color(0xFFBDBDBD),
                activeColor: app_colors.primaryBlue,
                activeSize: Size(Dimensions.d20, Dimensions.d5),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.d25),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.d40),
          wideButton(context: context),
          SizedBox(height: Dimensions.d20),
          Container(
              alignment: Alignment.centerRight,
              height: Dimensions.d50,
              child: skipText()),
          SizedBox(height: Dimensions.d20),
        ],
      ),
    );
  }

  Widget _buildImage(String assetName, [double width = 390]) {
    return Image.asset('images/$assetName', width: width);
  }

  Widget get firstTitle {
    return Container(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: const TextSpan(
          children: [
            WidgetSpan(
              child: HeaderText(
                text: 'Fast delivery ',
                color: app_colors.primaryBlue,
              ),
            ),
            WidgetSpan(
              child: HeaderText(text: 'at your service'),
            ),
          ],
        ),
      ),
    );
  }

  Widget get secondTitle {
    return Container(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: const TextSpan(
          children: [
            WidgetSpan(
              child: HeaderText(text: 'Real time '),
            ),
            WidgetSpan(
              child: HeaderText(
                text: 'Tracking',
                color: app_colors.primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get thirdTitle {
    return Container(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: const TextSpan(
          children: [
            WidgetSpan(
              child: HeaderText(
                text: 'Service ',
                color: app_colors.primaryBlue,
              ),
            ),
            WidgetSpan(
              child: HeaderText(text: 'to everyone'),
            ),
          ],
        ),
      ),
    );
  }

  Widget wideButton({required BuildContext context}) {
    if (pageNumber != 2) {
      return WideButton(
        label: 'Next',
        onPressedCallback: () {
          //introKey.currentState?.animateScroll(pageNumber++);
          introKey.currentState?.next();
        },
      );
    } else {
      return WideButton(
        label: 'Get started',
        onPressedCallback: () {
          Navigator.pushNamed(context, WelcomeScreen.id);
        },
      );
    }
  }

  Widget skipText() {
    if (pageNumber == 0) {
      return ClickableText(
        text: 'Skip',
        onPressed: () {
          introKey.currentState?.animateScroll(2);
        },
      );
    } else {
      return const PlainText(text: '');
    }
  }
}
