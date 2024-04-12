import 'package:ayana_test/models/card_info_model.dart';
import 'package:ayana_test/utils/my_color.dart';
import 'package:ayana_test/widget/menu_service_item.dart';
import 'package:ayana_test/widget/parallax_video_card.dart';
import 'package:ayana_test/widget/tab_menu_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeVideoPage extends StatefulWidget {
  const HomeVideoPage({super.key});

  @override
  State<HomeVideoPage> createState() => _HomeVideoPageState();
}

class _HomeVideoPageState extends State<HomeVideoPage> {
  PageController controller = PageController();

  @override
  void initState() {
    controller = PageController(viewportFraction: 0.7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 180, 145),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                floating: true,
                centerTitle: true,
                forceElevated: true,
                pinned: true,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                title: Text(
                  "KOPIANAN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: const Color(0xfff5eeeb),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: 5,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 16 / 13),
                    itemBuilder: (context, index) {
                      return MenuServiceItem(
                        image: menu[index].icon,
                        label: menu[index].label,
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        "Get Inspired",
                        style: TextStyle(
                          fontSize: 24,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Based on what's trending right now",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: TabMenuWidget()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: CarouselSlider.builder(
                      options: CarouselOptions(
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        enlargeFactor: 0.55,
                        viewportFraction: 0.7,
                      ),
                      itemCount: imgList.length,
                      itemBuilder: (context, index, realIndex) {
                        return ParallaxVideoCard(
                          info: imgList[index],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<({String label, String icon})> menu = [
    (label: "Dining", icon: "assets/icons/dining.png"),
    (label: "Spa", icon: "assets/icons/spa.png"),
    (label: "Experiences", icon: "assets/icons/experiences.png"),
    (label: "Tram", icon: "assets/icons/tram.png"),
    (label: "Room Service", icon: "assets/icons/room_service.png"),
  ];

  final List<CardInfoModel> imgList = [
    CardInfoModel(
      description:
          "Float, move or excercise your way through a series of hydromassages station",
      imageAsset: 'assets/videos/video1.mp4',
      title: "Thalassotherapy Pool",
    ),
    CardInfoModel(
        description:
            "Cocktails anidst 180 degrees of crashing waves, jagged limestone cliffs, and the best sunset in bali",
        imageAsset: 'assets/videos/video2.mp4',
        title: "Rock Bar"),
    CardInfoModel(
        description:
            "Sun salutation pair with the suit sound of the morning birds and crashing waves",
        imageAsset: 'assets/videos/video3.mp4',
        title: "Sunrise Yoga"),
    CardInfoModel(
        description:
            "Spend the day in our private, white sand beach exclusive to guests of AYANA Estate",
        imageAsset: 'assets/videos/video4.mp4',
        title: "Kubu Beach"),
    CardInfoModel(
        description: "Misticle night of dinner and dance at Kampoeng Bali",
        imageAsset: 'assets/videos/video5.mp4',
        title: "Dinner and Show"),
  ];
}
