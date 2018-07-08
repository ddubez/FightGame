//
//  Dwarf.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

// creation of class Dwarf, which is a subclass of personage with override property depending on his Kind
class Dwarf: Personage {
	override init(name: String, kind: PersonageKind, weapon: Weapon, inGame: Game) {
		super.init(name: name, kind: .dwarf, weapon: WeaponFactory.twoHandAx, inGame: inGame)
		lifePoints = 150
		superPower = SuperPower(kind: "🐝 attack of the flying dwarf", attackPoints: 200, action: .attack, damagePoints: 150)

	}
	static let description = "⛏ A dwarf (his ax will deal you a lot of damage, but he does not have a lot of health)"
}
