import 'package:flutter/material.dart';
import 'randomHexSymbol.dart';

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