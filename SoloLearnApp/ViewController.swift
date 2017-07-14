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
		guard let item = item else {
			return
		}
		
		nameTextField.text = item.name
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
	
	@IBAction func cancel(_ sender: UIBarButtonItem) {
		let isInAddMode = presentingViewController is UINavigationController
		
		if isInAddMode {
			dismiss(animated: true, completion: nil)
		} else {
			navigationController!.popViewController(animated: true)
		}
	}
}
