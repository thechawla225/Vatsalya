import 'package:intl/intl.dart';



class Food {
  String name , gender = "Male", age  , day = DateFormat('EEEE').format(DateTime.now()) ,time = "10:15" ;


  Food();

  Food.fromMap(Map<String , dynamic> data){
    name  = data['name'];
    gender = data['gender'];
    age = data['age'];
    day = data['day'];
    time = data['time'];
  }
  Map<String , dynamic> toMap()
  {
    return {
      'name' : name,
      'gender' : gender,
      'age' : age,
      'time' : time,
      'day' : day,
    };
  }
}