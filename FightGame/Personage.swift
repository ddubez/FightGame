//
//  Personage.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

class Personage {
	// MARK: - Properties

	// creation of name property : a String (the name of the Personage)
	var name: String

	// creation of sort property : a Sort enum (the sort of the personage : "combatant", "mage" ...)
	var sort: Sort

	// creation of lifePoints property : a Int (the number of point of life for e personage)
	var lifePoints = 0

	// creation of weapon property : a Weapon enum (the weapon of a personage)
	var weapon: Weapon

	// creation of isalive property : a Bool (is the personage is alive or dead)
	var isalive: Bool {
		return lifePoints != 0
	}

	// creation of Sort enum : a list of sort of personages
	enum Sort {
		case combattant, mage, colosse, nain
	}

	//creation of Weapon enum : a list of weapon for the personage
	enum Weapon {
		case poignard, glaive, hache, magie
	}

	// initialization of properties
	init(name: String, sort: Sort, weapon: Weapon) {
		self.name = name
		self.sort = sort
		self.weapon = weapon
		initCharacterLifePoints()
	}
	convenience init(name: String) {
		self.init(name: name, sort: .combattant, weapon: .glaive)
	}

	// MARK: - Methods

	// private method for set lifepoints of a Personage depending on his Sort
	private func initCharacterLifePoints() {
		switch sort {
		case .colosse:
			lifePoints = 200
		case .combattant:
			lifePoints = 100
		case .mage:
			lifePoints = 80
		case .nain:
			lifePoints = 50
		}
	}
}
