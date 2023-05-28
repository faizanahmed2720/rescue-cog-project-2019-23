import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/Theme/colors.dart';

class TextFormatWidget extends StatelessWidget {
  const TextFormatWidget({
    super.key,
    required this.disease,
    required this.image,
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.heading5,
    required this.paragraph1,
    required this.paragraph2,
    required this.paragraph3,
    required this.paragraph4,
    required this.paragraph5,
  });
  final String disease;
  final String image;
  final String heading1;
  final String heading2;
  final String heading3;
  final String heading4;
  final String heading5;

  final String paragraph1;
  final String paragraph2;
  final String paragraph3;
  final String paragraph4;
  final String paragraph5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white) ),
          backgroundColor: primaryColor,
          title: Text(disease),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                height: 200,
                width: 400,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading1,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      paragraph1,
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      heading2,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      paragraph2,
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      heading3,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      paragraph3,
                    ).tr(),
                    Text(
                      heading4,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      paragraph4,
                    ).tr(),
                    Text(
                      heading5,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      paragraph5,
                    ).tr(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
