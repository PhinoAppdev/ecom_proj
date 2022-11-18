import 'package:ecommerce/hive/hivefav.dart';
import 'package:ecommerce/local%20storage/addtofav.dart';
import 'package:ecommerce/models/favmodel.dart';
import 'package:ecommerce/models/postproductdetail.dart' as favmodel;
import 'package:ecommerce/objecctbox/addtofav.dart';
import 'package:ecommerce/widgets/gridcard.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late Future<List<FavModels>> favmodelslist;
  DbFAVHandlder? dbFAVHandlder;
  Stream<List<FavModels>>? favStreamList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbFAVHandlder = DbFAVHandlder();
    loadData();
  }

  loadData() async {
    favmodelslist = dbFAVHandlder!.getFavList();
  }

  @override
  Widget build(BuildContext context) {
    favmodelslist;

    dbFAVHandlder;
    loadData();
    print('heo');
    loadData();
    print(favmodelslist);
    setState(() {
      loadData();
      favmodelslist;
    });
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(size: 10),
        title: const Text("Favorites", style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assests/images/Vector.png',
              height: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {},
              child: Image.asset('assests/images/appbarnoti.png'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              loadData();
            });
          },
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
                child: FutureBuilder(
                  future: favmodelslist,
                  builder: (context, AsyncSnapshot<List<FavModels>> snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: const Text('Ooops nothin in favorite!!'),
                      );
                    } else {
                      // final fav = snapshot.data;
                      return GridView.builder(
                        // scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2 / 3.3,
                                crossAxisCount: 3,
                                crossAxisSpacing: 7,
                                mainAxisSpacing: 7),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GridCard(
                              context,
                              snapshot.data![index].image,
                              snapshot.data![index].id,

                              //  snapshot.data![index].image.toString(),
                              InkWell(
                                  onTap: () async {
                                    setState(() {
                                      dbFAVHandlder!.deleteFromFav(
                                          snapshot.data![index].id!.toInt());
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    size: 20,
                                    color: Colors.grey,
                                  )));
                        },
                      );
                    }
                  },
                ),
              ),
              ValueListenableBuilder<Box<FavModels>>(
                valueListenable: FavBox.getFavBox().listenable(),
                builder: (context, box, _)
                    // (BuildContext context, dynamic value, Widget? child)
                    {
                  final favHiveList = box.values.toList().cast<FavModels>;
                  return GridView.builder(
                    // scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3.3,
                            crossAxisCount: 3,
                            crossAxisSpacing: 7,
                            mainAxisSpacing: 7),
                    shrinkWrap: true,
                    itemCount: box.values.length,
                    itemBuilder: (BuildContext context, int index) {
                      FavModels? res = box.getAt(index);
                      return GridCard(
                          context,
                         res!.image,
                          res.name,

                          //  snapshot.data![index].image.toString(),
                          InkWell(
                              onTap: () async {
                                setState(() {
                                  dbFAVHandlder!.deleteFromFav(
                                      res.id!.toInt());
                                });
                              },
                              child: const Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.grey,
                              )));
                    },
                  );
                },
              ),
            ],
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
