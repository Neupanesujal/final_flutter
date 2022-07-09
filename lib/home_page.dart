import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'dart:math';
import 'package:y/api_places_page.dart';
import 'package:y/productdetail_page.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  getPlaces() async {
    var response =
        await http.get(Uri.parse("http://mark.bslmeiyu.com/api/getplaces"));
    if (response.statusCode == 200) {
      return response.body;
    } 
    else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 236, 236),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Home'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlay: false,
                  ),
                  items: imgList
                      .map((anystring) => ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(
                                  anystring.toString(),
                                  // AssetImage,
                                  width: 400,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              FutureBuilder(
                  future: getPlaces(),
                  builder: ((context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('No Connection');

                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();

                      case ConnectionState.done:
                        var decode = jsonDecode(snapshot.data.toString());
                        List<Places> placeList = [];
                        decode
                            .forEach((e) => placeList.add(Places.fromJson(e)));

                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: placeList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => itemPage(
                                                  currentPlace:
                                                      placeList[index],
                                                )));
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.10),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.network(
                                                    'http://mark.bslmeiyu.com/uploads/${placeList[index].img.toString()}',
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                                  Spacer(),
                                                  Column(
                                                    children: [
                                                      Text(placeList[index]
                                                          .name
                                                          .toString()),
                                                      Text(placeList[index]
                                                          .price
                                                          .toString()),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  // IconButton(
                                                  //     onPressed: () {
                                                  //       Navigator.push(
                                                  //         context,
                                                  //         MaterialPageRoute(builder: (context) => itemPage()),
                                                  //       );
                                                  //     },
                                                  //     icon: Icon( Icons.shopping_cart)),
                                                  // Icon(Icons.shopping_cart)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      default:
                        return Text('Some Error Occurred!');
                    }
                  }))
            ],
          ),
        ),
      ),
      
      
      // bottomNavigationBar: BottomNavigationBar(

      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.card_travel_outlined),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.money_off_csred_sharp),
      //       label: 'offers',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.man),
      //       label: 'profile',
      //     ),
      //   ],
      // ),
    );
  }
}
