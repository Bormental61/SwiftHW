// 1. Создать перечисление с видами пиццы (хотя бы 4-5 кейсов).

enum pizzaType {
    case Pepperoni
    case Margarita
    case Sicilia
    case Seafood
    case Cheese
}
// 2. Создать структуру пиццы. Она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки 
// (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы.
// Подсказка: добавки лучше также сделать перечислением.

enum add {
    case halapenjo
    case mushrooms
    case olives
    case extraCheese
    case tomatoes
}

enum baseType {
    case thin
    case thick
}

struct Pizza {
    let cost: Double
    let type: pizzaType
    let base: baseType
    let extra: add
}

// 3. Создать класс пиццерии, добавить массив с возможными видами пиццы. 
// Переменная с массивом должна быть приватной. Массив задаётся в инициализаторе.
// 4. Написать в классе пиццерии функции для добавления нового вида пиццы и для получения всех доступных пицц.

class Pizzeria {
    private var pizzas: [Pizza]
    
    init() {
        self.pizzas = []
    }

    func addPizza(pizza: Pizza) {
        pizzas.append(pizza)
    }
    
    func getAllPizzas() -> [Pizza] {
        return pizzas
    }
}

// 5. Создать экземпляр класса пиццерии и добавить в него несколько видов пицц.

let pizzeria = Pizzeria()

let pepperoniPizza = Pizza(cost: 450.00, type: .Pepperoni, base: .thick, extra: .halapenjo)
let margaritaPizza = Pizza(cost: 400.00, type: .Margarita, base: .thin, extra: .tomatoes)
let siciliaPizza = Pizza(cost: 500.00, type: .Sicilia, base: .thin, extra: .olives)
let seafoodPizza = Pizza(cost: 650.00, type: .Seafood, base: .thick, extra: .mushrooms)
let cheesePizza = Pizza(cost: 350.00, type: .Cheese, base: .thin, extra: .extraCheese)

pizzeria.addPizza(pizza: pepperoniPizza)
pizzeria.addPizza(pizza: margaritaPizza)
pizzeria.addPizza(pizza: siciliaPizza)
pizzeria.addPizza(pizza: seafoodPizza)
pizzeria.addPizza(pizza: cheesePizza)

let allPizzas = pizzeria.getAllPizzas()
for i in allPizzas {
    print("***")
    print("Pizza: \(i.type)")
    print("Base Type: \(i.base)")
    print("Added: \(i.extra)")
    print("Price: \(i.cost) RUB")
    print("***")
}



