import UIKit

var str = "Hello, playground"

func sayHello(to name: String, nicely: Bool = false) {
    if nicely == true {
        print("Hi there lovely \(name).")
    }
    else {
        print("Hi there \(name).")
    }
}

sayHello(to: "Julius", nicely: true)

enum passwordError: Error {
    case obvious
}
// Throws an error or returns a Bool
func checkPassword(password: String) throws -> Bool {
    if password == "password" {
        throw passwordError.obvious
    }
    else {
        return true
    }
}
do {
    try checkPassword(password: "password")
        print("Sucessfully created password.")
} catch {
    print("Invalid password.")
}

var present_here = ["Putri", "Teun", "Julius"]
extension Collection {
    func summarize() {
        print("There are \(self.count) of us.")
    }
}
present_here.summarize()
