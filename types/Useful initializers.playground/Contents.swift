let heading = "This is a heading"

/// Repeating values in a String.
let underline = String(repeating: "=", count: heading.characters.count)

/// Multidimensional array.
var board = [[String]](repeating: [String](repeating: "", count: 10), count: 10)


/**
    Converting to and from Numbers.
 */
let str1 = String(6)
let int1 = Int("6a") // Returns nil when invalid number is passed. Integer should be unwrapped.
let int2 = Int("1989") ?? 0 // nil coalescing operator to provide a sensible default


/**
    Unique arrays.
 */
let scores = [5, 3, 6, 1, 3, 5, 3, 9]
let scoresSet = Set(scores) // Unordered.
let uniqueScores = Array(scoresSet) // Made array again.


/**
    Minimum capacity for Dictionaries.
 */
var dictionary = Dictionary<String, String>(minimumCapacity: 100) // Optimizes performance when allocating space.