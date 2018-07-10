//
//  Magus.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

// creation of class Magus, which is a subclass of personage with override property depending on his Kind
class Magus: Personage {
	override init(name: String, kind: PersonageKind, weapon: Weapon, inGame: Game) {
		super.init(name: name, kind: .magus, weapon: WeaponFactory.magic, inGame: inGame)
		lifePoints = 50
		superPower = SuperPower(kind: "!🔋 magic Sponge!", attackPoints: 80, action: .attack, damagePoints: 40)

	}
	static let description = "🧙‍♂️ A magus (heal his friends)"
}
