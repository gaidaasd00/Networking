//
//  CoursesCell.swift
//  Networking
//
//  Created by Алексей Гайдуков on 16.08.2022.
//

import UIKit

class CourseCell: UITableViewCell {
    
    @IBOutlet var curseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    
    func configure(with course: Course) {
        courseNameLabel.text = course.name
        numberOfLessons.text = "Number of lessons: \(course.numberOfLessons ?? 0)"
        numberOfTests.text = "Number of tests: \(course.numberOfTest ?? 0)"
        
        guard let url = URL(string: course.imageUrl ?? "") else { return }
        DispatchQueue.global().async { [weak self] in
            guard let imageDate = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self?.curseImage.image = UIImage(data: imageDate)
            }
        }
    }
}
