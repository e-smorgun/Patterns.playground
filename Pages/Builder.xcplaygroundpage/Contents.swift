protocol CoffeeBuilder {
    func addCoffee()
    func addDoubleCoffee()
    func addMilk()
    func addCream()
    func addSugar()
    func addCinnamon()
    func addSyrup()
    func getCoffee() -> Coffee
}

class Coffee {
    var components: [String] = []
    
    func addComponent(component: String) {
        components.append(component)
    }
    
    func listComponents() {
        print("Кофе состоит из следующих компонентов:")
        for component in components {
            print("- \(component)")
        }
    }
}

class CoffeeBuilderImpl: CoffeeBuilder {
    var coffee: Coffee
    
    init() {
        coffee = Coffee()
    }
    
    func addCoffee() {
        coffee.addComponent(component: "Кофе")
    }
    
    func addDoubleCoffee() {
        coffee.addComponent(component: "Двойной кофе")
    }
    
    func addMilk() {
        coffee.addComponent(component: "Молоко")
    }
    
    func addCream() {
        coffee.addComponent(component: "Сливки")
    }
    
    func addSugar() {
        coffee.addComponent(component: "Сахар")
    }
    
    func addCinnamon() {
        coffee.addComponent(component: "Корица")
    }
    
    func addSyrup() {
        coffee.addComponent(component: "Сироп")
    }
    
    func getCoffee() -> Coffee {
        return coffee
    }
}

let coffeeBuilder = CoffeeBuilderImpl()
coffeeBuilder.addCoffee()
coffeeBuilder.addMilk()
coffeeBuilder.addSugar()
let coffee = coffeeBuilder.getCoffee()
coffee.listComponents()
