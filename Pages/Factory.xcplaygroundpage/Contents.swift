class Delivery {
    var companyName: String
    var maxPayload: Double
    var maxDimensions: (length: Double, width: Double, height: Double)

    init(companyName: String, maxPayload: Double, maxDimensions: (length: Double, width: Double, height: Double)) {
        self.companyName = companyName
        self.maxPayload = maxPayload
        self.maxDimensions = maxDimensions
    }
}

class ShipDelivery: Delivery {
    var type: String

    init(companyName: String, maxPayload: Double, maxDimensions: (length: Double, width: Double, height: Double), type: String) {
        self.type = type
        super.init(companyName: companyName, maxPayload: maxPayload, maxDimensions: maxDimensions)
    }
}

class TrainDelivery: Delivery {
    var trackSize: Double
    var ballast: Bool

    init(companyName: String, maxPayload: Double, maxDimensions: (length: Double, width: Double, height: Double), trackSize: Double, ballast: Bool) {
        self.trackSize = trackSize
        self.ballast = ballast
        super.init(companyName: companyName, maxPayload: maxPayload, maxDimensions: maxDimensions)
    }
}

class PlainDelivery: Delivery {
    var type: String
    var transport: String

    init(companyName: String, maxPayload: Double, maxDimensions: (length: Double, width: Double, height: Double), type: String, transport: String) {
        self.type = type
        self.transport = transport
        super.init(companyName: companyName, maxPayload: maxPayload, maxDimensions: maxDimensions)
    }
}

class CarDelivery: Delivery {
    
}

class DeliveryFactory {
    static func createDelivery(country: String) -> Delivery {
        switch country {
        case "Россия":
            return TrainDelivery(companyName: "Железнодорожные перевозки", maxPayload: 50000, maxDimensions: (length: 50, width: 10, height: 10), trackSize: 1520, ballast: true)
        case "США":
            return ShipDelivery(companyName: "Морские перевозки", maxPayload: 100000, maxDimensions: (length: 60, width: 15, height: 15), type: "морской")
        case "Беларусь":
            return CarDelivery(companyName: "Автоперевозки", maxPayload: 30000, maxDimensions: (length: 40, width: 8, height: 8))
        case "Германия":
            return PlainDelivery(companyName: "Авиаперевозки", maxPayload: 20000, maxDimensions: (length: 30, width: 5, height: 5), type: "междугородние", transport: "грузовой")
        default:
            return Delivery(companyName: "Общая доставка", maxPayload: 5000, maxDimensions: (length: 20, width: 4, height: 4))
        }
    }
}


let delivery1 = DeliveryFactory.createDelivery(country: "Россия")
print("Компания:", delivery1.companyName)
print("Грузоподъемность:", delivery1.maxPayload)
print("Габариты:", delivery1.maxDimensions)
if let trainDelivery = delivery1 as? TrainDelivery {
    print("Размер колеи:", trainDelivery.trackSize)
    print("Наличие балласта:", trainDelivery.ballast)
}

let delivery2 = DeliveryFactory.createDelivery(country: "США")
print("Компания:", delivery2.companyName)
print("Грузоподъемность:", delivery2.maxPayload)
print("Габариты:", delivery2.maxDimensions)
if let shipDelivery = delivery2 as? ShipDelivery {
    print("Тип доставки:", shipDelivery.type)
}
