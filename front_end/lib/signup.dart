import 'package:ambulance/driver_signup.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 200.0;
    double buttonHeight = 50.0;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/siren.gif', // Replace 'assets/siren.gif' with the actual path to your GIF
              width: 100, // Adjust size as needed
              height: 100,
            ),
            SizedBox(height: 20),
            Container(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                   context,
                     MaterialPageRoute(builder: (context) => driver_signup()),
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Driver',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle user button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'User',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle volunteer button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Volunteer',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                "Already have an account? Log in",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
