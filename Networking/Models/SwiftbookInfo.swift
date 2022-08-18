//
//  SwiftbookInfo.swift
//  Networking
//
//  Created by Алексей Гайдуков on 16.08.2022.
//

struct SwiftbookInfo: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String? 
}
