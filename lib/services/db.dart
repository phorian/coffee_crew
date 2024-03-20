import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_crew/models/brew_model.dart';

class DbServices{

  final String? uid;
  DbServices({ this.uid });

  //collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String name, String sugars, int strength, ) async {
    return await brewCollection.doc(uid).set({
      'name': name,
      'sugars': sugars,
      'strength': strength,
    });
}

  //brew list from snapshot
  List<Brew>   _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc['name'] ?? '',
        sugars: doc['sugars'] ?? '0',
        strength: doc['strength'] ?? 0,
      );
    }).toList();
  }

  // get brews stream to notify changes to document
  Stream<List<Brew>?> get brews {
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }

}