import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/roomchat.dart';
import 'package:flutter_onboarding/ui/screens/calendar/calendar1.dart';
import 'package:flutter_onboarding/ui/screens/calendar/screens/calendar.dart';
import 'package:flutter_onboarding/ui/screens/detail_page.dart';
import 'package:flutter_onboarding/Informasi/information.dart';
import 'package:flutter_onboarding/ui/screens/news/news.dart';
import 'package:flutter_onboarding/ui/screens/profile_page.dart';
import 'package:flutter_onboarding/ui/screens/weather/weather.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'widgets/card.dart';
import 'calendar/screens/calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        const Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'Cari sesuatu...',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            LayoutBuilder(
              // Use the `MediaQuery` to get the screen size
              builder: (context, constraints) {
                // Calculate the size of the cards based on the screen size
                final cardSize = constraints.maxWidth / 2.09;
                return Column(
                  // Use a column layout to arrange the cards in two rows

                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      // Use a row layout to arrange the cards in the first row
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Create the first card
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              weather_page(),
                              transition: Transition.rightToLeftWithFade,
                            );
                          },
                          child: card(
                            cardSize: cardSize,
                            name: 'Cuaca',
                            image: 'assets/images/weather.png',
                          ),
                        ),
                        // Create the second card
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              Calendar(),
                              transition: Transition.rightToLeftWithFade,
                            );
                          },
                          child: card(
                            cardSize: cardSize,
                            name: 'Kalender Tanam',
                            image: 'assets/images/calendar.png',
                          ),
                        )
                      ],
                    ),
                    Row(
                      // Use a row layout to arrange the cards in the second row
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Create the third card
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              news(),
                              transition: Transition.rightToLeftWithFade,
                            );
                          },
                          child: card(
                            cardSize: cardSize,
                            name: 'Artikel',
                            image: 'assets/images/artikel.png',
                          ),
                        ),
                        // Create the fourth card
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              information(),
                              transition: Transition.rightToLeftWithFade,
                            );
                          },
                          child: card(
                            cardSize: cardSize,
                            name: 'Informasi',
                            image: 'assets/images/informasi.png',
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text(
                'Rekomendasi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: _plantList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                  plantId: _plantList[index].plantId),
                              type: PageTransitionType.bottomToTop),
                        );
                      },
                      child: PlantWidget(
                        index: index,
                        plantList: _plantList,
                        isCheckout: false,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
