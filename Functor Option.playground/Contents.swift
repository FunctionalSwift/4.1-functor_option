//: Playground - Functor Option

enum Option<A> {
    case none
    case some(A)
}

class TextField {
    let text: Option<String> = .none
}

func send(_ username: String) {
    //Logic to send username
}

func sendUserNameOrAlert(textField: TextField) {
    switch textField.text {
    case .none: print("ERROR: TextField empty")
    case let .some(username): send(username)
    }
}
