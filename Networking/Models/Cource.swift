//
//  Cource.swift
//  Networking
//
//  Created by Алексей Гайдуков on 16.08.2022.
//

struct Course:Decodable  {
    let name: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_test: Int?
}
