//
//  CoursesViewController.swift
//  Networking
//
//  Created by Алексей Гайдуков on 16.08.2022.
//
//
//  CoursesViewController.swift
//  Networking
//
//  Created by Alexey Efimov on 21/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CoursesViewController: UITableViewController {
    private var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? CourseCell
        else {
            return UITableViewCell()
        }
        let course = courses[indexPath.row]
        cell.configure(with: course)

        return cell
    }
    

}

// MARK: - Networking
extension CoursesViewController {
    func fetchCourses() {
        guard let url = URL(string: Link.coursesURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self]data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self?.courses = try decoder.decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
