//
//  Combatant.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

// creation of class Combattant, which is a subclass of personage with override property depending on his Kind
class Combatant: Personage {
	override init(name: String, kind: PersonageKind, weapon: Weapon) {
		super.init(name: name, kind: .combatant, weapon: WeaponFactory.sword)
		lifePoints = 100
	}
	static let description = "🤺 A combatant (good warrior)"
}
