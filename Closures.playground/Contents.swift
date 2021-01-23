import UIKit

func travel (closure: (String) -> Void) {
    print("I am leaving")
    closure("London")
    print("I arrived!")
}

//travel { (place: String) in
//    print("I am going to \(place)!")
//}

travel {
    print("I Am going to \($0) in my car.")
}

func countDecorator () -> (_ text: String) -> Void {
    var count: Int = 0
    return {
        count += 1
        let newText = $0 + String(count)
        print(newText)
    }
}

var decoratedClosure = countDecorator()
decoratedClosure("Hi there")
decoratedClosure("Hi there")
decoratedClosure("Hi there")
decoratedClosure("Hi there")
decoratedClosure("Hi there")

