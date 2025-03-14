import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../model/constants.dart';
import '../model/buttons.dart';
import '../model/colors.dart';
import '../model/helper_class.dart';
import '../model/app_drawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      drawer: const AppDrawer(),
      body: HelperClass(
        mobile: Column(
          children: [
            buildAboutMeContents(),
            Constants.sizedBox(height: 30.0),
            buildProfileImage(),
          ],
        ),
        tablet: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildProfileImage(),
            Constants.sizedBox(width: 25.0),
            Expanded(child: buildAboutMeContents()),
          ],
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildProfileImage(),
            Constants.sizedBox(width: 25.0),
            Expanded(child: buildAboutMeContents()),
          ],
        ),
        paddingWidth: size.width * 0.1,
        bgColor: kLightGrey,
      ),
    );
  }

  Widget buildProfileImage() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Container(
        height: 450,
        width: 400,
        decoration: BoxDecoration(
          color: kDarkGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/fotoprofil.jpg',
            fit: BoxFit.cover,
            width: 400,
            height: 450,
          ),
        ),
      ),
    );
  }

  Widget buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: const TextSpan(
              text: 'Get to Know ',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 50.0,
                color: kBlack,
              ),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 50,
                    color: kDarkGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 12.0),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isExpanded ? 300 : 150,
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeftBig(
                    duration: const Duration(milliseconds: 1600),
                    child: const Text(
                      'In my life I always obsessed with one thing, that is growth. '
                      'I love growth and progress in every possible manifestation. '
                      'I love growing my career, I love growing as a person, '
                      'then I wanna work and living in a place that represent growth.',
                      style: TextStyle(
                        fontFamily: 'Lora',
                        color: kBlack,
                      ),
                    ),
                  ),
                  Constants.sizedBox(height: 10.0),
                  FadeInLeftBig(
                    duration: const Duration(milliseconds: 1600),
                    child: const Text(
                      'I was running a small business in the Food & Beverages Industry in Makassar. '
                      'I was responsible for providing excellent customer services to ensure customer satisfaction. '
                      'During my time here, I used to handle the fast-paced working environment, handling the peak hour '
                      'and multitasking to maintain the tenant operations. '
                      'I also developed strong communication skills that allowed me to build positive relationships with customers and colleagues. '
                      'These experiences have strengthened my ability to serve customers effectively and work under pressure.',
                      style: TextStyle(
                        fontFamily: 'Lora',
                        color: kBlack,
                      ),
                    ),
                  ),
                  Constants.sizedBox(height: 20.0),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1800),
                    child: AppButtons.buildMaterialButton(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      buttonName: _isExpanded ? 'Read Less' : 'Read More',
                      pressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
