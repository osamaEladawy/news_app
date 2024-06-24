import 'package:flutter/material.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../layout/news_app/news_layout.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colors.dart';

class BoardingModel {
  late final String image;
  late final String body;

  BoardingModel({
    required this.image,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onboard1.jpg',
        body: 'An application to know the real real '
            'life events on the latest honest news'),
    BoardingModel(
        image: 'assets/images/onboard2.jpg',
        body:
            'A Locus where you get a chance to authenticate news to make a impact on society '),
    BoardingModel(
        image: 'assets/images/onboard3.jpg',
        body:
            'Once you click on the news, you will be taken to the original news page'),
  ];

  bool isLast = false;
  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value!) {
        navigateAndFinish(context, const NewsLayout());
      }
    });
  }

  String textButton = 'next';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfafafa),
      appBar: AppBar(
        backgroundColor: const Color(0xFFfafafa),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultTextButton(
                function: () {
                  submit();
                },
                text: 'SKIP',
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                      textButton = 'get started';
                    });
                  } else {
                    setState(() {
                      isLast = false;
                      textButton = 'next';
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: defaultColor,
                      dotColor: Colors.grey,
                      dotHeight: 15,
                      expansionFactor: 3,
                      dotWidth: 10,
                      spacing: 6),
                ),
                const Spacer(),
                defaultButten(
                  function: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.easeInOutCubicEmphasized,
                      );
                    }
                  },
                  text: textButton,
                  isUpperCase: true,
                  background: defaultColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: MediaQuery.of(context).size.height * .4,
            image: AssetImage(model.image),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            model.body,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      );
}
