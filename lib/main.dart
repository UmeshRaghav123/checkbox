import 'package:flutter/material.dart';

import 'modal/checkbox.dart';

// import 'model/listModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CheckBox', ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isChecked = false;
  final allchecked = CheckBoxModal(title: 'All Checked');
  TextEditingController _textEditingController = TextEditingController();
  final checkBoxList = [
    CheckBoxModal(title: 'CheckBox 1'),
    CheckBoxModal(title: 'CheckBox 2'),
    CheckBoxModal(title: 'CheckBox 3'),
  ];

  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                ListTile(
                  onTap: ()=> onAllClicked(allchecked),
                  leading: Checkbox(
                    value: allchecked.value,
                    onChanged: (value) {
                      setState(() {
                        allchecked.value = !allchecked.value;
                      });
                    },
                  ),
                  title: Text(allchecked.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Divider(),
                ...checkBoxList.map((item) =>
                    ListTile(
                      onTap: ()=> onItemClicked(item),
                      leading: Checkbox(
                        value: item.value,
                        onChanged: (value) => onItemClicked(item),
                      ),
                      title: Text(item.title,
                        style: TextStyle(fontSize: 20,),),
                    ),
                ).toList()
              ],
            )
        )
    );
  }
  onAllClicked(CheckBoxModal cbkItem){
    final newValue = !cbkItem.value;
    setState(() {
      cbkItem.value = !cbkItem.value;
      checkBoxList.forEach((element) {
        element.value =  !cbkItem.value;
      });
    });
  }

  onItemClicked(CheckBoxModal cbkItem){
    setState(() {
      cbkItem.value = !cbkItem.value;

    });
  }
}


