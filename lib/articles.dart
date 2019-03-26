import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:esports_app/util/network.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ArticleListPage extends StatefulWidget{

    @override
   State<StatefulWidget> createState(){
      return _ArticlesListPageState();
    }
}
class _ArticlesListPageState extends State<ArticleListPage> {

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
        height: (screenSize.height)/3,
      child: FutureBuilder(
          future: Network().getArticles(),
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
                                       Padding(padding: EdgeInsets.all(5.0)),
                                       new FadeInImage.memoryNetwork(
                                         placeholder: kTransparentImage,
                                         image: snap.data[i].image,
                                         alignment: Alignment.center,
                                         width: (screenSize.width),
                                         height: (screenSize.height/3)-50.0,
                                         fit: BoxFit.fill,
                                       ),
                                      new Text(snap.data[i].title, style: TextStyle(fontSize: 16.0,color: Colors.lightBlue)
                                 )],
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

