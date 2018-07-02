//
//  Weapon.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

//======================
// MARK: - Structure
//======================

//the Weapon class define a kind and the damage of weapon
struct Weapon {

	//======================
	// MARK: - Properties
	//======================

	// creation of kind property : a String (the kind of the weapon)
	var kind: String

	// creation of attackpoints property : a Int (the number of lifepoint that the persongae will lost with the weapon)
	var attackPoints: Int

	// initialization of properties
	init(kind: String, attackPoints: Int ) {
		self.kind = kind
		self.attackPoints = attackPoints
	}
}

//======================
// MARK: - création of the avalaible weapons
//======================

struct WeaponFactory {
	static let dagger = Weapon(kind: "dagger", attackPoints: 50)
	static let sword = Weapon(kind: "sword", attackPoints: 100)
	static let twoHandAx = Weapon(kind: "twoHandAx", attackPoints: 200)
	static let magic = Weapon(kind: "magic", attackPoints: 50)
}
