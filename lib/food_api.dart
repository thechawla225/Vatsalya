import 'package:vatsalya2/patient.dart';
import 'package:vatsalya2/foodnotifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';





getFoods(FoodNotifier foodNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance
      .collection('Foods')
      .orderBy("createdAt", descending: true)
      .getDocuments();

  List<Food> _foodList = [];

  snapshot.documents.forEach((document) {
    Food food = Food.fromMap(document.data);
    _foodList.add(food);
  });

  foodNotifier.foodList = _foodList;
}


uploadFood(Food food, Function foodUploaded) async {

  CollectionReference foodRef = Firestore.instance.collection('Foods');

  DocumentReference documentRef = await foodRef.add(food.toMap());

  print('uploaded food successfully: ${food.toString()}');

  await documentRef.setData(food.toMap(), merge: true);

  foodUploaded(food);


}
uploadFood2(Food food, Function foodUploaded) async {

  CollectionReference foodRef = Firestore.instance.collection('Dr. Puneet Madan');

  DocumentReference documentRef = await foodRef.add(food.toMap());

  print('uploaded food successfully: ${food.toString()}');

  await documentRef.setData(food.toMap(), merge: true);

  foodUploaded(food);


}
