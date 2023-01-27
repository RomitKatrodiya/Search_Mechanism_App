import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List users = [
    {"id": 1, "name": "Romit", "age": 18},
    {"id": 2, "name": "Nevil", "age": 19},
    {"id": 3, "name": "Parth", "age": 20},
    {"id": 4, "name": "Vivek", "age": 25},
    {"id": 5, "name": "Kevin", "age": 18},
    {"id": 6, "name": "Jay", "age": 23},
    {"id": 7, "name": "Kishan", "age": 28},
    {"id": 8, "name": "Hardik", "age": 20},
    {"id": 9, "name": "Meet", "age": 19},
    {"id": 10, "name": "Ram", "age": 11},
    {"id": 11, "name": "Om", "age": 30},
    {"id": 12, "name": "Raj", "age": 40},
    {"id": 13, "name": "Shyam", "age": 35},
    {"id": 14, "name": "Mahesh", "age": 33},
    {"id": 15, "name": "Ravi", "age": 20},
  ];

  List search = [];

  @override
  void initState() {
    super.initState();
    search = users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search Macenisum"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  counter: (search.length != users.length)
                      ? Text("${search.length}/${users.length}")
                      : null,
                  label: const Text("Search"),
                  hintText: "Search id, name and age hear",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (val) {
                  search = [];
                  if (val.isEmpty) {
                    search = users;
                  } else {
                    search = users
                        .where((element) =>
                            element["age"].toString().contains(val) ||
                            element["id"].toString().contains(val) ||
                            element["name"]
                                .toLowerCase()
                                .contains(val.toLowerCase()))
                        .toList();
                  }
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: (search.isEmpty)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 50,
                            color: Colors.blue.shade400,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "User Not Found",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: search.length,
                      itemBuilder: (context, i) {
                        return Card(
                          margin: const EdgeInsets.all(5),
                          child: ListTile(
                            leading: Text("${search[i]["id"]}"),
                            title: Text(search[i]["name"]),
                            trailing: Text("Age : ${search[i]["age"]}"),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
