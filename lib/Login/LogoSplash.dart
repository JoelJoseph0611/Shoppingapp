import 'package:flutter/material.dart';

import 'Register.dart';

class ReadyToShopPage extends StatefulWidget {
  const ReadyToShopPage({super.key});

  @override
  State<ReadyToShopPage> createState() => _ReadyToShopPageState();
}

class _ReadyToShopPageState extends State<ReadyToShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8B54C0), Color(0xFFD3CDED)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ready\nTo Start\nShopping?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Optional: centers the text within its container
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => registerLogin()),
                  );

                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
