/**
 *  Destructuring a tuple.
 */
func getPerson() -> (String, Int) {
    return ("Taylor Swift", 26)
}

let (name, age) = getPerson()
print("\(name) is \(age) years old")

let (_, newAge) = getPerson()
print("This person is \(newAge) years old")


/**
 *  Swapping values.
 */
var a = 10
var b = 30
print("Old a was \(a) and b was \(b), but now \((b, a) = (a, b)) a is \(a) and b is \(b))")
