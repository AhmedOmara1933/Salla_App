import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/1.onBoarding_model.dart';

class OnBoarding extends StatelessWidget {
  OnBoardingModel? onBoarding;
  var controller = PageController();

  OnBoarding({super.key, required this.onBoarding, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(
                onBoarding!.image,
              ),
            ),
          ),
          Text(
            onBoarding!.text1,
            style: TextStyle(fontSize: 30.0.sp, fontWeight: FontWeight.w700),
          ),
           SizedBox(
            height: 40.0.h,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 75.0),
            child: Text(
              onBoarding!.text2,
              style: TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: controller, // PageController
                count: 3,
                effect: ExpandingDotsEffect(
                    activeDotColor: Colors.orange.shade900,
                    dotWidth: 12.0.w,
                    dotHeight: 12.0.h),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.orange.shade900),
                child: InkWell(
                    onTap: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
