//
//  ViewController.swift
//  ToDo List
//
//  Created by NWPU on 15/12/2017.
//  Copyright © 2017 NWPU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewToDO: UITableView!
 
    var plans = [String]()
    
    
    
    @IBAction func onAddTapped(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add ToDo", message: nil, preferredStyle: .alert)
        alert.addTextField { (planTF) in
        planTF.placeholder = "Add Your Today's Plan"
            
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let plan = alert.textFields?.first?.text else { return }
        print(plan)
        self.add(plan)
    }
    alert.addAction(action)
    present(alert, animated:  true)
    }
    
    func add(_ plantoDO: String) {
        let index = 0
        plans.insert(plantoDO, at: index)
        
        let indexPath = IndexPath(row: index, section: 0)
        tableViewToDO.insertRows(at: [indexPath], with: .left)
        
    }
    func update(_ plantoDO: String, indexNum: IndexPath) {
        let index = 0
        plans[indexNum.row] = plantoDO
        
       tableViewToDO.reloadData()
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let plan = plans[indexPath.row]
        cell.textLabel?.text = plan
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        plans.remove(at: indexPath.row)
        
        tableViewToDO.deleteRows(at: [indexPath], with: .automatic)
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Edit It", message: nil, preferredStyle: .alert)
        alert.addTextField { (planTF) in
            planTF.placeholder = "Add Your Today's Plan"
            planTF.text = self.plans[indexPath.row]
            
        }
        let action = UIAlertAction(title: "Done", style: .default) { (_) in
            guard let plan = alert.textFields?.first?.text else { return }
            print(plan)
        self.update(plan, indexNum: indexPath)
        }
        alert.addAction(action)
        present(alert, animated:  true)
    }
    
    
    
}



