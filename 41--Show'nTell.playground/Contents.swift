// Automatic Reference Counting (ARC)

// ARC only applies to instances of classes

// Struts & enums are value types not reference types
//and aren't stored & passed by reference

class Car
{
    let carType: String
    init(carType: String)
    {
        self.carType = carType
        print("\(carType) is being initalized")
    }
    deinit
    {
        print("\(carType) is being deinitialized")
    }
}

var reference1: Car?
var reference2: Car?
var reference3: Car?

reference1 = Car(carType: "Nissan")
reference2 = Car(carType: "Lamborghini")
reference3 = Car(carType: "BMW")

reference2 = reference1
reference3 = reference1

//class A
//instance
//{
//    class B {
//        let food = bread
//    }
//}

