//
//  main.swift
//  FightGame
//
//  Created by David DUBEZ on 19/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

//======================
// MARK: - Parameters
//======================

var game: Game

//======================
// MARK: - Functions
//======================

// function that create a new team
func createNewTeam(number: Int) -> Team {
	var playerNameChoised = ""
	print("What's the name of the team number \(number) player ?")
	if let choice = readLine() {
		playerNameChoised = choice
	}
	let team = Team(number: number, personages: [Personage](), playerName: playerNameChoised)
	return team
}

// function that create a personage
func createNewPersonage(number: Int, inGame: Game) -> Personage {
	print("What's the name of your personage number  \(number) ?")
	let choosedName = inGame.chooseAName()
	var newPersonageCreated: Personage!

	// loop that make a choice of personage and control if the choice is correct
	// create a new personage with the name choosed
	var validAnswer = false
	repeat {
		print("""
			What kind is it ?
			1. \(Combatant.description)
			2. \(Magus.description)
			3. \(Colossus.description)
			4. \(Dwarf.description)
			""")

		if let choice = readLine() {
			switch choice {
			case "1":
				newPersonageCreated = Combatant(name: choosedName)
				validAnswer = true
			case "2":
				newPersonageCreated = Magus(name: choosedName)
				validAnswer = true
			case "3":
				newPersonageCreated = Colossus(name: choosedName)
				validAnswer = true
			case "4":
				newPersonageCreated = Dwarf(name: choosedName)
				validAnswer = true
			default:
				print("I did not understand !")
			}
		}
	} while validAnswer == false
	return newPersonageCreated
}

//======================
// MARK: - Activities
//=====================

print("""
	..................
	..................
	Hello everybody,
	""")

// creation of game with team 1 and 2
print("We are going to create the 2 teams")
game = Game(team1: createNewTeam(number: 1), team2: createNewTeam(number: 2))

// création of personages for team 1
print("\(game.team1.playerName), you're going to compose your team :")
for personnageNumber in 1...3 {
	game.team1.personages.append(createNewPersonage(number: personnageNumber, inGame: game))
}

// creation of personages for team 2
print("\(game.team2.playerName), you're going to compose your team :")
for personnageNumber in 1...3 {
	game.team2.personages.append(createNewPersonage(number: personnageNumber, inGame: game))
}

// the 2 teams are completed
print("Thank you both, the teams are now ready !!")

// loop that make fight until the game is over
while !game.isOver {

	if game.numberOfTurn % 2 != 0 {
		game.team1.performAnActionOn(game.team2)
	} else {
		game.team2.performAnActionOn(game.team1)
	}
	game.endTurn()
}

print("""
	the game is now over because all the personages of one team are dead !!!
	and the winner is \(game.winner!.playerName) 🏆 🏆
	he wins with \(game.numberOfTurn) turns
	""")
