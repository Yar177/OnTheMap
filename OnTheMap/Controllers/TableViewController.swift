//
//  TableViewController.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/8/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayStudentData = [StudentLocationModel]()
    
    var testArray = ["test11", "test11", "test11", "test11","test11", "test11", "test11", "test11"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayStudentData = StudentsLocationDataModel.studentsData
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  arrayStudentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")!
        
        cell.textLabel?.text = ("\(arrayStudentData[indexPath.row].firstName) \(arrayStudentData[indexPath.row].lastName)")
        cell.detailTextLabel?.text = arrayStudentData[indexPath.row].mediaURL
        
        cell.imageView?.image = UIImage(named: "placeholder1")

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var url = arrayStudentData[indexPath.row].mediaURL
        
    }
    

}

