import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/counter.dart';
import 'providers/colores.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => setColors()),
        ChangeNotifierProvider(create: (context) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final setColores = Provider.of<setColors>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.60,
            margin: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: setColores.color,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Consumer<Counter>(builder: (context, counter, child) {
              return Center(
                  child: Text("${counter.count}",
                      style: TextStyle(
                          fontSize: 72, color: setColores.textcolor)));
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                child: Text(
                  "BLACK",
                  style: TextStyle(color: Colors.grey[200]),
                ),
                color: Colors.black87,
                onPressed: () {
                  context.read<setColors>().setBlack();
                  final snackBar = SnackBar(
                    content: Text("Cambiando a color negro...",
                        style: TextStyle(color: Colors.white)),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.black,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              MaterialButton(
                child: Text(
                  "RED",
                  style: TextStyle(color: Colors.grey[200]),
                ),
                color: Colors.red,
                onPressed: () {
                  context.read<setColors>().setRed();
                  final snackBar = SnackBar(
                    content: Text("Cambiando a color rojo...",
                        style: TextStyle(color: Colors.white)),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.red,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              MaterialButton(
                child: Text(
                  "BLUE",
                  style: TextStyle(color: Colors.grey[200]),
                ),
                color: Colors.blue,
                onPressed: () {
                  context.read<setColors>().setBlue();
                  final snackBar = SnackBar(
                    content: Text("Cambiando a color azul...",
                        style: TextStyle(color: Colors.white)),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.blue,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              MaterialButton(
                child: Text(
                  "GREEN",
                  style: TextStyle(color: Colors.grey[200]),
                ),
                color: Colors.green,
                onPressed: () {
                  context.read<setColors>().setGreen();
                  final snackBar = SnackBar(
                    content: Text("Cambiando a color verde...",
                        style: TextStyle(color: Colors.white)),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.green,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                maxRadius: 30,
                minRadius: 20,
                child: IconButton(
                  tooltip: "Sumar 1 cuenta",
                  icon: Icon(Icons.add),
                  color: Colors.grey[200],
                  onPressed: () {
                    context.read<Counter>().increment();
                  },
                ),
              ),
              CircleAvatar(
                maxRadius: 30,
                minRadius: 20,
                child: IconButton(
                  tooltip: "Restar 1 cuenta",
                  icon: Icon(Icons.remove),
                  color: Colors.grey[200],
                  onPressed: () {
                    context.read<Counter>().decrement();
                  },
                ),
              ),
              CircleAvatar(
                maxRadius: 30,
                minRadius: 20,
                child: IconButton(
                  tooltip: "Reiniciar cuenta",
                  icon: Icon(Icons.restart_alt),
                  color: Colors.grey[200],
                  onPressed: () {
                    context.read<Counter>().restart();
                    context.read<setColors>().setGrey();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
