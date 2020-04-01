import 'dart:convert';

import 'package:inovola_task/model/dao/data_obj.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class DataModelController extends Model
{

  DataOBJ OBJ ;

  fn_getData()async
  {
    print("const1");

    try {
      String url = "http://skillzycp.com/api/UserApi/getOneOccasion/389/0";
      var response = await http.get(url);
      Map valueMap = json.decode(jsonDecode(response.body));
      OBJ = DataOBJ.fromJson(valueMap);
    }catch(error)
    {
      print("error $error");
    };




  }


}