//
//  User.swift
//  PersonalPage
//
//  Created by Дмитрий Олейнер on 22.12.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "Dmitriy",
            password: "Oleyner101",
            person: Person.getPerson()
        )
    }
}


struct Person {
    let name: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Dmitriy", surname: "Oleyner", image: "SwiftImage")
    }
}
