import 'package:flutter/material.dart';
import 'package:o_my_dog/payment.dart';
import 'package:o_my_dog/payment2.dart';
import 'main.dart';
import 'main3.dart';
import 'main4.dart';

class ConfirmUser extends StatelessWidget {
  final String mail;
  final int trainers;
  final int vets;
  final int vans;
  final int walkers;
  final int boarding;
  ConfirmUser(
      {required this.mail,
      required this.trainers,
      required this.vets,
      required this.vans,
      required this.walkers,
      required this.boarding});
  @override
  Widget build(BuildContext context) {
    int costtotal = trainers * 1000 +
        vets * 1000 +
        vans * 2000 +
        walkers * 500 +
        boarding * 700;
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
                      'User: ' + mail,
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
                height: 30,
              ),
              Text(
                'Services',
                style: TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF8E2369),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              if (trainers != 0)
                Order(item: 'Trainers', quantity: trainers, cost: 1000),
              if (trainers != 0)
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              if (vets != 0) Order(item: 'Vets', quantity: vets, cost: 1000),
              if (vets != 0)
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              if (vans != 0) Order(item: 'Vans', quantity: vans, cost: 2000),
              if (vans != 0)
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              if (walkers != 0)
                Order(item: 'Walkers', quantity: walkers, cost: 500),
              if (walkers != 0)
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              if (boarding != 0)
                Order(item: 'Boarding', quantity: boarding, cost: 700),
              if (boarding != 0)
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              Order(
                item: 'Total',
                quantity: (trainers + vets + vans + walkers + boarding),
                cost: (trainers * 1000 +
                    vets * 1000 +
                    vans * 2000 +
                    walkers * 500 +
                    boarding * 700),
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
                                  food: 0,
                                  lashes: 0,
                                  clothes: 0,
                                  collars: 0,
                                  soap: 0,
                                  trainers: trainers,
                                  vets: vets,
                                  vans: vans,
                                  walkers: walkers,
                                  boarding: boarding,
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
