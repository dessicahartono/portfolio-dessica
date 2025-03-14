import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../model/constants.dart';
import '../model/buttons.dart';
import '../model/colors.dart';
import '../model/helper_class.dart';
import '../model/app_drawer.dart';
import '../model/assets.dart';
import '../widgets/animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> socialButtons = [
    AppAssets.facebook,
    AppAssets.twitter,
    AppAssets.linkedIn,
    AppAssets.insta,
    AppAssets.github,
  ];

  int? socialBI;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      drawer: const AppDrawer(),
      body: HelperClass(
        mobile: Column(
          children: [
            buildHomePersonalInfo(size),
            Constants.sizedBox(height: 25.0),
            const ProfileAnimation(),
          ],
        ),
        tablet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: buildHomePersonalInfo(size)),
            const ProfileAnimation(),
          ],
        ),
        desktop: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: buildHomePersonalInfo(size)),
            const ProfileAnimation(),
          ],
        ),
        paddingWidth: size.width * 0.1,
        bgColor: Colors.transparent,
      ),
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: const Text(
            'Hey, It\'s Me!',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: kBlack,
            ),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: const Text(
            'Dessica Suhaedi Hartono',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 40,
              color: kBlack,
            ),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Row(
            children: [
              const Text(
                'I\'m a ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: kDarkGrey,
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Freelancer',
                    textStyle: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 187, 22, 22),
                    ),
                  ),
                  TyperAnimatedText(
                    'Content Writer',
                    textStyle: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 187, 22, 22),
                    ),
                  ),
                  TyperAnimatedText(
                    'Crypto Trader',
                    textStyle: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 187, 22, 22),
                    ),
                  ),
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRightBig(
          duration: const Duration(milliseconds: 1800),
          child: const Text(
            'An emphatetic and dedicated individual with nearly five years of experience '
            'in the Customer Services Industry, specializing in understanding customer needs, '
            'building positive relationships, and delivering exceptional service experiences. '
            'My diverse experience has honed my communication, teamwork and multi-tasking skills '
            'to be able to work under pressure during peak hours and resolve conflict professionally, '
            'making me a valuable asset to any team. '
            'Committed to adapt to changes and eager to learn and improve to achieve the highest quality of work, '
            'ensuring a comfortable environment for both customer and colleagues. ',
            style: TextStyle(
              fontFamily: 'Lora',
              color: kBlack,
            ),
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: socialButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, child) =>
                  Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      socialBI = value ? index : null;
                    });
                  },
                  borderRadius: BorderRadius.circular(50.0),
                  hoverColor: kLightGrey,
                  splashColor: kDarkGrey,
                  child: buildSocialButton(
                    asset: socialButtons[index],
                    hover: socialBI == index,
                  ),
                );
              },
            ),
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
            onTap: () {},
            buttonName: 'Download Resume Here',
            pressed: () {},
          ),
        ),
      ],
    );
  }

  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: kDarkGrey, width: 2.0),
        color: kLightGrey,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? kLightGrey : kDarkGrey,
      ),
    );
  }
}
