import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main()

{
  runApp(const App());
}

void addStudent(Map<String, dynamic> data) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.119:3000/read'), // Replace with your actual URL
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data), // Send the provided data
  );

  if (response.statusCode == 200) {
    print('Student added successfully');
  } else {
    print('Failed to add student - ${response.statusCode}');
    print(response.body);
  }
}





class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController name=TextEditingController();
    TextEditingController rollno=TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("app"),
        ),
        body: Container(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "name",
                  hintText: "enter name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),

              ),
              const SizedBox(height: 20,),
              TextField(
                controller: rollno,
                decoration: InputDecoration(
                  labelText: "rollno",
                  hintText: "enter rollno",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),

              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){

             Map<String,dynamic>data={
              'name':name.text,
              'rollno':rollno.text,
             };
             addStudent(data);

              },

                  child: const Text("Login"))

            ],
          ),
        ),
      ),
    );
  }
}

