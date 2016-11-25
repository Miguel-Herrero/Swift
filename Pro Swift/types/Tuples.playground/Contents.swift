/**
    Closures.
 */
var singer = (first: "Taylor", last: "Swift", sing: { (lyrics: String) in
    print("I sing “\(lyrics)”") // Can't access first and last siblings from here :(
})

singer.sing("Haters gonna hate")
print(singer.last)



/**
    Returning multiples values.
 */
func fetchWeather() -> (type: String, cloudCover: Int, high: Int, low: Int) {
    return ("Sunny", 50, 32, 26)
}

let weather = fetchWeather()
weather.type

let (type, cloudCover, high, low) = fetchWeather()
type
cloudCover
high
low


/**
    Typealias
 */
let father = (first: "Scott", last: "Swift")
let mother = (first: "Andrea", last: "Finlay")

/// To many Strings!!!
func marryTaylorsParents(man: (first: String, last: String), woman: (first: String, last: String)) -> (husband: (first: String, last: String), wife: (first: String, last: String)) {
    return (man, (woman.first, man.last))
}

typealias Name = (first: String, last: String)

/// Rewritten with typealias:
func marryTaylorsParentsWithAlias(man: Name, woman: Name) -> (husband: Name, wife: Name) {
    return (man, (woman.first, man.last))
}