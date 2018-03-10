//: Playground - Functor Option

import Foundation

enum Option<A> {
    case none
    case some(A)
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
    static func from(json: String) -> Account {
        let dict = parse(json)
        
        return Account(name: dict["name"] as! String,
                       accountType: dict["accountType"] as! String,
                       email: dict["email"] as! String,
                       url: dict["url"] as! String)
    }
}
