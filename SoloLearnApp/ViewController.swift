//
//  ViewController.swift
//  SoloLearnApp
//
//  Created by Cristian Acuña on 11-07-17.
//  Copyright © 2017 Nihilism Incorporated. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	var item: Item?
	
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var saveButton: UIBarButtonItem!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if saveButton === sender as AnyObject {
			let name = nameTextField.text ?? ""
			item = Item(name: name)
		}
	}
}
