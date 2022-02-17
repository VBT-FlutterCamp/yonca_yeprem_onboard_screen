import 'package:flutter/material.dart';
import 'package:onboard/core/constants/padding_constants.dart';
import 'package:onboard/core/constants/radius_constants.dart';
import 'package:onboard/feature/login/view/login_view.dart';
import 'package:onboard/feature/onboard/model/onboard_model.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  PageController? _controller;
  int _initialPage = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: _initialPage);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: _buildPageView(context),
    ));
  }

  PageView _buildPageView(BuildContext context) {
    return PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: onboardItems.length,
        itemBuilder: (_, i) {
          return _buildPageContent(i, context);
        });
  }

  Column _buildPageContent(int i, BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(onboardItems[i].image)),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: RadiusConst.radius20,
                topRight: RadiusConst.radius20,
              )),
          child: Padding(
            padding: PaddingConst.pad15,
            child: Column(
              children: [
                _buildIndicator(i),
                _buildTitle(i, context),
                _buildDescription(i, context),
                _buildNavigationButtons(context, i),
              ],
            ),
          ),
        )),
      ],
    );
  }

  Expanded _buildIndicator(int i) {
    return Expanded(
      flex: 1,
      child: Container(padding: PaddingConst.pad20, child: _indicatorWidget(i)),
    );
  }

  Expanded _buildTitle(int i, BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: PaddingConst.pad20,
        child: Text(onboardItems[i].title,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Expanded _buildDescription(int i, BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: PaddingConst.pad20,
        child: Text(
          onboardItems[i].description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Expanded _buildNavigationButtons(BuildContext context, int i) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: PaddingConst.padHor20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginView()));
                },
                child: const Text("SKIP"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: i == onboardItems.length - 1
                        ? Colors.green
                        : Theme.of(context).colorScheme.primary),
                onPressed: () {
                  if (i == onboardItems.length - 1) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  }

                  _controller?.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                  );
                },
                child: Text(i == onboardItems.length - 1 ? "DONE" : "NEXT"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _indicatorWidget(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          onboardItems.length,
          (index) => Container(
                margin: PaddingConst.padHor5,
                child: CircleAvatar(
                  radius: currentIndex == index ? 7 : 5,
                  backgroundColor: currentIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
              )),
    );
  }
}