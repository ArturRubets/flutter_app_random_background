import 'package:flutter/material.dart';
import 'randomColor.dart';

//виджет с изменяемым состоянием
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; //счетчик нажатий на экран
  RandomColor _randomColor; //обьект генерирующий случаный цвет

  _MyHomePageState(){
    _randomColor = new RandomColor();
  }

  // инкерементация счетчика и перестроение визуальной части приложения
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  //  вызов функции генерации нового цвета
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
        // при нажатии на экран вызываем функции
        onTap: () {
          _incrementCounter();
          _generateNewColor();
        },
        child: Container(
          alignment: Alignment.center,  // расположение дочернего элемента по центру, тем самым растягиваем контейнер по всему экрану
          decoration: BoxDecoration(
            color: _randomColor.color, // свойство возвращает обьект Color с заданым случайным цветом
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