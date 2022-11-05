import 'package:ecommerce/widgets/gridcard.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text(
      //     'Favorites',
      //     style: TextStyle(
      //       color: Color.fromRGBO(0, 155, 55, 1),
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 5),
      //       child: Image.asset('assests/images/finalbell.png'),
      //     ),
      //     Image.asset('assests/images/finalcart.png'),
      //   ],
      // ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Favorite',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color.fromRGBO(0, 155, 55, 1)),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assests/images/carticn.png',
                                height: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 15),
                            child: InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assests/images/bellicn.png',
                                height: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal:9, vertical: 12),
                  child: GridView.builder(
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3.3,
                            crossAxisCount: 3,
                            crossAxisSpacing: 7,
                            mainAxisSpacing: 7),
                    shrinkWrap: true,
                    itemCount: favtm.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GridCard(context, favtm[index].image,
                          favtm[index].name, Icons.delete);
                      // return GridCard(context)
                      // return Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(8.84),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey.withOpacity(0.3),
                      //         spreadRadius: 1,
                      //         blurRadius: 5,
                      //         offset: const Offset(0, 4),
                      //       )
                      //     ],
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Padding(
                      //         padding: EdgeInsets.only(
                      //             left: MediaQuery.of(context).size.width / 3,
                      //             top: 9,
                      //             bottom: 10),
                      //         child: Image.asset(
                      //           'assests/images/dlticn.png',
                      //           height: 23,
                      //         ),
                      //       ),
                      //       Image.asset(
                      //         favtm[index].image.toString(),
                      //         height: 80,
                      //         // width: 100,
                      //         fit: BoxFit.fill,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.symmetric(
                      //                 vertical: 3, horizontal: 15),
                      //             child: Text(
                      //               favtm[index].name.toString(),
                      //               style: const TextStyle(
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 17,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       Row(
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 15, vertical: 0),
                      //             child: Text(favtm[index].weight.toString(),
                      //                 style: const TextStyle(
                      //                     fontSize: 15, color: Colors.grey)),
                      //           ),
                      //         ],
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(
                      //             left: 13, top: 5, bottom: 13),
                      //         child: Row(
                      //           children: [
                      //             const Icon(
                      //                 IconData(
                      //                   0xf04e1,
                      //                   fontFamily: 'MaterialIcons',
                      //                 ),
                      //                 size: 18),
                      //             Text(
                      //               favtm[index].price.toString(),
                      //               style: const TextStyle(
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //             const SizedBox(
                      //               width: 5,
                      //             ),
                      //             const Text(
                      //               '₹65',
                      //               style: TextStyle(
                      //                   decoration: TextDecoration.lineThrough,
                      //                   fontSize: 15,
                      //                   color: Colors.grey),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //         height: 35,
                      //         width: 100,
                      //         decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             borderRadius: BorderRadius.circular(3.79),
                      //             border: Border.all(
                      //                 color:
                      //                     const Color.fromRGBO(0, 155, 55, 1))),
                      //         child: const Center(
                      //           child: Icon(
                      //             Icons.add,
                      //             color: Color.fromRGBO(0, 155, 55, 1),
                      //             size: 30,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),

                      // );
                    },
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

class Favtm {
  int? price;
  String? image, name, weight;
  Favtm({this.image, this.name, this.weight, this.price});
}

final List<Favtm> favtm = [
  Favtm(
      image: 'assests/images/prodimg/mango.png',
      name: 'Sinduri Mango',
      weight: '1kg',
      price: 100),
  Favtm(
      image: 'assests/images/prodimg/sugar.png',
      name: 'Madhur sugar',
      weight: '1kg',
      price: 100),
  Favtm(
      image: 'assests/images/prodimg/mango.png',
      name: 'Sinduri Mango',
      weight: '1kg',
      price: 100),
  Favtm(
      image: 'assests/images/prodimg/butter.png',
      name: 'amul butter ',
      weight: '1kg',
      price: 100),
  Favtm(
      image: 'assests/images/prodimg/moong.png',
      name: 'Moong Dal',
      weight: '1kg',
      price: 1000)
];
