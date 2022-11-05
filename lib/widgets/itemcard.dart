import 'package:ecommerce/pages/detailspage.dart';
import 'package:ecommerce/webservices/postdatatodetailpage.dart';
import 'package:flutter/material.dart';

Color _color = Color.fromARGB(255, 161, 161, 161);

Container homecard(BuildContext context, int index, String image, String name,
    var actualprice, finalprice, id, Widget isfav) {
// int dealsproductid = int.parse(id);
  return Container(
      constraints: const BoxConstraints(minHeight: 0, maxHeight: 20.0),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 210,
      width: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(90, 112, 112, 112)),
          borderRadius: BorderRadius.circular(8.84),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 0),
            )
          ]),
      child: InkWell(
        onTap: () {
          postdata(id);
          print(postfromjsonproductdata.length);
        },
        child: Stack(
          children: [
            Positioned(
              // right:0,
              left: 90,
              // top: 1,
              bottom: 180,
              child: isfav,
            ),
            Positioned(
                top: 35,
                left: 20,
                child: InkWell(
                  onTap: () {
                    postdata(id);
                    DetailpageNavigate(context, index, id);
                  },
                  child: Image.network(
                    image,
                    height: 60,
                    width: 80,
                  ),
                )),
            Positioned(
              top: 110,
              left: 10,
              child: InkWell(
                onTap: () {
                  postdata(id);
                  DetailpageNavigate(context, index, id);
                },
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Positioned(
              top: 135,
              left: 10,
              child: Text(
                '1kg',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Positioned(
                top: 156,
                child: InkWell(
                  onTap: () {
                    postdata(id);
                    DetailpageNavigate(context, index, id);
                  },
                  child: Container(
                    width: 100,
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '₹ $finalprice',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '₹ $actualprice',
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                bottom: 5,
                left: 19,
                child: Container(
                    child: Stack(children: [
                  Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                            color: const Color.fromRGBO(0, 155, 55, 1))),
                  ),
                  const Positioned(
                      top: 3,
                      left: 32,
                      child: Icon(
                        Icons.add,
                        color: Color.fromRGBO(0, 155, 55, 1),
                      ))
                ])))
          ],
        ),
      ));
}

void DetailpageNavigate(BuildContext context, int index, id) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) {
    return ItemDetailpage(
      index: index,
      id: id,
    );
  })));
}
