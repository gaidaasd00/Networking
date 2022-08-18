//
//  Cource.swift
//  Networking
//
//  Created by Алексей Гайдуков on 16.08.2022.
//

struct Course:Decodable  {
    let name: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTest: Int?
}
