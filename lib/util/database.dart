import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seiyuu/util/seiyuu.dart';

//class for database queries
//used when saving information for getting info when a page loads
//do not use when real-time updates are preferred. In that case, use StreamBuilder()

class Database {
  //retrieve a seiyuu by using values such as the document id
  static Future<Seiyuu> getSeiyuu({String id}) async {
    if (id != null) {
      DocumentSnapshot seiyuuDoc =
          await Firestore.instance.collection('seiyuu').document(id).get();

      Seiyuu seiyuu = Seiyuu(seiyuuDoc);
      return seiyuu;
    }
  }

  //retrieve all seiyuu from the database in a list
  static Future<List<Seiyuu>> getAllSeiyuu() async {
    //NOTE: May need to add orderBy field eventually
    QuerySnapshot seiyuuSnap =
        await Firestore.instance.collection('seiyuu').getDocuments();

    //create a list that will hold all seiyuu
    List<Seiyuu> seiyuuList = List<Seiyuu>();

    for (int i = 0; i < seiyuuSnap.documents.length; i++) {
      DocumentSnapshot currentSeiyuuDoc = seiyuuSnap.documents[i];

      //make a seiyuu object from the document
      Seiyuu currentSeiyuu = Seiyuu(currentSeiyuuDoc);

      //add the seiyuu to the list
      seiyuuList.add(currentSeiyuu);
    }

    return seiyuuList;
  }

  static Future<void> addPageView(String seiyuuId) async {
    //may not need the await, since the user should not have to wait for this to finish
    //await
    /*Firestore.instance.runTransaction((Transaction tx) {
      Firestore.instance.collection("pageviews").document().setData({
        "seiyuuId": "$seiyuuId",
        "timeViewed": Timestamp.fromDate(DateTime.now()),
      });
    });*/
    Timestamp viewTime = Timestamp.fromDate(DateTime.now());
    List<Timestamp> viewTimeList = List<Timestamp>();
    viewTimeList.add(viewTime);

    await Firestore.instance.runTransaction((Transaction tx) async {
      DocumentReference documentReference =
          Firestore.instance.collection("pageviews").document("$seiyuuId");

      final snapShot = await documentReference.get();

      // update if the document exists, otherwise, create it
      if (snapShot.exists) {
        //it exists
        //Get viewCount. This will be used for quick filtering when retrieving pageviews
        int viewCount = snapShot['viewCount'];
        //raise viewCount
        viewCount = viewCount + 1;

        tx.update(documentReference, {
          //arrayUnion will add the new viewtime with existing viewtimes
          "timeViewed": FieldValue.arrayUnion(viewTimeList),
          "viewCount": viewCount,
        });
      } else {
        //not exists
        tx.set(documentReference, {
          //arrayUnion will add the new viewtime with existing viewtimes
          "timeViewed": FieldValue.arrayUnion(viewTimeList),
          "viewCount": 1,
        });
      }

      //setdata merge can be used instead if doc does not exist
      /*Firestore.instance
          .collection("pageviews")
          .document("$seiyuuId")
          .updateData({
        //arrayUnion will add the new viewtime with existing viewtimes
        "timeViewed": FieldValue.arrayUnion(viewTimeList),
      });*/
    });
  }
}
