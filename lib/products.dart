import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:esports_app/util/network.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ProductListPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return _ProductsListPageState();
  }
}
class _ProductsListPageState extends State<ProductListPage> {

  @override
  initState(){
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    return Card(
        color: Colors.white,
        child: Container(
          width: screenSize.width,
          height: (screenSize.height/2)-30,
          child: FutureBuilder(
            future: Network().getProducts(),
            builder:(BuildContext context, AsyncSnapshot snap){
              if(snap.data == null){
                return Text('sara');
              }
              else {

                var indces = new List<int>.generate(snap.data.length -1, (i) => i + 1);

                return CarouselSlider(
                  height: (screenSize.height/3),

                  items: indces.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 2.0),

                            child: InkWell(
                                onTap: (){},
                                child: Column(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(1)),
                                    new FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: snap.data[i].image,
                                      alignment: Alignment.topRight,
                                      width: (screenSize.width-120.0),
                                      height: (screenSize.height/3)-125.0,
                                      fit: BoxFit.fill,
                                    ),
                                    ListTile(
                                    title: Text(snap.data[i].name, style: TextStyle(fontSize: 15.0,color: Colors.lightBlue),
                                    ),
                                      subtitle: Text("price: ${snap.data[i].price.toString()} EGP"),

                                    ),

                                    //new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.red) , onPressed: (){})

                                    Row(
                                      children: <Widget>[
                                        IconButton (icon: Icon(
                                          Icons.add_shopping_cart,
                                          color: Colors.red),
                                          onPressed: () {},),

                                        SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          "ADD TO Cart",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    )

                                  ],
                                )
                            )
                        );
                      },
                    );
                  }).toList(),
                );
              }
            },


          ),
        )
    );

  }
}

