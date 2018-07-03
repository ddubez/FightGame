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

	// creation of action property : a WeaponAction Enum (the action of the weapon)
	var action: WeaponAction

	// creation of WeaponAction enum
	enum WeaponAction {
		case attack, heal
	}

	// initialization of properties
	init(kind: String, attackPoints: Int, action: WeaponAction ) {
		self.kind = kind
		self.attackPoints = attackPoints
		self.action = action
	}
}

//======================
// MARK: - création of the avalaible weapons
//======================

struct WeaponFactory {
	static let dagger = Weapon(kind: "dagger", attackPoints: 50, action: .attack)
	static let sword = Weapon(kind: "sword", attackPoints: 100, action: .attack)
	static let twoHandAx = Weapon(kind: "twoHandAx", attackPoints: 200, action: .attack)
	static let magic = Weapon(kind: "magic", attackPoints: 50, action: .heal)

	// création of an array of weaponFactory for random choose in the box
	static let list = [WeaponFactory.dagger, WeaponFactory.sword, WeaponFactory.twoHandAx, WeaponFactory.magic]
}
