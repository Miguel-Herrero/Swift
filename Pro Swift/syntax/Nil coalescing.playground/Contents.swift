/**
 *  Nil coalescing operator
 */
let name: String? = nil
print(name ?? "Anonymous")
let unwrappedName = name ?? "Anonymous"
print(unwrappedName)


/**
 *  Nil coalescing with try keyword.
 */
let savedText = /*(try? String(contentsOfFile:"saved.txt")) ??*/ "Hello, world!"
print(savedText)


/**
 *  Guard.
 *  It exits any scope if precondition fails,
 *  and allows to use that variable out of that original scope.
 */
func giveAward(to name: String) {
    guard name == "Taylor Swift" else {
        print("No way!")
        return
    }
    
    print("Congratulations, \(name)!")
}

giveAward(to: "Taylor Swift")

func giveAward(to name: String?) {
    guard let winner = name else {
        print("No one won the award")
        return
    }
    
    // With guard, we can use winner out ot original scope.
    print("Congratulations, \(winner)!")
}

for i in 1...100 {
    // We can exit any scope if precondition fails.
    guard i % 8 == 0 else { continue }
    
    //print(i)
}

// Alternative with Where.
for i in 1...100 where i % 8 == 0 {
    //print(i)
}