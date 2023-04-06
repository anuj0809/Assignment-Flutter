import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './seat_widget.dart';
import './contants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.pressed)
              ? Colors.white
              : Colors.white;
        }))),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _searchEmpty = true;
  late TextEditingController _searchController;
  late int selected;
  @override
  void initState() {
    super.initState();
    selected = 0;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Seat Finder', style: TextStyle(fontSize: 25)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: _searchController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        selected = int.parse(value);
                        _searchEmpty = false;
                      });
                    } else {
                      setState(() {
                        selected = 0;
                        _searchEmpty = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _searchController.clear();
                          _searchEmpty = true;
                          selected = 0;
                        });
                      },
                      child: const Icon(
                        Icons.close,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: denseBlue,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    hintText: 'Enter Seat Number...',
                    hintStyle: const TextStyle(
                        color: denseBlue, fontWeight: FontWeight.bold),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: denseBlue,
                        width: 10,
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  height: double.infinity,
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selected = _searchController.text.isEmpty
                            ? 0
                            : int.parse(_searchController.text);
                      });
                    },
                    style: TextButton.styleFrom(
                        elevation: 5,
                        backgroundColor:
                            _searchEmpty ? Colors.grey : Colors.blue),
                    child: const Text('Find'),
                  ),
                ),
              ],
            ),
          ),
          // const SeatWidget(),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return SeatWidget(count: (index), selected: selected);
              },
            ),
          )
        ],
      ),
    );
  }
}
