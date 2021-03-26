import 'dart:math'; // библиотека для генерации случайного числа

// класс для генерации 16 значного символа
class RandomHexSymbol{
  List _hexSymbols; // массив 16 значных символов
  Random _random; // класс Random для генерации случайного числа

  RandomHexSymbol(){
    _random = new Random();
    _hexSymbols = ['0', '1', '2', '3', '4', '5' ,'6' ,'7',  '8', '9', 'A', 'B','C','D','E','F'];
  }

  String get(){
    return _hexSymbols[_random.nextInt(_hexSymbols.length)];  // генерация числа от 0 до 15 и получения символа по индексу из массива
  }
}