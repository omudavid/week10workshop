import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2C3C),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2D2C3C),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(color: Color(0xFFFB6580)),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Expanded(
                      child: Image.asset(
                        'assets/bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Tune your Radio',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]);
                },
                itemCount: 4,
                onPageChanged: (page) {
                  setState(() {
                    currentIndex = page;
                  });
                  print('Index $currentIndex');
                },
              ),
            ),
          ),

          ///Indicators
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        pageController.animateToPage(currentIndex - 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'Previous',
                        style: TextStyle(color: Color(0xFFFB6580)),
                      )),

                  ///Build indicator
                  _buildIndicator(),
                  TextButton(
                      onPressed: () {
                        pageController.animateToPage(currentIndex + 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: Color(0xFFFB6580)),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    final list = <Widget>[];

    for (int i = 0; i < 4; i++) {
      list.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: i == currentIndex ? Color(0xFFFB6580) : Colors.white,
            shape: BoxShape.circle),
      ));
    }

    return Row(
      children: list,
    );
  }
}
