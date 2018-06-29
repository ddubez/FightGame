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
var fighter1: Personage?
var fighter2: Personage?
var validAnswer = false

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
	var choosedName = ""

	// loop that control if the name of the personage doesn't already exist
	validAnswer = false
	while validAnswer == false {
	print("What's the name of your personage number  \(number) ?")
		if let choice = readLine() {
			if inGame.listOfNames.contains(choice) {
				print("Sorry but the name already exist !")
			} else {
				choosedName = choice
				validAnswer = true
			}
		}
	}

	// creation of a new personage with the name choosed
	var newPersonageCreated: Personage?

	// loop that make a choice of personage and control if the choice is correct
	validAnswer = false
	while validAnswer == false {
	print("What kind is it ?"
		+ "\n1. 🤺 A combatant (good warrior) "
		+ "\n2. 🧙‍♂️ A magus (heal his friends) "
		+ "\n3. 🏋️‍♀️ A colossus (very tough, but he will not hurt very much !) "
		+ "\n4. ⛏ A dwarf (his ax will deal you a lot of damage, but he does not have a lot of health) "
	)
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
	}
	return newPersonageCreated!
}

// function for make a choice between personages of a team
func choosePersonage(inteam: Team) -> Personage {
	var personageChoised: Personage?
	validAnswer = false
	while validAnswer == false {
	for numb in 0...2 {
		print("\(numb + 1). \(inteam.personages[numb].name), who's a \(inteam.personages[numb].personageKind) "
			+ "and have \(inteam.personages[numb].lifePoints) lifepoints left")
	}
	if let choice = readLine() {
		switch choice {
		case "1":
			personageChoised = inteam.personages[0]
			validAnswer = true
		case "2":
			personageChoised = inteam.personages[1]
			validAnswer = true
		case "3":
			personageChoised = inteam.personages[2]
			validAnswer = true
		default:
			print("I did not understand !")
		}
	}
	}
	return personageChoised!
}

// function that make a fight between 2 personage
func makeAnAttackBy(_ fighter1: Personage, on fighter2: Personage) {
	print("...⚒.....⚒.....⚒....⚒....⚒"
		+ "\n \(fighter1.name) and \(fighter2.name) are fighting together "
		+ "\n...⚒.....⚒.....⚒....⚒....⚒")
	fighter2.removeLifePoint(attackPoints: fighter1.weapon.attackPoints)

	if fighter1.isdead {
		print("unfortunately, \(fighter1.name) is dead")
	} else {
		print("now, \(fighter1.name) have \(fighter1.lifePoints) life points left")
	}

	if fighter2.isdead {
		print("unfortunately, \(fighter2.name) is dead")
	} else {
		print("now, \(fighter2.name) have \(fighter2.lifePoints) life points left")
	}
}

//======================
// MARK: - Activities
//======================

print(".................."
	+ "\n.................."
	+ "\n.................."
	+ "\nHello everybody,")

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
	// Attack of Team 1
	// selection of the fighter for team 1
	print("\(game.team1.playerName), choose the personage who will fight :")
	fighter1 = choosePersonage(inteam: game.team1)

	// selection of personage in team 2, attacked by team 1
	print("And now, choose the personage that you want to attack :")
	fighter2 = choosePersonage(inteam: game.team2)

	// we make the fight between the 2 selected fighter
	makeAnAttackBy(fighter1!, on: fighter2!)

	// Attack of Team 2
	// selection of the fighter for team 2
	print("\(game.team2.playerName), choose the personage who will fight :")
	fighter1 = choosePersonage(inteam: game.team2)

	// selection of personage in team 1, attacked by team 2
	print("And now, choose the personage that you want to attack :")
	fighter2 = choosePersonage(inteam: game.team1)

	// we make the fight between the 2 selected fighter
	makeAnAttackBy(fighter1!, on: fighter2!)

	game.endTurn()
}

print("",
	  "the game is now over because all the personages of one team are dead !!!",
	  "and the winner is \(game.winner!.playerName)",
	"he wins with \(game.numberOfTurn) turns" )
