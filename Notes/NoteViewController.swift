//
//  NoteViewController.swift
//  Notes
//
//  Created by Milo Wyner on 11/9/18.
//  Copyright © 2018 Milo Wyner. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    var note: Note?
    
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = note?.text
    }

    
}
