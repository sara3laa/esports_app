import 'package:esports_app/models/article.dart';
import 'package:esports_app/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Network{
  String articles_url ='https://fitbuzzapi.herokuapp.com/articles';
  String products_url = 'https://fitbuzzapi.herokuapp.com/products';

  List<Article> articles =[];
  List<Product>  products =[];
  Future<List<Product>> getProducts() async{
    final res = await  http.get(products_url,headers: {"Accept":"application/json"});
    final datajson = json.decode(res.body);
    final data = datajson['products'];
    for (var u in data){
      Product product =  Product(id:u['id'],name: u['name'],price:u['price'],image: u['image']);
      products.add(product);
    }

    return products;
  }
  Future<List<Article>> getArticles() async{
   final res = await http.get(articles_url,headers: {"Accept":"application/json"});

   final datajson = json.decode(res.body);
   final data= datajson['articles'];

   for (var u in data){
    Article article =  Article(id:u['id'],title: u['title'],image: u['image']);
    articles.add(article);
   }

     return articles;

  }

}
