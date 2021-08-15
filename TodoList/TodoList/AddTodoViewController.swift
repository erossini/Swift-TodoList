//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by Enrico Rossini on 15/08/2021.
//

import UIKit

class AddTodoViewController: UIViewController {

    var toDoTableViewController : TodoTableViewController?=nil
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addTodoTapped(_ sender: Any) {
        let newTodo = ToDo()
        newTodo.priority = prioritySegment.selectedSegmentIndex
        if let name = descriptionTextField.text {
            newTodo.name = name
        }
        
        toDoTableViewController?.toDos.append(newTodo)
        toDoTableViewController?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
