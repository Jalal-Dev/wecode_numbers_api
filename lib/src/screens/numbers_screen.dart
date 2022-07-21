import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wecode_numbers_api/src/services/numbers_services.dart';

class NumberScreen extends StatefulWidget {
  NumberScreen({Key? key}) : super(key: key);

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  Services Serv = new Services();

  TextEditingController _numberController = new TextEditingController();   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Text(
              'Numbers',
              // ignore: prefer_const_constructors
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            
            Text('${_numberController.value.text ?? null }'),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _numberController,
                      decoration: InputDecoration(
                          hintText: 'Number Input',
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(padding: EdgeInsets.all(18),
                    child: ElevatedButton.icon(
                      onPressed: (){
                        setState(() {
                      });},
                      icon: Icon(Icons.search),
                      label: Text('Search')))
                ], 
                
              ),
            ),
            _numberController.value.text=='' ? Container(child: Text('Hello Enter a number'),): Container(
              width: 350,
              height: 100,
              child: FutureBuilder<String>(
                  future: Serv.getNumberInformation(_numberController.value.text==""? '20': _numberController.value.text ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.data == null) {
                      return Text('No Data');
                    }
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${snapshot.data}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
