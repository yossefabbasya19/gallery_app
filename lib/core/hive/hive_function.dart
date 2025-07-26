import 'package:gallery_app/feature/home_screen/data/model/api_response/photo_response.dart';
import 'package:gallery_app/main.dart';
import 'package:hive/hive.dart';

class HiveFunction {
  HiveFunction._();
  static HiveFunction instance =HiveFunction._();
  factory HiveFunction(){
    return instance;
  }
  var hiveBox = Hive.box<PhotoResponse>(hiveBoxName);
  Future<void> clearCache()async {
    await hiveBox.clear();
  }
  Future<void> addData(PhotoResponse photos)async{
    await hiveBox.add(photos);
  }
 PhotoResponse get getData{
   return hiveBox.values.first;
  }

}