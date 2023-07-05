import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class OnboardPage extends StatefulWidget {

  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {

  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: demo_data.length,
                        onPageChanged: (index) {
                          setState(() {
                            _pageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) => OnboardContent(
                            image: demo_data[index].image,
                            title:demo_data[index].title,
                            description: demo_data[index].description
                        ),
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          demo_data.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(isActive: index == _pageIndex),
                          )),
                      const Spacer(),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            if(_pageController.page == 2.0) {
                              Modular.to.navigate("/auth/sign-in");
                            }
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          },
                          style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.deepPurple,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ),
      );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12: 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description
  });
}

final List<Onboard> demo_data = [
  Onboard(
      image: "lib/assets/images/onboard/task-forge-logo.png",
      title: "onboard_welcome".i18n(),
      description: "onboard_welcome_description".i18n()
  ),
  Onboard(
      image: "lib/assets/images/onboard/process.png",
      title: "onboard_welcome_task_management".i18n(),
      description: "onboard_welcome_task_management_description".i18n()
  ),
  Onboard(
      image: "lib/assets/images/onboard/blackboard.png",
      title: "onboard_welcome_agile".i18n(),
      description: "onboard_welcome_agile_description".i18n()
  ),

];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(image, width: 200.0,height: 200.0,),
          const Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              color: Colors.white
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}