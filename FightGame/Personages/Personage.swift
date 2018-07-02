//
//  Personage.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

class Personage {
	//======================
	// MARK: - Properties
	//======================

	// creation of name property : a String (the name of the Personage)
	var name: String

	// creation of sort property : a Sort enum (the sort of the personage : "combatant", "magus" ...)
	var personageKind: PersonageKind

	// creation of lifePoints property : a Int (the number of point of life for e personage)
	var lifePoints = 0

	// creation of weapon property : a Weapon class (the weapon of a personage)
	var weapon: Weapon

	// creation of isdead property : a Bool (is the personage is alive or dead)
	var isdead: Bool {
		return lifePoints <= 0
	}

	// creation of Sort enum : a list of sort of personages
	enum PersonageKind {
		case combatant, magus, colossus, dwarf
	}

	// initialization of properties
	init(name: String, kind: PersonageKind, weapon: Weapon) {
		self.name = name
		self.personageKind = kind
		self.weapon = weapon
	}
	convenience init(name: String) {
		self.init(name: name, kind: .combatant, weapon: WeaponFactory.sword)
	}

	//======================
	// MARK: - Methods
	//======================

	// function that remove lifepoints during an attack
	func isAttackedBy(_ personage: Personage) {
		lifePoints -= personage.weapon.attackPoints
	}

	//function that add lifepoints during a magus care
	func isHealedBy(_ personage: Personage) {
		lifePoints += personage.weapon.attackPoints
	}
}
