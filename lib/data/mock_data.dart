import 'package:call_1807/models/car.dart';
import 'package:call_1807/models/user.dart';

abstract class MockData {
  static User logedUser;

  static List<User> users = [
    User(
        email: 'evandrofuhr@gmail.com',
        name: 'Evandro Führ',
        password: '123456'),
    User(email: 'edson@gmail.com', name: 'Edson Martins', password: '123456'),
    User(email: 'marcelo@gmail.com', name: 'Marcelo ', password: '123456'),
    User(email: '', name: 'Edson Martins', password: ''),
  ];

  static List<Car> cars = [
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/02-images/cruze-premier.png?imwidth=960',
      name: 'Carro 1',
      description: 'Descrição carro 1',
    ),
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/02-images/cruze-sport6-premier.png?imwidth=960',
      name: 'Carro 2',
      description: 'Descrição carro 2',
    ),
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/master/portuguese/index/cars/2018-cruze-sport6/colorizer/01-images/novo-cruze-sport6-2018-azul-petroleo-mov-intro-03.png?imwidth=960',
      name: 'Carro 3',
      description: 'Descrição carro 3',
    ),
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/01-images/onix-plus-premier.jpg?imwidth=960',
      name: 'Carro 4',
      description: 'Descrição carro 4',
    ),
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/01-images/cobalt.png?imwidth=960',
      name: 'Carro 5',
      description: 'Descrição carro 5',
    ),
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/02-images/joy-plus.png?imwidth=960',
      name: 'Carro 6',
      description: 'Descrição carro 6',
    ),
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/01-images/joy-black-edition.png?imwidth=960',
      name: 'Carro 7',
      description: 'Descrição carro 7',
    ),
    Car(
      url:
          'https://conteudo.imguol.com.br/c/entretenimento/52/2020/03/30/chevrolet-onix-plus-turbo-lt-2020-1585600678927_v2_1920x1080.png',
      name: 'Carro 8',
      description: 'Descrição carro 8',
    ),
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/02-images/cruze-premier.png?imwidth=960',
      name: 'Carro 9',
      description: 'Descrição carro 9',
    ),
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/01-images/cruze-sport6.png?imwidth=960',
      name: 'Carro 10',
      description: 'Descrição carro 10',
    ),
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/electric/2020-bolt-ev/colorizer/br-bolt-vermelho-glory.jpg?imwidth=960',
      name: 'Carro 11',
      description: 'Descrição carro 11',
    ),
    Car(
      url:
          'https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/segmento-carros/02-images/onix-premier.png?imwidth=960',
      name: 'Carro 12',
      description: 'Descrição carro 12',
    ),
    Car(
      url: 'https://www.acordacidade.com.br/fotos/p/66973-3.jpg',
      name: 'Carro 13',
      description: 'Descrição carro 13',
    ),
    Car(
      url:
          'https://www.pngkey.com/png/detail/293-2933573_vw-polo-colours-guide-and-prices-carwow-png.png',
      name: 'Carro 14',
      description: 'Descrição carro 14',
    ),
    Car(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7HH0UY5SqbiPbHvy6tmgqAl6CNSyEy0jSag&usqp=CAU',
      name: 'Carro 15',
      description: 'Descrição carro 15',
    ),
  ];
}
