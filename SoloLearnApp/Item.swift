//
//  Item.swift
//  SoloLearnApp
//
//  Created by Cristian Acuña on 11-07-17.
//  Copyright © 2017 Nihilism Incorporated. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
	var name:String
	
	static let dir = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
	static let archiveURL = dir.appendingPathComponent("items")
	
	init?(name: String) {
		self.name = name
		super.init()
	}
	
	required convenience init?(coder aDecoder: NSCoder) {
		guard let name = aDecoder.decodeObject(forKey: "name") as? String else {
			print("Error: could not find saved objects")
			return nil
		}
		self.init(name: name)
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(name)
	}
}
