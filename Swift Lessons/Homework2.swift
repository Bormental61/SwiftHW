//1. Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, 
//следующий аргумент это годовой процент, третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.
import Foundation

func rateCalc(dep: Double, perc: Double, term: Double) -> Double {
    let Pow = pow(1+perc/36500, term)
    return dep * Pow
}

print("При сумме вклада 50000 с годовым процентом 10 на срок 180 дней вы получите: ", rateCalc(dep: 50000, perc: 10, term: 180))

//2. Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.
//3. Добавить возможность получения названия пиццы через rawValue

enum pizzaType: String {
    case Pepperoni = "Pepperoni"
    case Sicilia = "Sicilia"
    case Margarita = "Margarita"
}

var Pep: pizzaType = .Pepperoni
var Sic: pizzaType = .Sicilia
var Mar: pizzaType = .Margarita

print(Pep.rawValue)

