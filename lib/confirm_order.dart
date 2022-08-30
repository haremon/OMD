import 'package:flutter/material.dart';
import 'package:o_my_dog/payment.dart';
import 'package:o_my_dog/payment2.dart';
import 'main.dart';
import 'main3.dart';
import 'main4.dart';

class Confirm extends StatelessWidget {
  final String mail;
  final int food;
  final int lashes;
  final int clothes;
  final int collars;
  final int soap;
  Confirm(
      {required this.mail,
      required this.food,
      required this.lashes,
      required this.clothes,
      required this.collars,
      required this.soap});
  @override
  Widget build(BuildContext context) {
    int costtotal =
        food * 150 + lashes * 200 + clothes * 400 + collars * 250 + soap * 100;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 60.0),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'Logged In: ' + mail,
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Products',
                style: TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF8E2369),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              if (food != 0) Order(item: 'dog food', quantity: food, cost: 150),
              if (food != 0)
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              if (lashes != 0)
                Order(item: 'Lashes', quantity: lashes, cost: 200),
              if (lashes != 0)
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              if (clothes != 0)
                Order(item: 'Clothes', quantity: clothes, cost: 400),
              if (clothes != 0)
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              if (collars != 0)
                Order(item: 'Collars', quantity: collars, cost: 250),
              if (collars != 0)
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              if (soap != 0) Order(item: 'Soaps', quantity: soap, cost: 100),
              if (soap != 0)
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              Order(
                item: 'Total',
                quantity: (food + lashes + clothes + collars + soap),
                cost: (food * 150 +
                    lashes * 200 +
                    clothes * 400 +
                    collars * 250 +
                    soap * 100),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Screen3(mail: mail)));
                },
                child: Text(
                  'Go Back',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => payment2(
                                  mail: mail,
                                  food: food,
                                  lashes: lashes,
                                  clothes: clothes,
                                  collars: collars,
                                  soap: soap,
                                  trainers: 0,
                                  vets: 0,
                                  vans: 0,
                                  walkers: 0,
                                  boarding: 0,
                                  total: costtotal,
                                )));
                  },
                  child: Text(
                    'Confirm Order',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class Order extends StatelessWidget {
  final String item;
  final int quantity;
  final int cost;

  const Order({
    Key? key,
    required this.item,
    required this.quantity,
    required this.cost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              quantity.toString(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Icon(
            Icons.close,
            color: Colors.grey,
          ),
        ],
      ),
      trailing: Text(
        cost.toString(),
        style: TextStyle(
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.yellow.shade800,
        ),
      ),
      title: Text(
        item,
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
