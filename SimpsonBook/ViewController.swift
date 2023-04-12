//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Mertcan Ünek on 12.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    
    var chosenSimpson : Simpson?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        //Simpson Objects
        
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Security", simpsonImage: UIImage(named: "Homer_Simpson.png")!)
        
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "Housewife", simpsonImage: UIImage(named: "Marge_Simpson.png")!)
        
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "Bart_Simpson.png")!)
        
        let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "Lisa_Simpson.png")!)
        
        let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby", simpsonImage: UIImage(named: "Maggie_Simpson.png")!)
        
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }


}

