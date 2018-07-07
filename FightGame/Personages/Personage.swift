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

	// creation of kind property : a PersonageKind enum (the kind of the personage : "combatant", "magus" ...)
	var personageKind: PersonageKind

	// creation of PersonageKind enum : a list of kind of personages
	enum PersonageKind {
		case combatant, magus, colossus, dwarf
	}

	// creation of lifePoints property : a Int (the number of point of life for e personage)
	var lifePoints = 0

	// creation of weapon property : a Weapon strcture (the weapon of a personage)
	var weapon: Weapon

	// creation of isdead property : a Bool (is the personage is alive or dead)
	var isdead: Bool {
		return lifePoints <= 0
	}

	// creation of a get property : sort : a Sort Enum for the sort of the personage
	var sort: Sort {
		if personageKind == .magus {
			return Sort.healer
		} else {
			return Sort.fighter
		}
	}

	// création of sort enum
	enum Sort {
		case fighter, healer
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

	// function that make a description of a personage
	func makeDescription() -> String {
		return "\(name), who's a \(personageKind) with \(lifePoints) lifepoints left,"
		+ " and a \(weapon.kind) with \(weapon.attackPoints) attack points "
	}

	// function taht make a personge change or not his weapon
	func changeWeapon(with newWeapon: Weapon) {
		switch sort {
		case .fighter where newWeapon.action == .heal:
			print("Sorry, but a \(personageKind) can't have a heal weapon ")
		case .healer where newWeapon.action == .attack:
			print("Sorry, but a \(personageKind) can't have a attack weapon ")
		default:
			print("""
				Now, \(name) has a \(weapon.kind) for weapon
				witch have \(weapon.attackPoints) attack point.
				Do you want to change it with \(newWeapon.kind) witch have \(newWeapon.attackPoints) attack points ?
				(y / n)
				""")
			var validAnswer = false
			repeat {
				if let choice = readLine() {
					switch choice {
					case "y":
						weapon = newWeapon
						print("ok, \(name) has now a \(weapon.kind) for weapon")
						validAnswer = true
					case "n":
						print("ok")
						validAnswer = true
					default:
						print("I did not understand !")
					}
				}
			} while validAnswer == false
		}
	}
}
