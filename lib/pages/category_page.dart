import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3rd_exam/pages/innerside_of_category.dart';

import '../service/service.dart';



class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Kategoryalar ro'yxati"),
      ),
      body: FutureBuilder(
        future: getCategory(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
          }
          if (snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  ListView.builder(

                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => itemsGrid(appCategory: snapshot.data[index],)));
                        },
                        child: Container(
                          margin: EdgeInsets.all(4),
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),

                          child: Row(
                            children: [
                              Container(
                                height: 110,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft:Radius.circular(15)),
                                  image: DecorationImage(
                                    image: NetworkImage(snapshot.data[index].image_url,),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),

                              Expanded(child: Center(child: Text(snapshot.data[index].name))),
                            ],
                          ),


                        ),
                      );
                    },

                  )
                ],
              ),
            );
          }
          return Container();

        },
      ),
    );
  }
}
