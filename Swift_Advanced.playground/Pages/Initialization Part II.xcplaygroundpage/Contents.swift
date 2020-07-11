//: [Previous](@previous)

import Foundation

// Designated and Convenience initializers

class RocketComp {
  let model: String
  let serialNumber: String
  let reusable: Bool
  
  // Init #1a - Designated
  init(model: String, serialNumber: String, reusable: Bool) {
    self.model = model
    self.serialNumber = serialNumber
    self.reusable = reusable
  }
  
  // Init #1b - Convenience
  convenience init(model: String, serialNumber: String) {
    self.init(model: model, serialNumber: serialNumber, reusable: false)
  }
}

let payload = RocketComp(model: "RT-1", serialNumber: "234", reusable: false)
let fairing = RocketComp(model: "Serpent", serialNumber: "0")

// Subclassing

class RocketComponent: NSObject {
    let model: String
    let serialNumber: String
    let reusable: Bool
    
    init(model: String, serialNumber: String, reusable: Bool) {
      self.model = model
      self.serialNumber = serialNumber
      self.reusable = reusable
    }
}

class Tank: RocketComponent {
    let encasingMaterial: String // = "Aluminium" // default value for the stored property
    
    // Init #2a - Designated
    init(model: String, serialNumber: String, reusable: Bool, encasingMaterial: String) {
        self.encasingMaterial = encasingMaterial
        super.init(model: model, serialNumber: serialNumber, reusable: reusable)
    }
    
    // Init #2b - Designated
    override init(model: String, serialNumber: String, reusable: Bool) {
      self.encasingMaterial = "Aluminum"
      super.init(model: model, serialNumber: serialNumber, reusable: reusable)
    }
}

class LiquidTank: Tank {
  let liquidType: String

  // Init #3a - Designated
  init(model: String, serialNumber: String, reusable: Bool,
      encasingMaterial: String, liquidType: String) {
    self.liquidType = liquidType
    super.init(model: model, serialNumber: serialNumber, reusable: reusable,
      encasingMaterial: encasingMaterial)
  }
    
  // Init #3b - Convenience
  convenience init(model: String, serialNumberInt: Int, reusable: Bool,
      encasingMaterial: String, liquidType: String) {
    let serialNumber = String(serialNumberInt)
    self.init(model: model, serialNumber: serialNumber, reusable: reusable,
      encasingMaterial: encasingMaterial, liquidType: liquidType)
  }

  // Init #3c - Convenience
  convenience init(model: String, serialNumberInt: Int, reusable: Int,
    encasingMaterial: String, liquidType: String) {
      let reusable = reusable > 0
      self.init(model: model, serialNumberInt: serialNumberInt, reusable: reusable,
        encasingMaterial: encasingMaterial, liquidType: liquidType)
  }
  
  // Init #3d - Designated
  override init(model: String, serialNumber: String, reusable: Bool) {
    self.liquidType = "LOX"
    super.init(model: model, serialNumber: serialNumber,
      reusable: reusable, encasingMaterial: "Aluminum")
  }

  // Init #3e - Designated
  override init(model: String, serialNumber: String, reusable: Bool,
      encasingMaterial: String) {
    self.liquidType = "LOX"
    super.init(model: model, serialNumber: serialNumber, reusable:
      reusable, encasingMaterial: encasingMaterial)
  }
}

let fuelTank = Tank(model: "Athena", serialNumber:"003", reusable: true, encasingMaterial: "Aluminium")
let rp1Tank = LiquidTank(model: "Hermes", serialNumberInt: 5, reusable: 1,
encasingMaterial: "Aluminum", liquidType: "LOX")
//let liquidOxygenTank = Tank(identifier: "LOX-012", reusable: true)




// Designated and Convenience initializers in action

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

let meat = Food()
meat.name

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

//: [Next](@next)
