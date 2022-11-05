import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:ecommerce/pages/bottomnav.dart';
import 'package:ecommerce/pages/dialogue.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';

class Selectaddress extends StatefulWidget {
  const Selectaddress({super.key});

  @override
  State<Selectaddress> createState() => _SelectaddressState();
}

class _SelectaddressState extends State<Selectaddress> {
  // int _value = 1;
  var _value = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 226, 226),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 30),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
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
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.black,
                        iconSize: 25,
                      ),
                      const Expanded(
                        child: TextField(
                          showCursor: true,
                          autofocus: false,
                          style: TextStyle(fontSize: 20),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search Area, Landmark or Apartment',
                              labelStyle: TextStyle(fontSize: 14),
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 129, 129, 129))),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 30, top: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        'assests/images/gpsicn.png',
                        height: 22,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     PageRouteBuilder(
                          //         pageBuilder: (context, a, b) => BotmNav()),
                          //     (route) => false);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MYpayment()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: const Text(
                            'Use My Current Location',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(0, 155, 55, 1)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    const Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Add address',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(0, 155, 55, 1)),
                        ))
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.3)),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Stack(children: [
                        Align(
                          alignment: Alignment(-1, -1.2),
                          child: Radio(
                              value: addresses[index].value.toString(),
                              groupValue: _value,
                              onChanged: ((value) {
                                setState(() {
                                  _value = value.toString();
                                });
                              })),
                        ),
                        const Align(
                          alignment: Alignment(-.65, -.85),
                          child: Text(
                            "Add Address",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(.45, .43),
                          child: Container(
                            // color: Colors.amber,
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: ListTile(
                              title: AutoSizeText(
                                addresses[index].address.toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                              subtitle: AutoSizeText(
                                  'MObileno: ${addresses[index].mobileno}'),
                             
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(1, -1.2),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete,
                                  color: Colors.grey, size: 22)),
                        ),
                        Align(
                          alignment: const Alignment(.8, -1.2),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit,
                                  color: Colors.grey, size: 22)),
                        )
                        
                      ]),

                     
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height / 7,
        // color: Colors.amber,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 70,
                    width: 130,
                    child: const ListTile(
                      title: Text('Total'),
                      subtitle: Text(
                        '₹215',
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Dialog(context, false);
                      },
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 2,
                        child: const Center(
                          child: Text(
                            "Make Payment",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Address {
  int? value, grpvalue, mobileno;
  String? address;
  Address({this.value, this.grpvalue, this.mobileno, this.address});
}

final List<Address> addresses = [
  Address(
      value: 1,
      grpvalue: 1,
      mobileno: 20439803249,
      address: 'Shop No.5, A/29, Bhatt Building, Old Nagardas Road,'
          ' Andheri (west), Mumbai- 400059'),
  Address(
      value: 2,
      grpvalue: 2,
      mobileno: 20439803249,
      address:
          'this is address.this is address.this is address.this is address.this is address.'),
  Address(
      value: 3,
      grpvalue: 3,
      mobileno: 20439803249,
      address:
          'this is address.this is address.this is address.this is address.this is address.')
];
final List<String> three = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
];


Dialog(BuildContext context, bool succ) {
  return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Column(
            children: [
              Image.asset(
                succ==true? 
                'assests/images/successdia.png': 'assests/images/errdia.png'),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                    succ == true ? 'Order Successful' : 'Order Unsuccessful',
                    style: const TextStyle(fontSize: 23, color: Colors.black)),
              ),
              Text(
                succ == true
                    ? 'Your order id is #345345 successfully placed'
                    : 'Order placement failed due to '
                        'payment failure',
                style: const TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    succ==true?
                    'Track Order': 'Retry Payment',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    succ==true?
                    Navigator.pop(context) : Navigator.push(context, MaterialPageRoute(builder: (context){return BotmNav();}));
                  },
                  child:Text( succ==true? 'Go Back': 'Go To Home', style: TextStyle(fontSize: 18)))
            ],
          ),
        );
      }));
}
