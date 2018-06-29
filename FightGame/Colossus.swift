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
	override init(name: String, kind: PersonageKind, weapon: Weapon) {
		super.init(name: name, kind: .colossus, weapon: dagger)
		lifePoints = 200
	}
	static let description = "🏋️‍♀️ A colossus (very tough, but he will not hurt very much !)"
}
