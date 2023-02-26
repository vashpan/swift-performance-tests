

public struct Person {
    let name: String
    let surname: String
    let age: Int 
}

extension Person: CustomStringConvertible {
    public var description: String {
        return "\(name) \(surname), \(age) lat"
    }
}
