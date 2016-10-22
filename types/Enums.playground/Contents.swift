enum Color: String {
    case unknown = ""
    case blue = "bcdce6"
    case green // Swift automatically stringifies the name to its raw value.
    case pink = "a6d7s4"
    case purple = "h8h9k5"
    case red = "d7d7d7"
    
    var description: String {
        switch self {
        case .unknown:
            return "the color of magic"
        case .blue:
            return "the color of the sky"
        case .green:
            return "the color of grass"
        case .pink:
            return "the color of carnations"
        case .purple:
            return "the color of rain"
        case .red:
            return "the color of desire"
        }
    }
    
    func forBoys() -> Bool {
        return true
    }
    
    func forGirls() -> Bool {
        return true
    }
}

enum Country: Int {
    case unknown = 3 // Swift automatically starts counting from this value.
    case Spain, USA, France, Japan
}

struct Toy {
    let name: String
    let color: Color
    let country: Country
}

let barbie = Toy(name: "Barbie", color: .green, country: .USA)
let raceCar = Toy(name: "Lightning Mcqueen", color: .red, country: .France)


/**
    Raw values.
 */
/// Swift automatically stringifies the enum value
barbie.color.rawValue

/// Swift automatically increments values for Int enums from first item's value (0 by default)
raceCar.country.rawValue

/// nil coalescing for Enum's raw value.
let Russia = Country(rawValue: 17) ?? Country.unknown


/**
    Computed properties and methods.
 */
barbie.color.description
raceCar.color.forBoys()