import 'package:flutter/material.dart';
import 'package:wulap_application/presentation/buy_page/OrderSuccessScreen.dart';

class BuyInfoScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  BuyInfoScreen({required this.item});

  @override
  _BuyInfoScreenState createState() => _BuyInfoScreenState();
}

class _BuyInfoScreenState extends State<BuyInfoScreen> {
  double totalPrice = 0.0;
  int quantity = 1;
  bool isFavorite = false;
  String selectedPaymentMethod = 'Gcash';

  @override
  Widget build(BuildContext context) {
    totalPrice = quantity * double.parse(widget.item['price'].substring(1));

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item['name'],
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSans',
                ),
              ),
              SizedBox(height: 16.0),
              Image.network(
                widget.item['image'],
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                'Price: ₱${widget.item['price'].substring(1)}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                  fontFamily: 'NotoSans',
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantity:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'NotoSans',
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),
                      Text(
                        '$quantity',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'NotoSans',
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Total Price: ₱${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSans',
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple[900],
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 32.0),
                    ),
                    onPressed: () {
                      _showConfirmationDialog(context, totalPrice);
                    },
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    iconSize: 40.0,
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                widget.item['description'],
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                  fontFamily: 'NotoSans',
                ),
                textAlign: TextAlign.justify,
                strutStyle: StrutStyle(
                  leading: .5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, double totalPrice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Center(
                child: Text('Confirm Purchase', textAlign: TextAlign.center),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(widget.item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Item: ${widget.item['name']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'YourCustomFont',
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Quantity: $quantity',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: const Color.fromARGB(255, 112, 112, 112),
                        fontFamily: 'YourCustomFont',
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Total Price: ₱${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: const Color.fromARGB(255, 112, 112, 112),
                        fontFamily: 'YourCustomFont',
                      ),
                    ),
                  ),
                  // Move the DropdownButton here
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Payment Method:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'YourCustomFont',
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  DropdownButton<String>(
                    value: selectedPaymentMethod,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPaymentMethod = newValue!;
                      });
                    },
                    items: ['Gcash', 'PayPal', 'COD']
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: const Color.fromARGB(255, 112, 112, 112),
                                fontFamily: 'YourCustomFont',
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: const Color.fromARGB(255, 112, 112, 112),
                      fontFamily: 'YourCustomFont',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[900],
                    onPrimary: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    // Show loading indicator
                    showDialog(
                      context: context,
                      barrierDismissible:
                          false, // Prevent the user from dismissing the dialog
                      builder: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    // Delay for 3 seconds before navigating to OrderSuccessScreen
                    Future.delayed(Duration(seconds: 3), () {
                      // Hide loading indicator
                      Navigator.pop(context); // Close the loading dialog

                      // Navigate to OrderSuccessScreen
                      Navigator.pop(context); // Pop the current screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderSuccessScreen(),
                        ),
                      );
                    });
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
