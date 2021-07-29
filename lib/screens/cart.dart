
import 'package:annonce_app_front/screens/checkout.dart';
import 'package:annonce_app_front/util/annonce.dart';
import 'package:annonce_app_front/widgets/cart_item.dart';
import 'package:flutter/material.dart';


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with AutomaticKeepAliveClientMixin<CartScreen >{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView.builder(
          itemCount: annonces == null ? 0 :annonces.length,
          itemBuilder: (BuildContext context, int index) {

            Map annonce = annonces[index];


            return CartItem(
              img: annonce['img'],
              isFav: false,
              name: annonce['name'],
              rating: 5.0,
              raters: 23,
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: "Checkout",
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return Checkout();
              },
            ),
          );
        },
        child: Icon(
          Icons.arrow_forward,
        ),
        heroTag: Object(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
