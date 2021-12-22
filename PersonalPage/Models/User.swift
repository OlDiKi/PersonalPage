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
            login: "login",
            password: "101",
            person: Person.init(name: "Dmitriy",
                                surname: "Oleyner",
                                aboutOne: "Hi! I am an ordinary man from St. Petersburg. 29 years",
                                aboutTwo: "I studied radio engineering at ETU'LETI' but I dont work in my specialty",
                                aboutThree: "Trying to learn the SWIFT to change the field of activity",
                                aboutFour: "Lover of bars, spicy food and walking with friends")
        )
    }
}


struct Person {
    let name: String
    let surname: String
    let aboutOne: String
    let aboutTwo: String
    let aboutThree: String
    let aboutFour: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

