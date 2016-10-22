/**
    Comparable types.
 */
var names = ["Taylor", "Timothy", "Tyler", "Thomas", "Tobias", "Tabitha"]
let numbers = [5, 3, 1, 9, 5, 2, 7, 8]

names.sort()
let namesSorted = names.sorted()

numbers.min()
numbers.max()

names.min()
names.max()


/**
    Conformimng to Comparable.
 */
struct Dog: Comparable {
    var breed: String
    var age: Int
    
    // To conform to Comparable, we need these two functions.
    static func <(lhs: Dog, rhs: Dog) -> Bool {
        return lhs.breed < rhs.breed // We specify by what field we'd like to sort.
    }
    
    static func ==(lhs: Dog, rhs: Dog) -> Bool {
        return lhs.age == rhs.age
    }
}

let poppy = Dog(breed: "Poodle", age: 5)
let rusty = Dog(breed: "Labrador", age: 2)
let rover = Dog(breed: "Corgi", age: 11)
var dogs = [poppy, rusty, rover]

// Now we can sort our Array.
dogs.sort()


/**
    Adding and removing items.
 */
let beethoven = Dog(breed: "St Bernard", age: 8)
dogs += [beethoven]

if let dog = dogs.popLast() {
    print("Last item popped was of breed \(dog.breed) and age \(dog.age)")
}

dogs.count
dogs.removeFirst() // Not optional like popLast…
dogs.count



/**
    Emptyness and capacity.
 */
import Foundation

dogs.isEmpty

/*let start = CFAbsoluteTimeGetCurrent()

var array = Array(1...1000000)
array.reserveCapacity(1000000)
array.reserveCapacity(1000000)

let end = CFAbsoluteTimeGetCurrent() - start
print("Took \(end) seconds")*/


/**
    Contiguous arrays. They are 50 % faster than Arrays.
 */
/*let array2 = Array<Int>(1...1000000)
let array3 = ContiguousArray<Int>(1...1000000)

var start = CFAbsoluteTimeGetCurrent()
array2.reduce(0, +)
var end = CFAbsoluteTimeGetCurrent() - start
print("Took \(end) seconds") // 0.50 seconds

start = CFAbsoluteTimeGetCurrent()
array3.reduce(0, +)
end = CFAbsoluteTimeGetCurrent() - start
print("Took \(end) seconds") // 0.25 seconds */