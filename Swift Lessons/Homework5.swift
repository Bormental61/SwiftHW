/* 1. Создать протокол для меню. Протокол должен содержать стоимость и наименование. Стоимость и название должны быть get-only.
   2. Создайте класс кафе, в нём должен быть массив с наименованиями меню и инициализатор. 
   Подпишите структуру чая с прошлого занятия на протокол из первого пункта. В качестве name должен быть вид чая и “tea”. 
   Например, для чёрного чая должно быть black tea, а для зелёного green tea.
   3. Создайте ещё 3 кафе, для которых класс Cafe будет родительским.\
   4. Добавить в родительский класс функцию (add) по добавлению новой позиции в меню. Саму переменную меню сделать приватной, 
   если она ещё таковой не является.
   5. Сделать так, чтобы в первом из трёх классов наследников (например, FirstCafe) функция add помимо того, 
   что выполняла всё тоже самое, что и в родительском классе, печатала в консоль стоимость добавляемой позиции.
   6. Создать класс автомата с едой, не реализовывать в нём ни методов, ни свойств, 
   однако, этот класс должен уметь делать всё тоже самое, что и FirstCafe.
   7. Сделать так, чтобы от класса автомата с напитками нельзя было наследоваться.
*/

protocol Menu {
    var cost: Double { get }
    var name: String { get }
}

struct Tea: Menu {
    let name: String
    let cost: Double
    
    init(name: String, cost: Double) {
        self.name = name + " tea"
        self.cost = cost
    }
}

class Cafe {
    private var menu: [Tea]
    
    init(menu: [Tea]) {
        self.menu = menu
    }
    
    func add(item: Tea) {
        menu.append(item)
    }
}

class FirstCafe: Cafe {
    override func add(item: Tea) {
        super.add(item: item)
        print("The cost of \(item.name) is \(item.cost) RUB")
    }
}

class SecondCafe: Cafe {
}

class ThirdCafe: Cafe {
}

final class VendMachine: FirstCafe {
}

let blackTea = Tea(name: "Black", cost: 50.0)
let greenTea = Tea(name: "Green", cost: 55.0)

let cafe = FirstCafe(menu: [blackTea, greenTea])

let whiteTea = Tea(name: "White", cost: 75.0)

cafe.add(item: whiteTea)
