import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:patient_app/screens/categories.dart';
import 'package:patient_app/utils/constants.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

//Main Screen

class _CategoryScreenState extends State<CategoryScreen> {
  bool _obscureText = true;
  bool _isRadioSelected = false;

  Color _backgroundColor = COLOR_WHITE;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value:
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        child: ListView(
          padding: EdgeInsets.fromLTRB(12, 52, 22, 12),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_rounded,
                      color: COLOR_DARK_BLUE),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    primary: Colors.white70, // <-- Button color
                  ),
                ),
                Text("Category",
                    style: TextStyle(
                      fontSize: 18,
                      color: COLOR_BLACK,
                      fontWeight: FontWeight.bold,
                    )),
                IconButton(icon: Icon(Icons.search), onPressed: () {})
              ],
            ),
            SizedBox(
              height: 32,
            ),

            FutureBuilder<List<ParseObject>>(
              future: getCategories(),
              builder: (BuildContext context, AsyncSnapshot<List<ParseObject>> snapshot){
                if (snapshot.hasError) {
                  return  Column(
                    children: [
                      SizedBox(height : size.height*0.3),
                      const Center(child: Text('Something Went Wrong',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600
                      ),)),
                    ],
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(height : size.height*0.3),
                      Center(child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(primary),
                      ),),
                    ],
                  );
                }

                if(snapshot.data!.isEmpty)
                {
                  return  Column(
                    children: [
                      SizedBox(height : size.height*0.3),
                      const Center(child: Text('No Categories',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600
                      ),)),
                    ],
                  );

                }

                return GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery
                          .of(context)
                          .size
                          .width /
                          (MediaQuery
                              .of(context)
                              .size
                              .height / 1.7),
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final data = snapshot.data![index];

                      return Container(
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Categories(data.get('type'))));

                                    },
                                    child: CachedNetworkImage(
                                      imageBuilder: (context, imageProvider) => Container(
                                        height: MediaQuery.of(context).size.height*0.12,
                                        width: MediaQuery.of(context).size.height*0.12,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider, fit: BoxFit.cover),
                                        ),
                                      ),
                                      imageUrl: data.get('image'),
                                      placeholder: (context, url) => CircularProgressIndicator(
                                        valueColor: new AlwaysStoppedAnimation<Color>(primary),
                                      ),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    )),),
                              Center(
                                child: TextButton(child:Text( data.get('type'), style: TextStyle(
                                    fontSize: 15,
                                    color: COLOR_BLACK
                                )), onPressed: () {}),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),



/*            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Categories()));

                          },
                          child: Image.asset('assets/images/anxiety.png', height: 100),

                        )
                        ),
                        Center(
                         child: TextButton(child: Text("Anxiety", style: TextStyle(
                             fontSize: 15,
                             color: COLOR_BLACK
                         )), onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                  ),
                  Expanded(
                    flex: 1,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Categories()));
                              },
                              child: Image.asset('assets/images/relationship.png', height: 100),

                            )
                        ),
                        Center(
                          child: TextButton(child: Text("Relationships", style: TextStyle(
                              fontSize: 15,
                              color: COLOR_BLACK
                          )), onPressed: () {}),
                        )
                      ],
                    ),
                  ),
      ),
                ],
              ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Categories()));
                              },
                              child: Image.asset('assets/images/depression.png', height: 100),

                            )
                        ),
                        Center(
                          child: TextButton(child: Text("Depression", style: TextStyle(
                              fontSize: 15,
                              color: COLOR_BLACK
                          )), onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Image.asset('assets/images/childern.png', height: 100),

                            )
                        ),
                        Center(
                          child: TextButton(child: Text("Children", style: TextStyle(
                              fontSize: 15,
                              color: COLOR_BLACK
                          )), onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Image.asset('assets/images/family.png', height: 100),

                            )
                        ),
                        Center(
                          child: TextButton(child: Text("Marriage & Family", style: TextStyle(
                              fontSize: 15,
                              color: COLOR_BLACK
                          )), onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Image.asset('assets/images/stress.png', height: 100),

                            )
                        ),
                        Center(
                          child: TextButton(child: Text("Trauma & Stress", style: TextStyle(
                              fontSize: 15,
                              color: COLOR_BLACK
                          )), onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Image.asset('assets/images/eating.png', height: 100),

                            )
                        ),
                        Center(
                          child: TextButton(child: Text("Eating Disorders", style: TextStyle(
                              fontSize: 15,
                              color: COLOR_BLACK
                          )), onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Image.asset('assets/images/substance.png', height: 100),

                            )
                        ),
                        Center(
                          child: TextButton(child: Text("Substance Abuse", style: TextStyle(
                              fontSize: 15,
                              color: COLOR_BLACK
                          )), onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ),);
  }
  Future<List<ParseObject>> getCategories() async {
    /*FirebaseFirestore.instance.collection('categories').limit(3).get(),*/
    QueryBuilder<ParseObject> queryTodo = QueryBuilder<ParseObject>(ParseObject('categories'));
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

}
