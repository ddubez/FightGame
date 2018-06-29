//
//  Colossus.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

class Colossus: Personage {
	override init(name: String, kind: PersonageKind, weapon: Weapon) {
		super.init(name: name, kind: .colossus, weapon: dagger)
	}
}
