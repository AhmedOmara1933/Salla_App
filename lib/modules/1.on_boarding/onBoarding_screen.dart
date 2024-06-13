import 'package:flutter/material.dart';
import 'package:shop_app/shared/function/function.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/1.onBoarding_model.dart';
import '../2.login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> datamodel = [
    OnBoardingModel(
        image: 'images/1.jpg',
        text1: 'PURCHASE ONLINE',
        text2: 'Pick up your order at the collection time \n'
            'on your receipt directly from the shop'),
    OnBoardingModel(
        image: 'images/2.jpg',
        text1: 'CHOOSE AND CHECKOUT',
        text2: 'Order your mystery made of food A meal\n'
            ' on your plate.A gesture for the planet '),
    OnBoardingModel(
        image: 'images/3.jpg',
        text1: 'GET YOUR ORDER',
        text2: 'No need to follow up for your own money.\n'
            'We process timely and smooth refunds'),
  ];
  var controller = PageController();
  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateTo(context, const ShopLoginScreen(), true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: Color(0xffd14847),
                borderRadius: BorderRadius.circular(30.0)),
            child: TextButton(
                onPressed: () {
                  submit();
                },
                child: Text(
                  'SKIP',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == datamodel.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage(
                          datamodel[index].image,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      datamodel[index].text1,
                      style: TextStyle(
                          color: Color(0xff4245b4),
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 75.0),
                      child: Text(
                        datamodel[index].text2,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[500]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                itemCount: datamodel.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: controller, // PageController
                  count: datamodel.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xffd14847),
                      dotWidth: 25.0,
                      spacing: 15.0,
                      dotHeight: 10.0),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color(0xffd14847),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                      onTap: () {
                        if (isLast == true) {
                          submit();
                        } else {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.fastEaseInToSlowEaseOut);
                        }
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
      ),
    );
  }
}
