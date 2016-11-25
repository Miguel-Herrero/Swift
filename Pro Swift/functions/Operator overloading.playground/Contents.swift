/**
 Simple overriding the != operator.
 
 - Parameters:
    - lhs: Left hand side comparison.
    - rhs: Right hand side comparison.
 - Returns: Return if these two args are different.
 */
func !=(lhs: Int, rhs: Int) -> Bool {
    return true
}

print(4 != 4)


/**
 Adding to an existing operator.
 */
func *(lhs: [Int], rhs: [Int]) -> [Int] {
    /// Instead of checkinf “if lhs.count != rhs.count…”
    guard lhs.count == rhs.count else { return lhs }
    
    var result = [Int]()
    
    for (index, int) in lhs.enumerated() {
        result.append(int * rhs[index])
    }
    
    return result
}

let result = [1, 2, 3] * [1, 2, 3]


/**
    Adding a new operator
 */
import Foundation

infix operator **: ExponentiationPrecedence

precedencegroup ExponentiationPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: right
}

/**
 - Returns: One value raised to the power of another.
 - Parameters:
    - lhs: The base of the power.
    - rhs: The exponent of the power.
 */
func **(lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}

let powResult = 4 ** 3 ** 2 + 3



/**
 Modifying an operator.
 */
precedencegroup RangeFormationPrecedence {
    associativity: left
    higherThan: CastingPrecedence
}

infix operator  ... : RangeFormationPrecedence

func ...(lhs: CountableClosedRange<Int>, rhs: Int) -> [Int] {
    let downwards = (rhs ..< lhs.upperBound).reversed()
    return Array(lhs) + downwards
}

let range = 1...10...1
print(range)