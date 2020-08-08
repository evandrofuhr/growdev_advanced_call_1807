import 'package:call_1807/models/car.dart';
import 'package:call_1807/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsPage extends StatefulWidget {
  static String routeName = '/items';
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  List<Car> _cars = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cars = Provider.of<List<Car>>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16 / 9,
          ),
          itemCount: _cars.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(DetailPage.routeName, arguments: _cars[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Hero(
                        tag: 'car_${_cars[index].name}',
                        child: FadeInImage(
                          image: NetworkImage(_cars[index].url),
                          placeholder: AssetImage('assets/loading.gif'),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Hero(
                        tag: 'favorite_${_cars[index].name}',
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
