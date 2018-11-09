//
//  NavigationViewController.swift
//  Notes
//
//  Created by Milo Wyner on 11/9/18.
//  Copyright © 2018 Milo Wyner. All rights reserved.
//

import UIKit
import CoreData

class NavigationViewController: UITableViewController, NoteDelegate {

    var noteArray = [Note]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        cell.textLabel?.text = noteArray[indexPath.row].text

        return cell
    }
    
    // MARK: - Note was selected
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToNote", sender: self)
    }
    
    
    // MARK: - Add new note
    
    @IBAction func createNoteButtonPressed(_ sender: UIBarButtonItem) {
        let newNote = Note(context: context)
        
        noteArray.append(newNote)
        
        performSegue(withIdentifier: "goToNote", sender: self)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! NoteViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.note = noteArray[indexPath.row]
        } else {
            destinationVC.note = noteArray[noteArray.count - 1]
        }
        destinationVC.delegate = self
    }
    
    // MARK: - Note delegate method
    
    func noteFinished(_ note: Note) {
        if let indexPath = tableView.indexPathForSelectedRow {
            noteArray[indexPath.row] = note
        }
        else {
            noteArray[noteArray.count - 1] = note
        }
        
        tableView.reloadData()
    }

}
