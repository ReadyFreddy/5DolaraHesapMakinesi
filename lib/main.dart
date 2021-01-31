import 'package:flutter/material.dart';
import 'hesaplama_islemleri.dart';

void main() {
  runApp(MyApp());
}

var txtProcValues = TextEditingController();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'İNANILMAZ BİLİMSEL HESAP MAKİNESİ',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

RoundedRectangleBorder myBoxShape() {
  return RoundedRectangleBorder(
      side: BorderSide(color: Colors.blue, width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(50));
}

class FlexibleButtonContainerWidget extends StatelessWidget {
  final String btnText;
  final int flexValue;
  final bool isProc;
  final String procType;

  FlexibleButtonContainerWidget(this.btnText, this.flexValue,
      {this.isProc, this.procType})
      : assert(btnText != null && flexValue != null);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValue,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: myBoxDecoration(),
        child: FlatButton(
          onPressed: () {
            if (isProc == true) {
              switch (btnText) {
                case '=':
                  if (txtProcValues
                              .text[txtProcValues.text.characters.length - 1] !=
                          "+" &&
                      txtProcValues
                              .text[txtProcValues.text.characters.length - 1] !=
                          "-" &&
                      txtProcValues
                              .text[txtProcValues.text.characters.length - 1] !=
                          "/" &&
                      txtProcValues
                              .text[txtProcValues.text.characters.length - 1] !=
                          "*") {
                    String valuesProcs = txtProcValues.text;
                    String finalValue = calculateValues(valuesProcs);
                    txtProcValues.text = finalValue;
                  }

                  break;

                case '+':
                  if (txtProcValues
                              .text[txtProcValues.text.characters.length - 1] !=
                          "+" &&
                      isNumeric(txtProcValues
                          .text[txtProcValues.text.characters.length - 1])) {
                    txtProcValues.text = txtProcValues.text + '$btnText';
                  } else {
                    txtProcValues.text = txtProcValues.text
                            .substring(0, txtProcValues.text.length - 1) +
                        '$btnText';
                  }
                  break;

                case '-':
                  if (txtProcValues
                              .text[txtProcValues.text.characters.length - 1] !=
                          "-" &&
                      isNumeric(txtProcValues
                          .text[txtProcValues.text.characters.length - 1])) {
                    txtProcValues.text = txtProcValues.text + '$btnText';
                  } else {
                    txtProcValues.text = txtProcValues.text
                            .substring(0, txtProcValues.text.length - 1) +
                        '$btnText';
                  }
                  break;

                case '/':
                  if (txtProcValues
                              .text[txtProcValues.text.characters.length - 1] !=
                          "/" &&
                      isNumeric(txtProcValues
                          .text[txtProcValues.text.characters.length - 1])) {
                    txtProcValues.text = txtProcValues.text + '$btnText';
                  } else {
                    txtProcValues.text = txtProcValues.text
                            .substring(0, txtProcValues.text.length - 1) +
                        '$btnText';
                  }
                  break;

                case '*':
                  if (txtProcValues
                              .text[txtProcValues.text.characters.length - 1] !=
                          "*" &&
                      isNumeric(txtProcValues
                          .text[txtProcValues.text.characters.length - 1])) {
                    txtProcValues.text = txtProcValues.text + '$btnText';
                  } else {
                    txtProcValues.text = txtProcValues.text
                            .substring(0, txtProcValues.text.length - 1) +
                        '$btnText';
                  }
                  break;
              }
            } else {
              txtProcValues.text = txtProcValues.text + '$btnText';
            }
          },
          child: Text(
            '$btnText',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
      border: Border.all(), borderRadius: BorderRadius.circular(2));
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(fontSize: 17)),
      ),
      body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.all(5),
                            child: TextField(
                              controller: txtProcValues,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        new FlexibleButtonContainerWidget("C", 1, isProc: true),
                        new FlexibleButtonContainerWidget("/", 1, isProc: true),
                        new FlexibleButtonContainerWidget("*", 1, isProc: true),
                        new FlexibleButtonContainerWidget("-", 1, isProc: true),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    new FlexibleButtonContainerWidget("7", 1),
                                    new FlexibleButtonContainerWidget("8", 1),
                                    new FlexibleButtonContainerWidget("9", 1),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    new FlexibleButtonContainerWidget("4", 1),
                                    new FlexibleButtonContainerWidget("5", 1),
                                    new FlexibleButtonContainerWidget("6", 1),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    new FlexibleButtonContainerWidget("1", 1),
                                    new FlexibleButtonContainerWidget("2", 1),
                                    new FlexibleButtonContainerWidget("3", 1),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    new FlexibleButtonContainerWidget("0", 2),
                                    new FlexibleButtonContainerWidget(",", 1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              new FlexibleButtonContainerWidget("+", 2,
                                  isProc: true),
                              new FlexibleButtonContainerWidget("=", 2,
                                  isProc: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          )),
    );
  }
}
