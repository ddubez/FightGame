//
//  Game.swift
//  FightGame
//
//  Created by David DUBEZ on 28/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

class Game {
	//======================
	// MARK: - Properties
	//======================

	var team1: Team
	var team2: Team

	// creation of numberOfTurn property : a Int (the number of turns of the game)
	var numberOfTurn = 1

	// creation of isOver property : when the game is over
	var isOver: Bool {
		return team1.isOver || team2.isOver
	}

	// creation of winner property : the Team winner of the game
	var winner: Team? {
		return getWinner()
	}

	// creation of listOfNames : an array of string that contains all the personage name already used
	var listOfNames: [String] {
		return getListOfNames()
	}

	// initialization of properties
	init(team1: Team, team2: Team) {
		self.team1 = team1
		self.team2 = team2
	}

	//======================
	// MARK: - Private Getters
	//======================

	// determine the winner of the game
	private func getWinner() -> Team? {
		if team1.isOver {
			return team2
		} else if team2.isOver {
			return team1
		} else {
			return nil
		}
	}

	// determine all the personage name
	private func getListOfNames() -> [String] {
		var list = [String]()
		for personage in team1.personages {
			list.append(personage.name)
		}
		for personage in team2.personages {
			list.append(personage.name)
		}
		return list
	}

	//======================
	// MARK: - Methods
	//======================

	// add a turn at the number of turn and increase all the superPower
	func endTurn() {
		numberOfTurn += 1
		increaseAllSuperPower()
	}

	// function for choose a name and control if the name of the personage doesn't already exist
	func chooseAName() -> String {
		var validName = ""
		var validAnswer = false
		repeat {
			if let choice = readLine() {
				if listOfNames.contains(choice) {
					print("Sorry but the name already exist !")
				} else {
					validName = choice
					validAnswer = true
				}
			}
		} while validAnswer == false
		return validName
	}

	// function that increase all super power of a game
	private func increaseAllSuperPower() {
		for personage in team1.personages where !personage.isdead {
			personage.addExperience()
			}
		for personage in team2.personages where !personage.isdead {
			personage.addExperience()
		}
	}
}
