import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as StoreModel;

    return Scaffold(
      backgroundColor: const Color(0xFF0D1325),
      body: Container(
        //graident
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0D1325),
              Color.fromARGB(255, 43, 51, 80),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 18, left: 32, right: 32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    // rounded image
                    Container(
                      height: 42,
                      width: 42,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://avatars.githubusercontent.com/u/41837037?v=4"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
                  height: 180,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/details-bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        args.name,
                        style: GoogleFonts.robotoMono(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image.asset('assets/walmart-outline-logo.png'),
                      const SizedBox(height: 10),
                      Text(
                        '${args.points.toString()} points',
                        style: GoogleFonts.robotoMono(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${args.perksAvailable} perks available',
                        style: GoogleFonts.robotoMono(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // vertically scrolling pills list  - all, freebies, discounts, special
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 34, 59, 136),
                        ),
                        child: const Center(
                          child: Text(
                            'All',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 192, 201, 240),
                        ),
                        child: const Center(
                          child: Text(
                            'Freebies',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 192, 201, 240),
                        ),
                        child: const Center(
                          child: Text(
                            'Discounts',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 192, 201, 240),
                        ),
                        child: const Center(
                          child: Text(
                            'Special',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // perks grid view 2x2 with icon, title and description
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowOnScroll(),
                    child: GridView.custom(
                      gridDelegate: SliverWovenGridDelegate.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        pattern: [
                          const WovenGridTile(1),
                          const WovenGridTile(
                            6 / 8,
                            crossAxisRatio: 1,
                            alignment: AlignmentDirectional.centerEnd,
                          ),
                        ],
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: perksData.length,
                        (context, index) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            gradient: perksData[index].locked
                                ? null
                                : const LinearGradient(
                                    begin: Alignment(0.00, -1.00),
                                    end: Alignment(0, 1),
                                    colors: [
                                      Color(0xFF212C5D),
                                      Color(0xFF161F38)
                                    ],
                                  ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: perksData[index].locked
                                ? const Color.fromRGBO(96, 96, 96, 1)
                                : const Color.fromRGBO(128, 99, 190, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(perksData[index].iconUrl),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: perksData[index].locked
                                          ? const Color.fromRGBO(96, 96, 96, 1)
                                          : Color(0xFF161F38),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/green_coin.png',
                                          height: 18,
                                          width: 18,
                                        ),
                                        Text(
                                          args.points.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                perksData[index].title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                perksData[index].description,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Perk {
  final String title;
  final String description;
  final String iconUrl;
  final int points;
  final bool locked;

  Perk(
      {required this.title,
      required this.description,
      required this.iconUrl,
      required this.points,
      this.locked = false});
}

List<Perk> perksData = [
  Perk(
    title: 'Free Item',
    description:
        'Get any item for free upto Rs. 250 next time you visit a Walmart store',
    iconUrl: 'assets/gift.png',
    points: 750,
  ),
  Perk(
    title: 'Queue Priority',
    description: 'Skip the queue and get to the front at your next checkout',
    iconUrl: 'assets/people.png',
    points: 500,
  ),
  Perk(
    title: '25% Off',
    description: 'Get 25% off upto Rs. 250 on your next purchase',
    iconUrl: 'assets/discount.png',
    points: 250,
  ),
  Perk(
    title: 'Free Item',
    description:
        'Get any item for free upto Rs. 250 next time you visit a Walmart store',
    iconUrl: 'assets/lock.png',
    points: 1000,
    locked: true,
  ),
  Perk(
    title: 'Meet the CEO',
    description: 'Get a chance to meet the CEO of Walmart next time you visit',
    iconUrl: 'assets/lock.png',
    points: 10000,
    locked: true,
  ),
];
