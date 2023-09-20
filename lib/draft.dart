import 'package:flutter/material.dart';

class Draft extends StatelessWidget {
  const Draft({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.menu),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text("Welcome back, Elsa!"),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text("What was the highlight of your day, so far?"),
          ),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
              ),
              prefix: Icon(Icons.search),
            ),
            style: TextStyle(

            ),
          )
        ],
      ),
    );
  }
}
