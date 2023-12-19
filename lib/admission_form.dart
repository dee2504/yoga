// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marquee/marquee.dart';

class AdmissionForm extends StatefulWidget {
  const AdmissionForm({super.key});

  @override
  _AdmissionFormState createState() => _AdmissionFormState();
}

class _AdmissionFormState extends State<AdmissionForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 18;
  String _batch = '6-7AM';
  bool _showErrorCard = false;
  String _errorMessage = '';
  bool _showSuccessCard = false;
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
        title: const Text(
          'FlexYoga',
          style: TextStyle(color: Colors.white, fontSize: 45),
        ),
        actions: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(right: 28.0), // Add padding to the right
            child: SizedBox(
              width: 110, // Specify the width
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.6), // Text color
                ),
                child: const Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 28.0), // Add padding to the right
            child: SizedBox(
              width: 110, // Specify the width
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.6), // Text color
                ),
                child: const Text(
                  'Resources',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 38.0), // Add padding to the right
            child: SizedBox(
              width: 110, // Specify the width
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.6), // Text color
                ),
                child: const Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/images/yoga.jpg', // Replace with your image path
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          // Content
          Positioned(
            left: 55,
            bottom: 40,
            width: 530, // Adjust the width of the form box
            height: 450,
            // bottom: 50, // Adjust the height of the form box
            child: Container(
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15), // Rounded edges
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 2, // Border width
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(3, 6), // changes position of shadow
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // ... form fields ...
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Rounded corners for the container
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 4),
                          ), // Adds a border to the input field
                        ),
                        onSaved: (value) => _name = value!,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            _errorMessage = 'Name cannot be empty';
                            return _errorMessage;
                          }
                          return null; // means validation is passed
                        },
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Rounded corners for the container
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Age',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (value) => _age = int.parse(value!),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _errorMessage = 'Please enter your age';
                            return _errorMessage;
                          }
                          final numAge = int.tryParse(value);
                          if (numAge == null || numAge < 18 || numAge > 65) {
                            _errorMessage = 'Age must be between 18 and 65';
                            return _errorMessage;
                          }
                          return null; // means validation is passed
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) => _phoneNumber = value!,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value.length != 10) {
                            _errorMessage = 'Invalid Phone number';
                            return _errorMessage;
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Rounded corners for the container
                      ),
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                        value: _batch,
                        onChanged: (String? newValue) {
                          setState(() {
                            _batch = newValue!;
                          });
                        },
                        items: <String>['5-6PM', '6-7AM', '7-8AM', '8-9AM']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      width: 195,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 0, 0, 0), // Button color
                          foregroundColor: const Color.fromARGB(
                              255, 255, 255, 255), // Text color
                          side: const BorderSide(
                              // color: Color.fromARGB(255, 177, 59, 0),
                              width: 2), // Border
                          elevation: 5, // Shadow elevation
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        child: const Text(
                          'Proceed To Pay',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20, // Adjust as needed
            top: 200, // Adjust as needed
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width -
                  700, // Taking the full width of the screen minus padding
              height: 250, // Adjust as needed
              child: Marquee(
                text:
                    " Yoga is not about touching your toes, it's about what you learn on the way down.",
                style: const TextStyle(fontSize: 40, color: Colors.white),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 50.0,
                pauseAfterRound: const Duration(seconds: 1),
                startPadding: 10.0,
                accelerationDuration: const Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: const Duration(seconds: 1),
                decelerationCurve: Curves.easeOut,
              ),
            ),
          ),

          _buildErrorCard(),
          _buildSuccessCard(),
        ],
      ),
    );
  }

  void _submitForm() async {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) {
      setState(() {
        _showErrorCard = true;
      });
      await Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _showErrorCard = false;
        });
      });

      return;
    }
    formState.save();
    var userCollection = FirebaseFirestore.instance.collection('users');
    var querySnapshot = await userCollection
        .where('name', isEqualTo: _name)
        .where('phoneNumber', isEqualTo: _phoneNumber)
        .get();
    // After validation and saving form data
    if (querySnapshot.docs.isNotEmpty) {
      var userData = querySnapshot.docs.first.data();
      DateTime lastRegistrationDate = userData['DateTime'].toDate();

      // Check if the last registration was in a different month
      if (DateTime.now().month != lastRegistrationDate.month ||
          DateTime.now().year != lastRegistrationDate.year) {
        // Update the existing user data
        userCollection.doc(querySnapshot.docs.first.id).update({
          'name': _name,
          'age': _age,
          'phoneNumber': _phoneNumber,
          'batch': _batch,
          'DateTime': DateTime.now(),
          'monthlyPayment': 500
        });
        setState(() {
          _showSuccessCard = true;
        });
      } else {
        setState(() {
          _errorMessage = 'User already registered for this month';
          _showErrorCard = true;
        });
        await Future.delayed(const Duration(seconds: 3));
        setState(() => _showErrorCard = false);
      }
    } else {
      FirebaseFirestore.instance.collection('users').add({
        'name': _name,
        'age': _age,
        'phoneNumber': _phoneNumber,
        'batch': _batch,
        'DateTime': DateTime.now(),
        'monthlyPayment': 500
      });

      setState(() {
        _showSuccessCard = true;
      });
    }
  }

  Widget _buildSuccessCard() {
    if (!_showSuccessCard) {
      return Container(); // Return an empty container if the success card should not be shown
    }

    return Center(
      child: Stack(
        children: [
          // Background blur effect (optional)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.3), // Slight dark overlay
            ),
          ),
          // Success Card
          Center(
            child: Card(
              elevation: 10, // Adds shadow for a 3D effect
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Rounded corners for the card
                side: const BorderSide(
                  color: Color.fromARGB(255, 0, 52, 2), // Color of the border
                  width: 2, // Thickness of the border
                ),
              ),
              color: const Color.fromARGB(
                  255, 226, 236, 224), // Set the color of the card
              child: Container(
                width: 400, // Set the width of the card
                height: 200, // Set the height of the card
                alignment: Alignment.center,
                child: const Text(
                  'Hooray, payment successful! Welcome to FlexYoga Club.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 0, 52, 2)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorCard() {
    if (!_showErrorCard) {
      return Container(); // Return an empty container if error card should not be shown
    }

    return Center(
      child: Stack(
        children: [
          // Background blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.3), // Slight dark overlay
            ),
          ),
          // Error Card with specified width, height, and color
          Center(
            child: Card(
              elevation: 10, // Optional: adds shadow for a 3D effect
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Rounded corners for the card
                side: const BorderSide(
                  color: Colors.black, // Color of the border
                  width: 2, // Thickness of the border
                ),
              ),
              color: const Color.fromARGB(
                  255, 224, 212, 212), // Set the color of the card
              child: Container(
                width: 400, // Set the width of the card
                height: 200, // Set the height of the card
                alignment: Alignment.center,
                child: Text(
                  _errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 23),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
