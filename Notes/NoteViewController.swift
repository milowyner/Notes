//
//  NoteViewController.swift
//  Notes
//
//  Created by Milo Wyner on 11/9/18.
//  Copyright © 2018 Milo Wyner. All rights reserved.
//

import UIKit
import CoreData

protocol NoteDelegate {
    func noteFinished(_ note: Note)
}

class NoteViewController: UIViewController {

    var note: Note?
    var delegate: NoteDelegate?
    
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = note?.text
    }
    
    // MARK: - Back button pressed
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear called")
        note?.text = textField.text
        note?.preview = String(textField.text.prefix(40)) + "..."
        delegate?.noteFinished(note!)
    }
    
}
