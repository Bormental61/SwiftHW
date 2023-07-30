/* 1. Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность.
Должностей пока может быть две: или кассир, или повар.
Добавить в класс пиццерии массив с работниками.
   2. Создать класс столика. В нём должны быть свойство, в котором содержится количество мест, и функция, 
которая на вход принимает количество гостей, которое хотят посадить, возвращает true, если места хватает, и false, 
если места не хватает. Изначальное количество мест задаётся в инициализаторе.
   3. Добавить в класс пиццерии свойство, в котором хранится массив столиков. 
У класса столика добавить свойство, в котором хранится кафе, в котором стоит столик. Столики создаются сразу в инициализаторе, 
не передаются туда в качестве параметра.
*/

enum Position {
    case cashier
    case cook
}

struct PizzeriaEmployee {
    var name: String
    var salary: Double
    var position: Position
}

class Pizzeria {
    var employees: [PizzeriaEmployee] = []
    var tables: [Table] = []

    init(numOfTables: Int) {
        for _ in 1...numOfTables {
            let table = Table(pizzeria: self)
            tables.append(table)
        }
    }
}

class Table {
    weak var pizzeria: Pizzeria?
    
    init(pizzeria: Pizzeria) {
        self.pizzeria = pizzeria
    }
    
    var seats: Int
    
    init(seats: Int) {
        self.seats = seats
    }
    
    func checkSeats(for guests: Int) -> Bool {
        return seats >= guests
    }
}
