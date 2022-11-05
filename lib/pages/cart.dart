import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce/models/homepagemodel.dart' as model;

import 'package:ecommerce/pages/dlvrydate.dart';

import 'package:ecommerce/webservices/get.dart';

import 'package:flutter/material.dart';

import '../widgets/itemcard.dart';

class Mycart extends StatefulWidget {
  const Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  Homepage() async {
    var res = HttpService.getHomePage();
    
  }

  int qnty = 1;
  @override
  Widget build(BuildContext context) {
    Homepage();
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
              ? const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.grey,
                  size: 20,
                )
              : const Icon(Icons.favorite, color: Colors.pink, size: 20));
    }

// GeTApi();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(.01),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                Container(
                  height: 60,
                  color: Colors.white,
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 3,
                                      left: ((1 / 100) *
                                          MediaQuery.of(context).size.width),
                                      right: ((1 / 100) *
                                          MediaQuery.of(context).size.width)),
                                  child: IconButton(
                                    onPressed: () {
                                      // Navigator.pushAndRemoveUntil(
                                      //     context,
                                      //     PageRouteBuilder(
                                      //         pageBuilder: (context, a, b) =>
                                      //             Home()),
                                      //     (route) => false);
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context)=>
                                      Navigator.pop(context);
                                      //    Categories();
                                      // ));
                                      //
                                    },
                                    icon: const Icon(
                                      IconData(
                                        0xe793,
                                        fontFamily: 'MaterialIcons',
                                        matchTextDirection: true,
                                      ),
                                      color: Colors.green,
                                      size: 30,
                                    ),
                                  )),
                              const Text(
                                'Cart',
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Color.fromRGBO(0, 155, 55, 1)),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: ((5 / 100) *
                                      MediaQuery.of(context).size.width)),
                              child: InkWell(
                                onTap: () {
                                  print((5 / 100) *
                                      MediaQuery.of(context).size.width);
                                },
                                child: Image.asset(
                                  'assests/images/carticn.png',
                                  height: 20,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 3,
                                  left: ((5 / 100) *
                                      MediaQuery.of(context).size.width),
                                  right: ((5 / 100) *
                                      MediaQuery.of(context).size.width)),
                              child: Image.asset(
                                'assests/images/bellicn.png',
                                height: 30,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Shipment of 1 of 1',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text('2 itmes', style: TextStyle(fontSize: 16))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromARGB(19, 158, 158, 158))),
                  // color: Colors.white,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: const EdgeInsets.only(top: 18, left: 20),
                    child: const Text(
                      'Delivery in 15 min',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                // ListView.builder(
                //   shrinkWrap: true,

                //   itemCount: 1,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Container(
                //         color: Colors.amber,
                //       height: 90,
                //       child: Row(
                //         children: [
                //           Image.asset('assests/images/prodimg/lays.png',width: 60,fit: BoxFit.cover,),
                //           Column(children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               children: [
                //                 Text('Lays'),
                //               ],
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.start,

                //               children: [
                //                 Text('Lays'),
                //               ],
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.start,

                //               children: [
                //             Text('Lays'),
                //             Text('Lays'),

                //               ],
                //             )
                //           ],)

                //         ],
                //       ),
                //     ) ;
                //   },
                // ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 4),
                            )
                          ],
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(90, 112, 112, 112)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assests/images/prodimg/darkfan.png',
                              width: MediaQuery.of(context).size.width / 3.7,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width / 2.5,
                              padding: const EdgeInsets.only(left: 7, top: 11),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                            minHeight: 0, maxHeight: 50),
                                        margin:
                                            const EdgeInsets.only(bottom: 1),
                                        // color: Colors.amber,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.2,
                                        child: const AutoSizeText(
                                          'Sunfeast Dark fantacy ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        '1kg',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 3),
                                        width: 70,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              '₹100',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              '₹65',
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 35),
                                      child: Icon(
                                        Icons.favorite_border_rounded,
                                        color: Colors.grey,
                                      )),
                                  SizedBox(
                                    width: 80,
                                    height: 26,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 26,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(1)),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                qnty--;
                                                qnty <= 0
                                                    ? setState((() {
                                                        qnty == 1;
                                                      }))
                                                    : print('hel');
                                              });
                                            },
                                            icon: const Icon(Icons.remove,
                                                size: 20, color: Colors.white),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Container(
                                            height: 26,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.green),
                                                borderRadius:
                                                    BorderRadius.circular(1)),
                                            child: Center(
                                              child: Text(
                                                qnty.toString(),
                                                style: const TextStyle(
                                                    color: Colors.green),
                                              ),
                                            )),
                                        Container(
                                          height: 26,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(1)),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                qnty++;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            padding: EdgeInsets.zero,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox()
                                ])
                          ],
                        ),
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 15),
                    const Expanded(
                        child: Text(
                      "Recommendation",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Show More',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 155, 55, 1),
                              fontSize: 15),
                        )),
                    const SizedBox(
                      width: 14,
                    )
                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(
                      top: 10, left: 15, right: 5, bottom: 10),
                  height: 230,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: ((context, index) {
                        return homecard(
                            context,
                            index,
                            respons!['deals_array'][index]['images'][0]
                                ['img_product'],
                            respons!['deals_array']![index]['name'].toString(),
                            respons!['deals_array']![index]['actual_price']
                                .toString(),
                            respons!['deals_array']![index]['actual_price']
                                .toString(),
                            respons!['deals_array'][index]['ID'],
                            AddtoFav(false));
                      })),
                ),
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        children: const [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Bill Details',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Text(
                              'Product price (2 item)',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: Container(
                              child: Row(
                                children: const [
                                  Icon(
                                      IconData(
                                        0xf04e1,
                                        fontFamily: 'MaterialIcons',
                                      ),
                                      size: 20),
                                  Text(
                                    '500',
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          // SizedBox(
                          //   width: 15,
                          // ),
                          Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Text(
                              'Delivery charges',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 35),
                              child: Text(
                                'Free',
                                style: TextStyle(fontSize: 18),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      // DottedLine(dashLength: 40),
                      Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width - 35,
                        // color: Colors.amber,
                        child: Column(
                          children: const [
                            DottedLine(
                              dashLength: 10,
                              dashGapLength: 8,
                              dashColor: Colors.black,
                            ),
                            DottedLine(
                              dashLength: 10,
                              dashGapLength: 8,
                              dashColor: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(
                          //   width: 15,
                          // ),
                          const Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Text(
                              'Total price',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: Container(
                              child: Row(
                                children: const [
                                  Icon(
                                      IconData(
                                        0xf04e1,
                                        fontFamily: 'MaterialIcons',
                                      ),
                                      size: 20),
                                  Text(
                                    '500',
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
              ],
            ),
          ),
        ),
      )),
      bottomSheet: SizedBox(
        height: MediaQuery.of(context).size.height / 7,
        width: MediaQuery.of(context).size.width,
        // color: Colors.amber,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 155, 55, 1)),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: ((context) {
                  //   return Setdlvr();
                  // })));
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Setdlvr();
                  })));
                },
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: const Center(
                      child: AutoSizeText(
                    'Add to Cart',
                    style: TextStyle(fontSize: 20),
                  )),
                )),
          ],
        ),
      ),
    );
  }
}
