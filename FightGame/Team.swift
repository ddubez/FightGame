//
//  Team.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

struct Team {
	//======================
	// MARK: - Properties
	//======================

	//creation of number property : a Int (the number of the team)
	var number: Int

	// creation of personages property : an array of Personage class (listing of the personages in the team)
	var personages: [Personage]

	// creation of playerName property : a string (the name of the team)
	var playerName: String

	// creation of IsOver property : when all the personage are dead
	var isOver: Bool {
		var numberOfDeadPersonages = 0
		for perso in personages {
			if perso.isdead {
				numberOfDeadPersonages += 1
			}
		}
		return numberOfDeadPersonages == personages.count
	}

	// initialization of properties
	init(number: Int, personages: [Personage], playerName: String) {
		self.number = number
		self.personages = personages
		self.playerName = playerName
	}
}
