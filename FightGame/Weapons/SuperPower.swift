//
//  SuperPower.swift
//  FightGame
//
//  Created by David DUBEZ on 07/07/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

class SuperPower: Weapon {
	var damagePoints: Int
	init(kind: String, attackPoints: Int, action: WeaponAction, damagePoints: Int) {
		self.damagePoints = damagePoints
		super.init(kind: kind, attackPoints: attackPoints, action: action)
	}
}
