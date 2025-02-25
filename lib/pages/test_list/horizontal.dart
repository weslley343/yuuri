import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HorizontalListScreen extends StatefulWidget {
  @override
  _HorizontalListScreenState createState() => _HorizontalListScreenState();
}

class _HorizontalListScreenState extends State<HorizontalListScreen> {
  List<dynamic> data = [];
  PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal List with API Data'),
      ),
      body: data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              onPageChanged: (index) {
                if (index == 1) {
                  _pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 300,
                    child: Card(
                      color: Colors.amberAccent,
                      elevation: 5,
                      child: Center(
                        child: ListTile(
                          title: Text(data[index]['title']),
                          subtitle: Text(data[index]['body']),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HorizontalListScreen(),
  ));
}