import 'package:ecommerce/models/models.dart';
import 'package:hive/hive.dart';

abstract class BaselocalRepo{
  Future <Box> openbox();
  List <DealsArray> favoritelist(Box box);
  Future <void> addproductfavorite(Box box,DealsArray myfavdealsarry);
  Future <void> removeproductfavorite(Box box,DealsArray myfavdealsarry);
  Future <void> clearproductfavorite(Box box);
  
}