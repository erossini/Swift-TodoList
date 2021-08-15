//
//  TodoTableViewController.swift
//  TodoList
//
//  Created by Enrico Rossini on 15/08/2021.
//

import UIKit

class TodoTableViewController: UITableViewController {
    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDo1 = ToDo()
        toDo1.name = "Check if the video is published"
        toDo1.priority = 1
        let toDo2 = ToDo()
        toDo2.name = "Edit description of the video"
        toDo2.priority = 0
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let selectedTodo = toDos[indexPath.row]
        
        if selectedTodo.priority == 1 {
            cell.textLabel?.text = "❗️" + selectedTodo.name
        }
        else if selectedTodo.priority == 2 {
            cell.textLabel?.text = "‼️" + selectedTodo.name
        }
        else {
            cell.textLabel?.text = selectedTodo.name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToDetails", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addTodoViewController = segue.destination as? AddTodoViewController {
            addTodoViewController.toDoTableViewController = self
        }
        
        if let detailsTodViewController = segue.destination as? TodoDetailViewController {
            if let selectedToDo = sender as? ToDo {
                detailsTodViewController.toDo = selectedToDo
            }
        }
    }
}
