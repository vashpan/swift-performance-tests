//
//  PersonsGenerator.swift
//  Money
//
//  Created by Konrad Kołakowski on 26/02/2023.
//  Copyright © 2022 One Minute Games. All rights reserved.
//

public class PersonsGenerator {
    // MARK: Properties
    private static let names = [
        "Konrad", "Tomek", "Andrzej", "Piotrek", "Paweł", "Darek", "Piotr", "Franciszek",
        "Ania", "Marta", "Lena", "Laura", "Agnieszka", "Luiza", "Lucyna", "Ola", "Alina"
    ]

    private static let surnames = [ "Nowak", "Kowalski", "Wiśniewski", "Wójcik", "Kowalczyk", "Kamiński",
        "Lewandowski", "Zieliński", "Szymański", "Woźniak", "Dąbrowski", "Kozłowski",
        "Jankowski", "Mazur", "Wojciechowski", "Kwiatkowski", "Kaczmarek", "Piotrowski",
        "Grabowski", "Zając", "Król", "Olszewski", "Jabłoński", "Majewski", "Stępień",
        "Chmielewski", "Adamczyk", "Sikorski", "Mróz", "Czarnecki", "Witkowski", "Kubiak"
    ]

    private static func generatePersons(amount: Int) -> [Person] {
        var result = [Person]()
        for _ in 0..<amount {
            let person = Person(name: Self.names.randomElement()!, 
                                surname: Self.surnames.randomElement()!,
                                age: Int.random(in: 1...85))

            result.append(person)
        }

        return result
    }
}