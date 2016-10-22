class Singer {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    // Executed only once and when called for the first time.
    lazy var reversedName: String = {
        return "\(self.name) backwards is \(String(self.name.characters.reversed()))!"
    }() // “Non-escaping” closure, can't be stored, self is unowned, and optimizable by compiler.
    
    lazy var capitalName: String = self.getCapitalName()
    
    // Isolating a lazy method
    private func getCapitalName() -> String {
        return "\(name) capitalized is \(name.uppercased())!"
    }
}

let taylor = Singer(name: "Taylor Swift")
print(taylor.reversedName) // Lazy variable
print(taylor.capitalName) // Lazy method


/**
 *  Lazy singletons
 */
class MusicPlayer {
    init() {
        print("Ready to play songs!")
    }
}

class Singer2 {
    // This property is shared by the class rather than instances of the class.
    // All Swift static let singletons are automatically lazy.
    static let musicPlayer = MusicPlayer()
    
    init() {
        print("Creating a new singer")
    }
}

let taylor2 = Singer2()
Singer2.musicPlayer


/**
 *  Lazy sequences
 */
func fibonacci(of num: Int) -> Int {
    if num < 2 {
        return num
    } else {
        return fibonacci(of: num - 1) + fibonacci(of: num - 2)
    }
}

let fibonacciSequence = Array(0...20).lazy.map(fibonacci) // Lazy execution until 10, instead of all array items (until 20)
print(fibonacciSequence[10]) // It has no memoization, so it will be recalculated each time it's asked.