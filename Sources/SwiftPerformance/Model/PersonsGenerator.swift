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

    public static func generatePersons(amount: Int, rng: inout some RandomNumberGenerator) -> [Person] {
        var result = [Person]()
        for _ in 0..<amount {
            let name = Self.names.randomElement(using: &rng)!
            let surname = Self.surnames.randomElement(using: &rng)!
            let age = Int.random(in: 1...85, using: &rng)

            let person = Person(name: name, surname: surname, age: age)
            result.append(person)
        }

        return result
    }
}