// import 'package:flutter/material.dart';
//
// class itemsGrid extends StatelessWidget {
//   const itemsGrid({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 260,
//             width: 150,
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//              // image: DecorationImage(
//                // image: NetworkImage(),
//               ),
//             child: Column(
//               children: [
//                 SizedBox(height: 10,),
//                 Container(
//                   width: 120,
//                   height: 120,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.all(Radius.circular(8))
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//                 Center(child: Text('Name')),
//                 SizedBox(height: 25,),
//                 Text("Price", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),),
//                 SizedBox(height: 10,),
//                 Container(
//                   height: 40,
//                   width: 110,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                   ),
//                   child: Center(child: Text("Add To Cart", style: TextStyle(color: Colors.white),)),
//                 )
//
//
//               ],
//             ),
//             ),
//
//
//
//           //),
//
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3rd_exam/pages/widgets/product_tile_widget.dart';

import '../service/product_servic.dart';
import '../util/models/category_model.dart';


class itemsGrid extends StatefulWidget {
  AppCategory appCategory;
  itemsGrid({required this.appCategory,Key? key}) : super(key: key);

  @override
  State<itemsGrid> createState() => _itemsGridState();
}

class _itemsGridState extends State<itemsGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      appBar: AppBar(
        title: Text(widget.appCategory.name),
      ),
      body: FutureBuilder(
        future: getProducts(widget.appCategory.id),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List products=snapshot.data!;
            return Container(
              padding: EdgeInsets.all(12),
              child: Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2/3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12
                  ),
                  itemBuilder: (context, index) => productItemWidget(product:products[index]),

                ),
              ),
            );
          }
          return Container();
        },
      ),

    );
  }
}
