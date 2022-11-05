import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/models/homepagemodel.dart' as model;

import 'package:ecommerce/pages/cart.dart';

import 'package:ecommerce/pages/category.dart';
import 'package:ecommerce/pages/favorite.dart';
import 'package:ecommerce/pages/notification.dart';
import 'package:ecommerce/pages/detailspage.dart';
import 'package:ecommerce/pages/productcategorybased.dart';
import 'package:ecommerce/pages/profile.dart';
import 'package:ecommerce/pages/search.dart';
import 'package:ecommerce/pages/serach.dart';
import 'package:ecommerce/webservices/get.dart';
import 'package:ecommerce/widgets/itemcard.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

import '../models/categorymodels.dart' as categorymodels;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

Color _color = Color.fromARGB(255, 161, 161, 161);

var add = 'Shop no.2, Crysal shopping arcade';

class _HomeState extends State<Home> {
  bool isLoading = false;
  var getproducts;

//trupesh
  homepage() async {
    var res = await HttpService.getHomePage();
    setState(() {
      getproducts = model.HomePageModel.fromJson(res);
      isLoading = false;
      print('HomePage Data: ' + getproducts.message.toString());
    });
    return getproducts;
  }

//get category
  // int? id;
  // var categorydetails;
  // categoryDetails(id) async {
  //   var res = await HttpService.getProductDetails(id);
  //   setState(() {
  //     categorydetails = categorymodels.Categorymodels.fromJson(res);
  //     isLoading = false;
  //   });
  //   return categorydetails;
  // }

  @override
  void initState() {
    homepage();
  }

  @override
  Widget build(BuildContext context) {
    IconButton AddtoFav(bool isfav) {
      return IconButton(
          onPressed: () {
            if (isfav != true) {
              setState(() {
                isfav = true;
              });
            } else {
              isfav = false;
            }
          },
          icon: isfav == false
              ? Icon(
                  Icons.favorite_border_rounded,
                  color: _color,
                  size: 20,
                )
              : const Icon(Icons.favorite, color: Colors.pink, size: 20));
    }

    List navpange = [Home(), Category(), Searchpage(), Favorite(), Profile()];

    List cpn = [
      'assests/images/cpbanner.png',
      'assests/images/cpbanner.png',
      'assests/images/cpbanner.png'
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              //appbar
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        // Apidatas();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: ((context) => Mycart())));
                      },
                      child: Image.asset(
                        'assests/images/loc.png',
                        height: 25,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Mumbai, Maharshtra',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          add.length > 30 ? '${add.substring(0, 30)}...' : add),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Mycart())));
                        },
                        child: Image.asset(
                          'assests/images/carticn.png',
                          height: 25,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                        onTap: () {
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     PageRouteBuilder(
                          //         pageBuilder: (context, a, b) => Mycart()),
                          //     (route) => false);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => MyNoti())));
                        },
                        child: Image.asset(
                          'assests/images/bellicn.png',
                          height: 30,
                        )),
                  )
                ],
              ),

              //Search Bar
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => MYSerachpage())));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                      )
                    ],
                    border:
                        Border.all(color: Color.fromARGB(90, 112, 112, 112)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          'assests/images/searchicn.png',
                          height: 25,
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const MYSerachpage())));
                        }),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: const Text(
                              'Search Product',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )),
                      )
                    ],
                  ),
                ),
              ),

              //category
              Container(
                constraints: const BoxConstraints(minHeight: 0, maxHeight: 200),
                margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
                height: 130,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getproducts != null
                        ? getproducts.categoryArray.length
                        : 5,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          print(getproducts.categoryArray[index].id);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Categorypage(id: getproducts.categoryArray[index].id,);
                          }));
                        },
                        child: Column(
                          children: [
                            InkWell(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  // color: const Color.fromRGBO(0, 155, 55, 0.50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: getproducts != null
                                      ? Image.network(
                                          getproducts
                                              .categoryArray[index].imagePath
                                              .toString(),
                                          height: 40,
                                          fit: BoxFit.fill,
                                        )
                                      : const SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: CircularProgressIndicator(),
                                        ),
                                ),
                              ),
                            ),
                            Container(
                                height: 50,
                                constraints: const BoxConstraints(
                                    minHeight: 0, maxHeight: 100, maxWidth: 80),
                                margin: const EdgeInsets.only(top: 5),
                                child: getproducts != null
                                    ? AutoSizeText(
                                        getproducts.categoryArray[index].name,
                                        style: const TextStyle(fontSize: 15),
                                      )
                                    : null)
                          ],
                        ),
                      );
                    })),
              ),
              //carousel
              CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: ((context, index, realIndex) {
                    return getproducts != null
                        ? Image.network(
                            getproducts.sliderArray[index].imagePath.toString(),
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          )
                        : const Center(
                            child: SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator()),
                          );
                  }),
                  options: CarouselOptions(
                    height: 130,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    enlargeCenterPage: true,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (3 / 100) * MediaQuery.of(context).size.width),
                    child: const Text(
                      'Top Selling Itmes',
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          right: (3 / 100) * MediaQuery.of(context).size.width),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Show more',
                            style:
                                TextStyle(color: Color.fromRGBO(0, 155, 55, 1)),
                          )))
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(
                      top: 10, left: 15, right: 5, bottom: 10),
                  height: 230,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: getproducts != null
                          ? getproducts.dealsArray.length
                          : 5,
                      itemBuilder: ((context, index) {
                        return getproducts != null
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ItemDetailpage(
                                          index: index,
                                          id: getproducts.dealsArray[index].id),
                                    ),
                                  );
                                },
                                child: homecard(
                                  context,
                                  index,
                                  getproducts
                                      .dealsArray[index].images[0].imgProduct
                                      .toString(),
                                  getproducts.dealsArray[index].name,
                                  getproducts.dealsArray[index].actualPrice
                                      .toString(),
                                  getproducts.dealsArray[index].finalPrice
                                      .toString(),
                                  getproducts.dealsArray[index].id,
                                  AddtoFav(false),
                                ),
                              )
                            : const SizedBox(
                                height: 200,
                                width: 160,
                                child: Center(
                                  child: SizedBox(
                                      height: 60,
                                      width: 50,
                                      child: CircularProgressIndicator()),
                                ),
                              );
                      }))),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // color: Colors.amber,
                      width: 250,
                      padding: EdgeInsets.only(
                          left: (3 / 100) * MediaQuery.of(context).size.width),
                      child: const Text(
                        'Biscuits, Snaks and chocolates',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            right:
                                (3 / 100) * MediaQuery.of(context).size.width),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Show more',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 155, 55, 1)),
                            ))),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      top: 10, left: 15, right: 5, bottom: 10),
                  height: 230,
                  child: FutureBuilder(
                    future: GeTApi(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      // print('helo ${Getdatas()}');

                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: respons != null
                              ? getproducts.dealsArray.length
                              : 3,
                          itemBuilder: ((context, index) {
                            return respons != null
                                ? homecard(
                                    context,
                                    index,
                                    getproducts
                                        .dealsArray[index].images[0].imgProduct,
                                    getproducts.dealsArray[index].name,
                                    getproducts.dealsArray[index].actualPrice
                                        .toString(),
                                    getproducts.dealsArray[index].finalPrice
                                        .toString(),
                                    getproducts.dealsArray[index].id,
                                    AddtoFav(false))
                                : const SizedBox(
                                    height: 200,
                                    width: 160,
                                    child: Center(
                                      child: SizedBox(
                                          height: 60,
                                          width: 50,
                                          child: CircularProgressIndicator()),
                                    ),
                                  );
                          }));
                    },
                  )),
            ])),
      ),
    );
  }
}
