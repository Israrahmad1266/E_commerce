import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:jatin_e_commerce/Controller/Networkig/Api_Services/category_api.dart';
import 'package:jatin_e_commerce/model/categorymodel.dart';
import 'package:jatin_e_commerce/Controller/device_location_controller.dart';
import 'package:jatin_e_commerce/View/Pages/user_profile_account.dart';

import 'package:jatin_e_commerce/commoncomponent.dart';

import 'package:jatin_e_commerce/model/favoriet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget title(
    String title,
    IconData icon,
    SizedBox sizedBox,
  ) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Icon(
          icon,
          color: const Color(0xff0a8523),
          size: 25,
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          title,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xff0a8523),
          )),
        ),
        sizedBox,
      ],
    );
  }

  final LocationController locationController = Get.put(LocationController());
  final List<ImageFavorite> images = [
    ImageFavorite('assets/images/phone1.jpg', false, 'Sony TV', false),
    ImageFavorite('assets/images/phone1.jpg', false, 'Phone', false),
    ImageFavorite('assets/images/phone1.jpg', false, 'Tablet', false),
  ];

  List valueIndex = ['Price', 'Stock', 'Itms'];
  String selectedValue = 'price';
  bool isLike = false;
  int _currentIndex = 0;
  final List<Widget> items = [
    Image.network(
        'https://img.freepik.com/free-psd/horizontal-banner-online-fashion-sale_23-2148585404.jpg?w=826&t=st=1698992952~exp=1698993552~hmac=9bfebed76896a5a24ddcc44b116d5da1831337835167e6b05655b4e68e7b7041',
        fit: BoxFit.fill),
    Image.network(
      'https://www.searchenginejournal.com/wp-content/uploads/2022/08/google-shopping-ads-6304dccb7a49e-sej-760x400.webp',
      fit: BoxFit.fill,
    ),
    Image.network(
        'https://img.freepik.com/free-psd/flat-design-shopping-mall-facebook-template_23-2150136181.jpg?w=826&t=st=1699002230~exp=1699002830~hmac=bff07da88e8b2c08d281470006f4a4e77a7b32b79641616cf2c44442f5927e47',
        fit: BoxFit.fill),
  ];

  var isChange = 0;
  String selectedBrand = 'Apple';
  bool dropDownShow = true;
  void showCategoryProduct() {
    showBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 1000,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Category',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xff0a8523),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              color: Color(0xff0a8523),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 40),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 30),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                color: Color(0xff0a8523),
                              ))),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: const BoxDecoration(
                color: Color(0xff0a8523),
              ),
              height: 30,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  Obx(
                    () => Text(
                      locationController.locationMassage.value,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isChange = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 40),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                      color: Color(0xff0a8523),
                    )),
                    backgroundColor:
                        isChange == 0 ? const Color(0xff0a8523) : Colors.white,
                  ),
                  child: Text(
                    'Electronics',
                    style: TextStyle(
                      color: isChange == 0
                          ? Colors.white
                          : const Color(0xff0a8523),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isChange = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 40),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                      color: Color(0xff0a8523),
                    )),
                    backgroundColor:
                        isChange == 1 ? const Color(0xff0a8523) : Colors.white,
                  ),
                  child: Text(
                    'Grocery',
                    style: TextStyle(
                      color: isChange == 1
                          ? Colors.white
                          : const Color(0xff0a8523),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 300,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return SizedBox(
                                height: 400,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Reset',
                                              style: GoogleFonts.lato(
                                                textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff0a8523),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Fillter',
                                              style: GoogleFonts.lato(
                                                textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff0a8523),
                                                ),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.grey,
                                                size: 20,
                                              )),
                                        ],
                                      ),
                                    ),
                                    const FilterDropDown(),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 19),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Brand",
                                                  style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xff0a8523),
                                                    ),
                                                  )),
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    dropDownShow =
                                                        !dropDownShow;
                                                  });
                                                },
                                                icon: dropDownShow == false
                                                    ? const Icon(
                                                        Icons
                                                            .arrow_drop_up_outlined,
                                                      )
                                                    : const Icon(
                                                        Icons
                                                            .arrow_drop_down_sharp,
                                                        color:
                                                            Color(0xff0a8523),
                                                      ),
                                              ),
                                            ],
                                          ),
                                          if (dropDownShow)
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                RadioListTile(
                                                    title: const Text('Apple'),
                                                    activeColor:
                                                        const Color(0xff0a8523),
                                                    value: 'first',
                                                    groupValue: selectedBrand,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedBrand = value!;
                                                      });
                                                    }),
                                                RadioListTile(
                                                    activeColor:
                                                        const Color(0xff0a8523),
                                                    title:
                                                        const Text('Sony Tv'),
                                                    value: 'secont',
                                                    groupValue: selectedBrand,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedBrand = value!;
                                                      });
                                                    }),
                                              ],
                                            ),
                                          Container(
                                            height: 0.25,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ),

                                    // child: Padding(
                                    //   padding: EdgeInsets.only(right: 200),
                                    //   child: SizedBox(
                                    //       height: 200,
                                    //       child: dropDownShow == false
                                    //           ? Column(
                                    //               children: [
                                    //                 RadioListTile(
                                    //                     title: Text('Apple'),
                                    //                     value: 1,
                                    //                     groupValue:
                                    //                         selectedBrand,
                                    //                     onChanged: (value) {}),
                                    //                 RadioListTile(
                                    //                     title: Text('Sony TV'),
                                    //                     value: 2,
                                    //                     groupValue:
                                    //                         selectedBrand,
                                    //                     onChanged: (value) {})
                                    //               ],
                                    //             )
                                    //           : null),
                                    // ),
                                  ],
                                ),
                              );
                            });
                          });
                    },
                    icon: const Icon(Icons.filter_list_alt))
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xff0a8523),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xff0a8523),
                        )),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Search Product',
                    hintStyle: const TextStyle(
                      color: Color(0xff0a8523),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (isChange == 0)
              Column(
                children: [
                  CarouselSlider(
                    items: [
                      for (int i = 0; i < items.length; i++)
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: items[i],
                            ),
                          ),
                        )
                    ],
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      autoPlay: true,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < items.length; i++)
                        Container(
                          height: 13,
                          width: 13,
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: _currentIndex == i
                                  ? Colors.green
                                  : Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(2, 3),
                                ),
                              ]),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Short by Category'),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showCategoryProduct();
                            });
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              color: Color(0xff0a8523),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/phone1.jpg'),
                                      radius: 30,
                                    ),
                                  ],
                                ),
                                Text('Phone'),
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Short by Category'),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              color: Color(0xff0a8523),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 206,
                    child: ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          height: 170,
                                          child: Card(
                                            child: Image.asset(
                                                images[index].imageList),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  images[index].isFavorite =
                                                      !images[index].isFavorite;
                                                });
                                              },
                                              icon: (images[index].isFavorite
                                                  ? const Icon(Icons.star)
                                                  : const Icon(Icons
                                                      .star_border_outlined)),
                                              color: images[index].isFavorite
                                                  ? Colors.yellow
                                                  : null,
                                            ),
                                            const SizedBox(
                                              width: 120,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  images[index].isLike =
                                                      !images[index].isLike;
                                                });
                                              },
                                              icon: (images[index].isLike
                                                  ? const Icon(Icons.favorite)
                                                  : const Icon(Icons
                                                      .favorite_border_outlined)),
                                              color: images[index].isLike
                                                  ? Colors.red
                                                  : null,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Text(images[index].text),
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('New Arrivals'),
                        TextButton(
                          onPressed: () {},
                          child: const Text('View All'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 206,
                    child: ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          height: 170,
                                          child: Card(
                                            child: Image.asset(
                                                images[index].imageList),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  images[index].isFavorite =
                                                      !images[index].isFavorite;
                                                });
                                              },
                                              icon: (images[index].isFavorite
                                                  ? const Icon(Icons.star)
                                                  : const Icon(Icons
                                                      .star_border_outlined)),
                                              color: images[index].isFavorite
                                                  ? Colors.yellow
                                                  : null,
                                            ),
                                            const Text('4.2'),
                                            const SizedBox(
                                              width: 100,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  images[index].isLike =
                                                      !images[index].isLike;
                                                });
                                              },
                                              icon: (images[index].isLike
                                                  ? const Icon(Icons.favorite)
                                                  : const Icon(Icons
                                                      .favorite_border_outlined)),
                                              color: images[index].isLike
                                                  ? Colors.red
                                                  : null,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Text(images[index].text),
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/paytm.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  const Text('data'),
                ],
              )
            else
              const Column(
                children: [Text('Tab0')],
              ),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     Card(
      //       margin: const EdgeInsets.symmetric(vertical: 40),
      //       child: Container(
      //         color: Colors.orange,
      //         height: 30,
      //         width: 350,
      //       ),
      //     ),
      //     Container(
      //       margin: const EdgeInsets.symmetric(horizontal: 20),
      //       height: 50,
      //       child: TabBar(
      //         indicatorColor: Colors.transparent,
      //         tabs: [
      //           SizedBox(
      //             height: 50,
      //             width: 250,
      //             child: OutlinedButton(
      //               style: OutlinedButton.styleFrom(
      //                   backgroundColor: Colors.blueGrey,
      //                   shape: const RoundedRectangleBorder()),
      //               onPressed: isChange ? null : onButtonPress,
      //               child: Tab(
      //                 text: 'Tab1',
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 50,
      //             width: 250,
      //             child: OutlinedButton(
      //               style: OutlinedButton.styleFrom(
      //                 shape: RoundedRectangleBorder(),
      //               ),
      //               onPressed: () {},
      //               child: Tab(
      //                 text: 'Tab2',
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       child: TabBarView(
      //         children: [
      //           Center(
      //             child: Text('TAb1'),
      //           ),
      //           Center(
      //             child: Text('TAb2'),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: InkWell(
              onTap: () {
                Get.to(ProfileAccount1());
              },
              child: CircleAvatar(
                radius: 30.0,
              ),
            ),
          )
        ],
      ),

      drawer: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(60)),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
          ),
          margin: const EdgeInsets.only(bottom: 150),
          child: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 300,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xffbadaca),
                      borderRadius: BorderRadius.only(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.list_sharp,
                                size: 40,
                                color: Color(0xff0a8523),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Jhonson',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff0a8523),
                            ),
                          ),
                        ),
                        Text(
                          '988834775873',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff0a8523),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    title(
                      'Home',
                      Icons.home,
                      const SizedBox(
                        height: 46,
                      ),
                    ),
                    title(
                      'Catalog',
                      Icons.category,
                      const SizedBox(
                        height: 46,
                      ),
                    ),
                    title(
                      'Category',
                      Icons.home,
                      const SizedBox(
                        height: 46,
                      ),
                    ),
                    title(
                      "Faq's",
                      Icons.home,
                      const SizedBox(
                        height: 46,
                      ),
                    ),
                    title(
                      'Wishlist',
                      Icons.favorite_border,
                      const SizedBox(
                        height: 46,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 90),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'About us',
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff0a8523),
                          )),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        label: Text(
                          'Logout',
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff0a8523),
                          )),
                        ),
                        icon: const Icon(
                          Icons.logout,
                          color: Color(0xff0a8523),
                        ),
                      ),
                    ],
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
