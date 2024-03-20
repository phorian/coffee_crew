import 'package:cloud_firestore/cloud_firestore.dart';

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

  // get brews stream to notify changes to document
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }

}