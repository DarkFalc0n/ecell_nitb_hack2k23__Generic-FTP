import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  var paper = new TextEditingController();
  var plastic = new TextEditingController();
  var glass = new TextEditingController();
  var metal = new TextEditingController();
  var cloth = new TextEditingController();
  var ewaste = new TextEditingController();
  
  get http => null;


  void handleAccept(order, driver) async {
    var url = Uri.https('esummit-back.onrender.com', 'order/finalOrder');
    var response = await http.post(
      url,
      body: jsonEncode({'id':order, 'data':{
        'paper':paper.text,
        'plastic':plastic.text,
        'glass':glass.text,
        'metal':metal.text,
        'cloth':cloth.text,
        'ewaste':ewaste.text,
      }}),
      headers: {
        "Content-type": "application/json",
      },
    );
    
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          children: [
            Spacer(),
            Text(
              "Enter Waste Weights by the type",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFE1E1E1),
                filled: true,
                hintText: 'Paper',
                
              ),
              onChanged: ((value) => {
                paper.text = value,
              }),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFE1E1E1),
                filled: true,
                hintText: 'Plastic',
              ),
              onChanged: ((value) => {
                plastic.text = value,
              }),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFE1E1E1),
                filled: true,
                hintText: 'Glass',
              ),
              onChanged: ((value) => {
                glass.text = value,
              }),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFE1E1E1),
                filled: true,
                hintText: 'Metal',
              ),
              onChanged: ((value) => {
                metal.text = value,
              }),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFE1E1E1),
                filled: true,
                hintText: 'cloth',
              ),
              onChanged: ((value) => {
                cloth.text = value,
              }),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFE1E1E1),
                filled: true,
                hintText: 'E-waste',
              ),
              onChanged: ((value) => {
                ewaste.text = value,
              }),
            ),

            SizedBox(
              height: 20,
            ),

            //submit button
            GestureDetector(
              onTap: () {

              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFA7C957),
                        Color(0xFF608A48),
                      ]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                
                height: 40,
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    ));
  }
}
