import 'dart:math'; // библиотека для генерации случайного числа
import 'package:flutter/material.dart'; // библиотека для проектирования material дизайна

void main() {
  // начало программы
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

// класс для генерации 16 значного символа
class RandomHexSymbol{
  List _hexSymbols = ['0', '1', '2', '3', '4', '5' ,'6' ,'7',  '8', '9', 'A', 'B','C','D','E','F']; // массив 16 значных символов
  Random _random = new Random(); // класс Random для генерации случайного числа

   String get(){
    return _hexSymbols[_random.nextInt(_hexSymbols.length)];  // генерация числа от 0 до 15 и получения символа по индексу из массива
  }
}
//   класс генерирующий цвет
class RandomColor{
  Color color;  //  цвет
  RandomHexSymbol _hex; // 16 значный символ

  //  конструктор класса
  RandomColor() {
    _hex = new RandomHexSymbol(); //  обьект для генерации 16 значных символов
     generateColor(); //  вызов метода для начальной инициализации свойства  color
  }

  //  метод присваивает новое значение свойству color
  void generateColor(){
    String colorNew = '0xff' + _generateHexColor(); //  конкатенация строк для получения 16 значного числа в Dart
    colorNew = colorNew.replaceAll('#', '');  //  убираем лишний символ #
    int colorInt = int.parse(colorNew); //  преобразовуем в число
    color = Color(colorInt);  //  создаем обьект Color и передаем в конструктор код цвета и присваиваем свойству color
  }

  //  создание 16 значного кода цвета в формате #XXXXXX
  String _generateHexColor(){
    String hexColor = '#';
    //  цикл работает 6 раз для генерации 6 значного кода
    for( var i = 0 ; i < 6; i++ ) {
      hexColor +=_hex.get();  //  конкатенация строк
    }
    return hexColor;
  }
}






//виджет с изменяемым состоянием
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; //счетчик нажатий на экран
  RandomColor _randomColor = new RandomColor(); //обьект генерирующий случаный цвет

  // инкерементация счетчика и перестроение визуальной части приложения
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _generateNewColor() {
    setState(() {
      _randomColor.generateColor();
    });
  }

  //построение виджета
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GestureDetector(
        onTap: () {
          _incrementCounter(); // при нажатии увеличиваем счетчик
          _generateNewColor();
        },
        child: Container(
          alignment: Alignment.center,  // расположение дочернего элемента по центру, тем самым растягиваем контейнер по всему экрану
          decoration: BoxDecoration(
            color: _randomColor.color, // метод возвращает обьект Color с заданым случайным цветом,
            // при обновлении состояния приложения каждый раз вызывается эта функция
          ),
          child: Text(
            '$_counter',  // вывод счетчика, обращение через  $
            style: Theme.of(context).textTheme.headline1, // стиль для текста
          ),  // дочерний виджет Container, нужен для отображения счетчика
        ),  // базовый виджет для указания стилистики и размещения
      ),  // виджет реагирует на нажатие пользователя
    );  //Scaffold виджет заполняет доступное пространство
  }
}
