import UIKit

/**
 *  Evaluating a tuple.
 *  With partial matching (string or _)
 */
let name = "twostraws"
let password = "fr0st1es"

switch (name, password) {
case ("bilbo", _):
    print("Hello, Bilbo Baggins!")
case ("twostraws", let password): // With partial matching (_ too)
    print("Hello, Miguel Herrero! Your password is \(password)")
default:
    print("Authentication failed")
}


/**
 * Evaluating calculated tuple.
 * Different conditions evaluated at once in a tuple.
 */
let number = 3

switch (number % 2 == 0, number % 2 != 0) {
case (true, true):
    print("¿Imposible?")
case (true, false):
    print("Par")
case (false, true):
    print("Impar")
case (false, false):
    print("¿Imposible?")
}


/**
 *  Loops.
 *  Filter values for loop with a switch case tuple.
 */
let twostraws = (name: "twostraws", password: "fr0st1es")
let bilbo = (name: "bilbo", password: "bagg1n5")
let taylor = (name: "taylor", password: "fr0st1es")
let users = [twostraws, bilbo, taylor]

for case let (name, "fr0st1es") in users {
    print("User \(name) has the password \(password)")
}


/**
 *  Matching optionals.
 */
let matchingName: String? = "twostraws"
let matchingPassword: String? = "fr0st1es"

switch (matchingName, matchingPassword) {
case let (.some(name), .some(password)):
    print("Hello, \(name)")
case let (.some(name), .none):
    print("Please enter a password.")
default:
    print("Who are you?")
}


/**
 *  Filter nil values in a loop
 */
let data: [Any?] = ["Bill", nil, 69, "Ted"]
for case let .some(datum) in data {
    print(datum)
}


/**
 *  Matching ranges
 */
let age = 19

if (0 ..< 18).contains(age) {
    print("You have the energy and time, but not the money")
} else if (18 ..< 70).contains(age) {
    print("You have the energy and money, but not the time")
} else {
    print("You have the time and money, but not the energy")
}


/**
 *  Matching enums & associated values creating an associated type,
 *  binding a local constant to it,
 *  but also using that binding to filter for specific values.
 */
enum WeatherType {
    case cloudy(coverage: Int)
    case sunny
    case windy
}

let today = WeatherType.cloudy(coverage: 80)

switch today {
case .cloudy(let coverage) where coverage == 0:
    print("You must live in Death Valley")
case .cloudy(let coverage) where (1...50).contains(coverage):
    print("It's a bit cloudy, with \(coverage)% coverage")
case .cloudy(let coverage) where (51...99).contains(coverage):
    print("It's very cloudy, with \(coverage)% coverage")
case .cloudy(let coverage) where coverage == 100:
    print("You must live in the UK")
case .windy:
    print("It's windy")
default:
    print("It's sunny")
}


/**
 * Mathing associated values in a loop.
 */
let forecast: [WeatherType] = [.cloudy(coverage: 40), .sunny, .windy, .cloudy(coverage: 100), .sunny]

for case let .cloudy(coverage) in forecast {
    print("It's cloudy with \(coverage)% coverage")
}


/**
 * Using the WHERE keyword.
 */
let celebrities = ["Michael Jackson", "Taylor Swift", "Michael Caine", "Adele Adkins", "Michael Jordan"]

for name in celebrities where name.hasPrefix("Michael") && name.characters.count == 13 {
    print(name)
}