import 'package:flutter/material.dart';
import 'package:allhelps/navigation.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEDF4FF),
              Color(0xFFc8dcf8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            Header(),
            Column(
              children: [
                SizedBox(height: 80), // TODO: Replace this with Search Bar
                //SearchBar(), // renderd by the helps team, we will use the same search bar
                HelpsRow(),
                SizedBox(
                  height: 10,
                ),
                GuideButton(),
                SizedBox(
                  height: 80,
                ),
                EmergencyRow(),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for header
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Header
      Container(
        height: 213,
        decoration: const BoxDecoration(
            color: Color(0xFF6359CA),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26))),
        alignment: Alignment.center,
      ),
      // Image
      Positioned(
        top: 0,
        left: 20,
        child: Center(
          child: Image.asset(
            'assets/images/header_image.png',
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ]);
  }
}

// Widget for Helps Row
class HelpsRow extends StatelessWidget {
  const HelpsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "We are here to help",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          )),
      const SizedBox(height: 10),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HelpsButton(
                  color1: const Color(0xFFE57701),
                  color2: const Color(0xFFFFB15E),
                  text: "Searching for Food",
                  imageURL: "assets/images/helps_food_icon.png",
                  onTap: () {
                    Navigator.pushNamed(context, '/helps');
                  }),
              HelpsButton(
                  color1: const Color(0xFF50714A),
                  color2: const Color(0xFF5BB139),
                  text: "Looking for Shelter",
                  imageURL: "assets/images/helps_shelter_icon.png",
                  onTap: () {
                    Navigator.pushNamed(context, '/helps');
                  }),
              HelpsButton(
                  color1: const Color(0xFF4F77C0),
                  color2: const Color(0xFF86A8FE),
                  text: "Get Medical Relief",
                  imageURL: "assets/images/helps_medicine_icon.png",
                  onTap: () {
                    Navigator.pushNamed(context, '/helps');
                  })
            ],
          ))
    ]);
  }
}

// Widget for Helps Button
class HelpsButton extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String text;
  final String imageURL;
  final VoidCallback? onTap; // Add this line

  const HelpsButton({
    super.key,
    required this.color1,
    required this.color2,
    required this.text,
    required this.imageURL,
    this.onTap, // And this line
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                color1,
                color2,
              ],
              center: Alignment.bottomRight,
              radius: 1.2,
            ),
          ),
          // Add a ripple effect when button is clicked
          child: InkWell(
            onTap: onTap,
            splashColor: color2.withOpacity(1),
            highlightColor: color2.withOpacity(.5),
            child: SizedBox(
              width: 116,
              height: 144,
              child: Stack(
                children: [
                  // Icon
                  Positioned(
                    top: 12,
                    left: 12,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: Image.asset(
                        imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Text caption
                  Positioned(
                    bottom: 20,
                    left: 12,
                    right: 12,
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget for Emergency Row
class EmergencyRow extends StatelessWidget {
  const EmergencyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Need Emergency Help?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EmergencyButton(
                    title: "24/7 Hotline",
                    text: "Reach out anytime for support",
                    imageURL: "assets/images/24-hours-line.png",
                    onTap: () {
                      Navigator.pushNamed(context, '/helps');
                    }),
                EmergencyButton(
                    title: "Local outreach team",
                    text: "Connect with your local agency",
                    imageURL: "assets/images/phone-fill.png",
                    onTap: () {
                      Navigator.pushNamed(context, '/helps');
                    }),
              ],
            ))
      ],
    );
  }
}

// Widget for Emergency Buttons
class EmergencyButton extends StatelessWidget {
  final String title;
  final String text;
  final String imageURL;
  final VoidCallback? onTap; // Add this line

  const EmergencyButton({
    super.key,
    required this.title,
    required this.text,
    required this.imageURL,
    this.onTap, // And this line
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Material(
          child: Ink(
            color: Colors.white,
            child: InkWell(
              onTap: onTap,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14.0), // Uniform radius
                ),
                child: SizedBox(
                  width: 180,
                  height: 120,
                  child: Stack(
                    children: [
                      // Icon
                      Positioned(
                        top: 12,
                        left: 12,
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            imageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Text caption
                      Positioned(
                        bottom: 40,
                        left: 12,
                        right: 12,
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 12,
                        right: 12,
                        child: Text(
                          text,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class GuideButton extends StatelessWidget {
  const GuideButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Material(
          child: Ink(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/helps');
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14.0), // Uniform radius
                ),
                child: SizedBox(
                  width: 365,
                  height: 80,
                  child: Stack(
                    children: [
                      // Icon
                      Positioned(
                        top: 20,
                        right: 12,
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset(
                            "assets/images/arrow-right-s-line.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Text caption
                      const Positioned(
                        top: 20,
                        left: 12,
                        right: 12,
                        child: Text(
                          "Guide you to the right services faster",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 20,
                        left: 12,
                        right: 12,
                        child: Text(
                          "Please choose your current situation",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
