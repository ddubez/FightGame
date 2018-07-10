//
//  SuperPower.swift
//  FightGame
//
//  Created by David DUBEZ on 07/07/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

class SuperPower: Weapon {
	//======================
	// MARK: - Properties
	//======================

	// creation of damage points property : the number of life point that personage will losse by using his superpower
	var damagePoints: Int

	init(kind: String, attackPoints: Int, action: WeaponAction, damagePoints: Int) {
		self.damagePoints = damagePoints
		super.init(kind: kind, attackPoints: attackPoints, action: action)
	}

	//======================
	// MARK: - Methods
	//======================

	// function that increase the damage point in function of the number of turn in a game
	func increasePower(for game: Game) {
			attackPoints += (game.numberOfTurn * 10)
	}
}
