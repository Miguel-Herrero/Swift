func inspect<T>(_ value: T) {
    print("Received \(type(of: value)) with the value \(value)")
}

inspect("Haters gonna hate")
inspect(56)


// Advantage over Any: both parameters have to be of the same type.
func inspectBoth<T>(_ value1: T, _ value2: T) {
    print("1. Received \(type(of: value1)) with the value \(value1)")
    print("2. Received \(type(of: value2)) with the value \(value2)")
}
// inspectBoth(2, "Name") // Errors


/**
    Limiting generics.
    We create a protocol so other types that aren't Int can be used as Int and mutliplied.
 */
func square<T: Numeric>(_ value: T) -> T {
    return value * value
}

protocol Numeric {
    static func *(lhs: Self, rhs: Self) -> Self
}

extension Float: Numeric {}
extension Double: Numeric {}
extension Int: Numeric {}

square(42)
square(42.556)


/**
    Creating a generic data type.
 */
struct deque<T> {
    var array = [T]()
    
    mutating func pushBack(_ obj: T) {
        array.append(obj)
    }
    
    mutating func pushFront(_ obj: T) {
        array.insert(obj, at: 0)
    }
    
    mutating func popBack() -> T? {
        return array.popLast()
    }
    
    mutating func popFront() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
}

var testDeque = deque<Int>()
testDeque.pushBack(5)
testDeque.pushFront(2)
testDeque.pushFront(1)
testDeque.popBack()


/**
    Working with Cocoa types: NSCountedSet
 */
import Foundation

struct CustomCountedSet<T: Any> {
    let internalSet = NSCountedSet()
    
    mutating func add(_ obj: T) {
        internalSet.add(obj)
    }
    
    mutating func remove(_ obj: T) {
        internalSet.remove(obj)
    }
    
    mutating func count(for obj: T) -> Int {
        return internalSet.count(for: obj)
    }
}

var countedSet = CustomCountedSet<String>()
countedSet.add("Hello")
countedSet.add("Hello")
countedSet.count(for: "Hello")