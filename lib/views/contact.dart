import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../model/constants.dart';
import '../model/buttons.dart';
import '../model/colors.dart';
import '../model/app_drawer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get in Touch'),
      ),
      drawer: const AppDrawer(),
      backgroundColor: kWhite,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildContactText(),
            Constants.sizedBox(height: 40.0),
            buildTextField(hintText: 'Your Name'),
            Constants.sizedBox(height: 20.0),
            buildTextField(hintText: 'Your Email'),
            Constants.sizedBox(height: 20.0),
            buildTextField(hintText: 'Your Phone Number'),
            Constants.sizedBox(height: 20.0),
            buildTextField(hintText: 'Type Your Message Here ! ', maxLines: 5),
            Constants.sizedBox(height: 40.0),
            AppButtons.buildMaterialButton(
              buttonName: 'Send Message',
              onTap: () {},
              pressed: () {},
            ),
            Constants.sizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({required String hintText, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: kLightGrey,
      ),
    );
  }

  Widget buildContactText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: const TextSpan(
          text: "Let's ",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 30.0,
            color: kBlack,
          ),
          children: [
            TextSpan(
              text: "Connect!",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30,
                color: kDarkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
