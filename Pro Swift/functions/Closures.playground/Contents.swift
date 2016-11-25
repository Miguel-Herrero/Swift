let greetingPerson = { (name: String) in
    print("Hello, \(name)!")
}

// Closures are reference type.
let greetCopy1 = greetingPerson
greetCopy1("Taylor")

// Closure as a parameter.
func runSomeClosure(_ closure: (String) -> Void) {
    closure("Closure")
}

runSomeClosure(greetingPerson)


/**
    Closure capturing
 */
func testCapture() -> () -> Void {
    var counter = 0
    
    return {
        counter += 1
        print("Counter is now \(counter)")
    }
}

let greetPerson = testCapture() // Here closure is just returned, not called. counter no longer exists after finished returning.
greetPerson() // This captured counter var and its reference, so it can still use it.
greetPerson()
greetPerson()

let greetCopy = greetPerson // As closures are reference type, this uses the same copy as greetPerson.
greetCopy() // So this still points to the same counter reference and increments it.
greetPerson()
greetCopy()



/**
    Closure shorthand syntax.
    Equivalent shorthands for closures.
 */
let names = ["Michael Jackson", "Taylor Swift", "Michael Caine", "Adele Adkins", "Michael Jordan"]

let result1 = names.filter({ (name: String) -> Bool in
    return name.hasPrefix("Michael")
}).count

let result2 = names.filter({ name in
    return name.hasPrefix("Michael")
}).count

let result3 = names.filter({ name in
    name.hasPrefix("Michael")
}).count

let result4 = names.filter { $0.hasPrefix("Michael") }.count



/***** Functions as closures. ******/
import Foundation

/**
    Contains.
 */
let words = ["1989", "Fearless", "Red"]
let input = "My favorite album is Fearless"
words.contains(where: input.contains) // For each word, checks the input.


/**
    Reduce.
 */
let numbers = [1, 3, 5, 7, 9]
numbers.reduce(0, { (result, int) -> Int in
    return result + int
})

numbers.reduce(0, { $0 + $1 })

print(numbers.reduce(0, +)) // Pass only the operator (function that already sums) between the two integers.