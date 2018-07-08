//
//  Colossus.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

// creation of class Colossus, which is a subclass of personage with override property depending on his Kind
class Colossus: Personage {
	override init(name: String, kind: PersonageKind, weapon: Weapon, inGame: Game) {
		super.init(name: name, kind: .colossus, weapon: WeaponFactory.dagger, inGame: inGame)
		lifePoints = 200
		superPower = SuperPower(kind: "🦍 tripe hit", attackPoints: 50, action: .attack, damagePoints: 100)
	}
	static let description = "🏋️‍♀️ A colossus (very tough, but he will not hurt very much !)"
}
