//: Playground - Functor Option

import Foundation

enum Option<A> {
    case none
    case some(A)
    
    func map<B>(_ f: (A) -> B) -> Option<B> {
        switch self {
        case .none: return .none
        case let .some(a): return .some(f(a))
        }
    }
}

let json = """
{
"name": "Alex",
"accountType": "Premium",
"email": "alex@functionalhub.com",
"url": "www.functionalhub.com",
}
"""

struct Account {
    let name: String
    let accountType: String
    let email: String
    let url: String
}

func parse(_ response: String) -> [String: AnyObject] {
    let data = response.data(using: .utf8)!
    
    return try! JSONSerialization.jsonObject(with: data) as! [String: AnyObject]
}

extension Account {
    static func from(json: String) -> Option<Account> {
        let dict = parse(json)
        
        guard
            let name = dict["name"] as? String,
            let accountType = dict["accountType"] as? String,
            let email = dict["email"] as? String,
            let url = dict["url"] as? String else {
                return Option.none
        }
        
        return Option.some(Account(name: name,
                                   accountType: accountType,
                                   email: email,
                                   url: url))
    }
}

func doSomething(with account: Account) {
    print(account)
}

Account.from(json: json).map(doSomething)

