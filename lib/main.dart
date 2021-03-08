import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongodb_realm/flutter_mongo_realm.dart';
 
/// /////////////////////////////////////////////////////
import 'dart:async';
 
import 'package:flutter/services.dart';
import 'package:get/get.dart';
 
void main() async {
 // initialized MongoRealm App
   WidgetsFlutterBinding.ensureInitialized();
 
 // await RealmApp.init('triggers_realmapp-dqdra');
 await RealmApp.init('thor-test-lcfli');
 runApp(GetMaterialApp(home:MyApp()));
 
}
 
class MyApp extends StatefulWidget {
 @override
 _MyAppState createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp> {
  
 final  client =  MongoRealmClient();
  final app = new RealmApp();
  String textos = "";
  MongoCollection _collection;
 
 @override
 void initState() {
   super.initState();
   init();
 }
 
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _collection = client.getDatabase("fleet_manager").getCollection("countries");
    try {
      await _countData();
    } catch (e) {}
  }


 Future<void> init() async {
   
   try {
      CoreRealmUser mongoUser = await app.login(Credentials.anonymous());
      
      if (mongoUser != null) {
        print("logged in as ${mongoUser.id ?? '?'}");
        _collection = client.getDatabase("fleet_manager").getCollection("countries");
        await _countData();
        
        //watchData();
        //fetchData();
      } else {
       print("wrong pass or username");
      }
 
     //var mongoUser =await client.auth.loginWithCredential(AnonymousCredential());
    
    //CoreRealmUser mongoUser = await app.login(Credentials.anonymous());

 
     // create a user
//        await client.auth
//            .registerWithEmail(email: "naamahasson1@gmail.com", password: "123456");
 
     // login Anonymously
 
     // var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJteXN0aXRjaGFwcC1manBtbiIsImV4cCI6MTYyMTc5MzQyMSwiaWF0IjoxNjExODMwNjU1LCJzdWIiOiI1ZTlkNzEwZmJjZDg5NTIxOWM2YzFmMWIiLCJ1c2VySWQiOiI1ZTlkNzEwZmJjZDg5NTIxOWM2YzFmMWIifQ.kNowkTYV5J_xoR_aVowuattEcazesM09RmTfzpqJM2M";
     // var mongoUser = await client.auth.login(Credentials.jwt(token));
 
     //  CoreRealmUser mongoUser =
     //        await client.auth.loginWithCredential(AnonymousCredential()
 
     //    UserPasswordCredential(
     //        username: 'naamahasson1@gmail.com',//"kfir25816@gmail.com",
     //        password: '123456',//"asdfghj"
     //    )
     //         );
 
//    614805511929-lc92msgps9tr32slg8hqt9taqa3q3kbv.apps.googleusercontent.com
 
//      CoreRealmUser mongoUser = await client.auth.loginWithCredential(
//          GoogleCredential(
//        serverClientId: "614805511929-lc92msgps9tr32slg8hqt9taqa3q3kbv",//"281897935076-dlab9116cid9cmivd6nilofihip552cr",
//        scopes: ["email"],
//      )
//          FacebookCredential(permissions: ["email"])
//          );
 /*
     if (mongoUser != null) {
       print("logged in as ${mongoUser.id ?? '?'}");
       //fetchData();
       //countData();
        //watchData();
     } else {
       print("wrong pass or username");
     }*/
 
     // sign out
 
//      client.auth.logout();
 
//      var user = await client.auth.user;
//      print("you are user with id: '${user.id ?? '?'}', email: ${user.profile.email ?? '?'}");
//
//      var userId = await client.auth.getUserId();
//      print("you are '${userId ?? '?'}'");
 
     // after app initialized and user authenticated, show some data
 
      //countData(); /// DONE ON WEB
//        insertData(); /// DONE ON WEB
//      fetchData();    /// DONE ON WEB
//      deleteData(); /// DONE ON WEB
//        updateData(); /// DONE ON WEB
 
     //     watchData();
 
     /// DONE ON WEB
//      aggregateCollection(); //TODO: check
 
     /// DONE ON WEB
//      await client.callFunction("sum", args: [8, 4], requestTimeout: 54000).then((value) {
//        print(value);
//      });
 
   } on PlatformException catch (e) {
     print("Error! ${e.message}");
   } on Exception {}
 }
 
 _countData() async {
   
 
   try {
     var size = await _collection.count();
     print("size=$size");
   } on PlatformException catch (e) {
     print("Error! ${e.message}");
   }
 }
 
 Future<void> insertData() async {
   var collection = client.getDatabase("test").getCollection("my_collection");
 
   try {
//      var document = MongoDocument({
//        "time": DateTime.now().millisecondsSinceEpoch,
//        "name": "hadar",
//        "age": 27,
//        "dogs": [
//          "shocko",
//          "nuna"
//        ]
//      });
//
//      collection.insertOne(document);
 
     collection.insertMany([
       MongoDocument({
         "time": DateTime.now().millisecondsSinceEpoch,
         "username": "moshe",
         "grades": [90, 98],
       }),
       MongoDocument({
         "time": DateTime.now().millisecondsSinceEpoch,
         "username": "adiel",
         "age": [77, 55, 91],
       }),
     ]);
   } on PlatformException {
     debugPrint("Error!!!");
   }
 }
 
 Future<void> fetchData() async {
   // sample_mflix.comments
   // test.my_collection
   print("try collection fetch ok");
   var collection =
       client.getDatabase("fleet_manager").getCollection("countries");
 
   try {
//      var document = MongoDocument.fromMap({
//        "time": DateTime.now().millisecondsSinceEpoch,
//        "user_id": "abcdefg",
//        "price": 31.78432
//      });
 
//      var size = await collection.count({
//        // "name": "kfir"
//        "name": "Taylor Scott",
//      });
//      print(size);
 
//      var docs = await collection.find(
//          filter: {
//            "year": QueryOperator.gt(2010)..lte(2014),
//            // "year":{"$gt":2010,"$lte":2014}
//      });
//      print(docs.length);
 
     // var doc = await collection.findOne(
     //     //   {
     //     //   //"name": "kfir",
     //     //   "name": "Taylor Scott",
     //     // }
     //     );
     // print(doc);
     // int ssaa = 232;
 
     /// with projection/limit
     var docs = await collection.find(
         // filter: {
         //   "name": "naama",
         // },
//        options: RemoteFindOptions(
//            projection: {
//              "title": ProjectionValue.INCLUDE,
//              "rated": ProjectionValue.INCLUDE,
//              "year": ProjectionValue.INCLUDE,
//            },
//            limit: 70,
//            sort: {
//              "year": OrderValue.DESCENDING,
//            }),
         );
//      print(doc.get("_id"));
//      print(docs.length);
 
     docs.forEach((doc) {
       print(doc.get("_id"));
     });
 
//      /// with projection
//      var doc = await collection.findOne(
////        filter: {
////          "year": 2014,
////        },
////        projection: {
////          "title": ProjectionValue.INCLUDE,
////          "rated": ProjectionValue.INCLUDE,
////          "year": ProjectionValue.INCLUDE,
////        },
//      );
//      print(doc.map);
   } on PlatformException catch (e) {
     debugPrint("Error: $e");
     print(e);
   }
 }
 
 Future<void> deleteData() async {
   // sample_mflix.comments
   // test.my_collection
   var collection =
       client.getDatabase("sample_mflix").getCollection("comments");
 
   try {
//      var document = MongoDocument.fromMap({
//        "time": DateTime.now().millisecondsSinceEpoch,
//        "user_id": "abcdefg",
//        "price": 31.78432
//      });
 
//      var docs = await collection.find(filter: {"name": "Olly"});
//      print(docs.length);
//
//      var deletedDocs = await collection.deleteOne({"name": "Olly"});
//      print(deletedDocs);
 
     var deletedDocs = await collection.deleteMany({"name": "Olly"});
     print(deletedDocs);
 
//      var size = await collection.count();
//      print(size);
   } on PlatformException catch (e) {
     debugPrint("Error! ${e.message}");
   }
 }
 
 Future<void> updateData() async {
   var collection = client.getDatabase("test").getCollection("my_collection");
 
   try {
     var results = await collection.updateMany(
       filter: {
         "name": "adiel",
       },
//
//          update: UpdateSelector.set({
//            "quantity": 670,
//          })
 
//        update: UpdateOperator.rename({
//          "count": "quantity",
//        }),
 
//          update: UpdateSelector.unset(["age"]),
 
       update: UpdateOperator.inc({
         "age": -2,
         "quantity": 30,
       }),
 
//          update: UpdateSelector.max({
//            "quantity": 50.5,
//            "name": "x",
//          }),
 
//          update: UpdateSelector.mul({
//            "quantity": 2,
//          }),
 
//          update: UpdateSelector.mul({
//            "quantity": 2,
//          }),
 
//        update: UpdateSelector.pop({
//          "grades": PopValue.LAST, //PopValue.FIRST,
//        }),
 
//        update: UpdateSelector.push({
//          "grades": ArrayModifier.each([22, 88 ,91])
//
////          "grades": ArrayModifier.each([88, 90 ,22])
////            ..sort({"score": SortValue.ASC})
////            ..slice(3)
////            ..position(0)
//
//        }),
 
//          update: UpdateSelector.pullAll({
//              "grades": [22, 4]
//          })
 
//          update: UpdateSelector.pull({
//              /// all grades <= 77 in array 'grades'
//              "grades": QuerySelector.lte(77),
//
//              /// all values matched 'orange or kiwis' in array 'fruits'
////              "fruits": ["orange", "kiwis"]
//          })
     );
     print(results);
 
//      var results = await collection.updateMany(
//          filter:{
//            "name": "adiel",
//          },
//          update: UpdateSelector.set({
//            "quantity": 87,
//          })
//      );
//      print(results);
 
   } on PlatformException catch (e) {
     debugPrint("Error: $e");
   } on Exception {
     debugPrint("unkown error");
   }
 }
 
//  // Platform messages are asynchronous, so we initialize in an async method.
//  Future<void> initPlatformState() async {
//    String platformVersion;
//    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      platformVersion = await FlutterMongoRealm.platformVersion;
//    } on PlatformException {
//      platformVersion = 'Failed to get platform version.';
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    setState(() {
//      _platformVersion = platformVersion;
//    });
 
 void watchData() async {
   

  
   try {
     print("11111");
     print(client);
     print("------");
      var myCollection = client.getDatabase("fleet_manager").getCollection("countries");
      print(myCollection);
     print("cccccc");
      var size = await myCollection.count();
      print("size=$size");
//      final stream = myCollection.watch(ids: ["22", "8"], asObjectIds: false);
//      final stream2 = myCollection.watch(ids: ["5ee8a50ffaba833f1c6c6a7c"]);
     final streamSimple =  myCollection.watchWithFilter({"a": "a"});
  
    print("1");
    /*var docs = await myCollection.find();
         
    print("2");
     docs.forEach((doc) {
       print(doc.get("_id"));
     });
    */
     /// WORKS!R
 
     // final streamSimple =
     //     myCollection.watch(ids: ["603e7aa4c5d892a26cfb3479"]);
     print("a document");
     print(streamSimple);
 
     /// WORKS!
 
     streamSimple.listen((event) {
       print("a document 2");
       print(event);
       var fullDocument = MongoDocument.parse(event);
       print("a document with '${fullDocument.map["_id"]}' is changed");
       Get.snackbar(
      "", 
      "",
      // icon: icon,
      titleText: Center(child: Text("a document with '${fullDocument.map["_id"]}' is changed",style: TextStyle(fontFamily: "Exo2",fontSize: 16, color: Colors.white,))),
      
      // backgroundColor: Color(0xFF1CB5E5),
      
      snackPosition: SnackPosition.BOTTOM,
      duration:Duration(seconds:3),
      shouldIconPulse: true,
      isDismissible: true,
      borderRadius: 0.0,
      padding: EdgeInsets.only(bottom:0, top:15, left: 15, right: 0),
      margin: EdgeInsets.only(top:10),
      snackStyle: SnackStyle.GROUNDED,
    );
       //textos = "a document with '${fullDocument.map["_id"]}' is changed";
      
//        }
       // do something
     });
   } on PlatformException catch (e) {
     print("aggg");
     debugPrint("Error! ${e.message}");
   }
 }
 
//  }
 String variabletest(String valor){
   return valor;
 }
 Future<void> aggregateCollection() async {
   var collection = client.getDatabase("test").getCollection(
         //"scores"
         "orders",
       );
 
   try {
     /// addFields
//      List<PipelineStage> pipeline = [
//        PipelineStage.addFields({
//          "totalHomework": AggregateOperator.sum("homework"),
//          "totalQuiz": AggregateOperator.sum("quiz"),
//        }),
//        PipelineStage.addFields({
//          "totalScore": AggregateOperator.add(
//              ["totalHomework", "totalQuiz", "extraCredit"]),
//        }),
//      ];
 
     /// match, group, skip
//      List<PipelineStage> pipeline = [
//        PipelineStage.skip(2),
//        PipelineStage.match({"status": "A"}),
//        PipelineStage.group(
//          "cust_id",
//          accumulators: {"total": AggregateOperator.sum("amount")},
//        ),
//
//      ];
 
     List<PipelineStage> pipeline = [
       PipelineStage.sample(2),
     ];
 
//      List<PipelineStage> pipeline = [
//        PipelineStage.raw({
//          ""
//        }),
//      ];
 
     var list = await collection.aggregate(pipeline);
     print(list.length);
   } on PlatformException catch (e) {
     debugPrint("Error! ${e.message}");
   }
 
   // return Future.value([]);
 }
 
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     home: dummyHomeWidget(),
   );
 }
 
 dummyHomeWidget() {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Plugin example app'),
     ),
     body: Center(
       child: Column(
         children: <Widget>[
           Text(textos),
           RaisedButton(
             child: Text("Reset Password"),
             onPressed: () async {
               try {
                 var currUser = await app.currentUser;
                 final success = await app.sendResetPasswordEmail(
                     currUser.profile.email); //"kfir25812@gmail.com");
                 print(success);
               } on PlatformException catch (e) {
                 print(e.message ?? 'Unkown error');
               }
             },
           )
         ],
       ),
     ),
   );
 }
}
 

