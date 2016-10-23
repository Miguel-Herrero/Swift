/**
 Variadic function that has infinite arity (infinite number of args)
 - Parameter numbers: Accepts infinite numbers as parameter.
 - Returns: The total sum of passed numbers.
 */
func add(numbers: Int...) -> Int {
    var total = 0
    
    for number in numbers {
        total += number
    }
    
    return total
}

add(numbers: 1, 2, 3, 4, 5, 6)


/**
 Other example is print()
 */
print(1, 2, 3, 4, 5, 6, separator: ", ", terminator: "!")