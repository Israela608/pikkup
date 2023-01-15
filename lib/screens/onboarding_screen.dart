import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/clickable_texts/clickable_text.dart';
import 'package:pikkup/components/texts/description_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/header_text_blue.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/screens/welcome_screen.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  static const String id = 'onboarding_screen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  late int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    const pageDecoration = PageDecoration(
      pageColor: app_colors.background,
      imagePadding: EdgeInsets.zero,
      imageFlex: 2,
      contentMargin: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(top: 24.0, bottom: 16.0),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: app_colors.background,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              Expanded(
                child: IntroductionScreen(
                  key: introKey,
                  globalBackgroundColor: app_colors.background,
                  pages: [
                    PageViewModel(
                      titleWidget: firstTitle,
                      bodyWidget: const DescriptionText(
                        text:
                            'Get your parcels delivered with minimal effort anywhere you are.',
                      ),
                      image: _buildImage('onboarding_1.png'),
                      decoration: pageDecoration,
                    ),
                    PageViewModel(
                      titleWidget: secondTitle,
                      bodyWidget: const DescriptionText(
                        text:
                            'Track your parcels live and receive regular updates on your shipment',
                      ),
                      image: _buildImage('onboarding_2.png'),
                      decoration: pageDecoration,
                    ),
                    PageViewModel(
                      titleWidget: thirdTitle,
                      bodyWidget: const DescriptionText(
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
                  dotsDecorator: const DotsDecorator(
                    size: Size(12.0, 5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    color: Color(0xFFBDBDBD),
                    activeColor: app_colors.primaryBlue,
                    activeSize: Size(20.0, 5.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              wideButton(context: context),
              const SizedBox(height: 20),
              Container(
                  alignment: Alignment.centerRight,
                  height: 50,
                  child: skipText()),
              const SizedBox(height: 20),
            ],
          ),
        ),
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
              child: HeaderTextBlue(text: 'Fast delivery '),
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
              child: HeaderTextBlue(text: 'Tracking'),
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
              child: HeaderTextBlue(text: 'Service '),
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
