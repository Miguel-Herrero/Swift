import Foundation


var set1 = Set<Int>([1, 2, 3, 4, 5])
var set2 = Set<Int>(1...100)

set1.insert(6)
if set1.contains(6) {
    print("Number 6 exists")
}
set1.remove(3)
if !set1.contains(3) {
    print("Number 3 does NOT exist anymore")
}

for number in set1.sorted() {
    print(number)
}


/**
    Set operations.
 */
let spaceships1 = Set(["Serenity", "Nostromo", "Enterprise"])
let spaceships2 = Set(["Voyager", "Serenity", "Executor"])

let union = spaceships1.union(spaceships2)
let intersection = spaceships1.intersection(spaceships2)
let difference = spaceships1.symmetricDifference(spaceships2)

let spaceships3 = Set(["Galactica", "Sulaco", "Minbari"])
let spaceships1and2 = spaceships1.union(spaceships2)

spaceships1.isSubset(of: spaceships1and2) // true
spaceships1.isSubset(of: spaceships1) // true
spaceships1.isSubset(of: spaceships2) // false
spaceships1.isStrictSubset(of: spaceships1and2) // true
spaceships1.isStrictSubset(of: spaceships1) // false

spaceships1and2.isSuperset(of: spaceships2) // true
spaceships1and2.isSuperset(of: spaceships3) // false
spaceships1and2.isStrictSuperset(of: spaceships1) // true

spaceships1.isDisjoint(with: spaceships2) // false


/**
    NSCountedSets
 */
var spaceships = ["Serenity", "Nostromo", "Enterprise"]
spaceships += ["Voyager", "Serenity", "Star Destroyer"]
spaceships += ["Galactica", "Sulaco", "Minbari"]

let countedSet = NSCountedSet(array: spaceships)

countedSet.count(for: "Serenity")// 2
countedSet.count(for: "Sulaco") // 1

for item in countedSet.allObjects as! [String] {
    print(item)
}