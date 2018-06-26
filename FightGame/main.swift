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

var fighter1: Personage?
var fighter2: Personage?

//======================
// MARK: - Functions
//======================

// function that create a new team
func newTeam(number: Int) -> Team {
	var playerNameChoised = ""
	print("Now, we are going to create the team number \(number) :"
		+ "\n What's the name of the player ?")
	if let choice = readLine() {
		playerNameChoised = choice
	}
	let team = Team(number: number, personages: [Personage](), playerName: playerNameChoised)
	print("\(team.playerName), you're going to compose your team :")
	return team
}

// function that create a personage
func newPersonage(number: Int, forTeam: Int) -> Personage {
	var choisedName: String
	print("What's the name of your personage number  \(number) ?")
	choisedName = readLine()!
	let newPersonageCreated = Personage(name: choisedName)
	print("What kind is it ?"
		+ "\n1. 🤺 A combatant (good warrior) "
		+ "\n2. 🧙‍♂️ A magus (heal his friends) "
		+ "\n3. 🏋️‍♀️ A colossus (very tough, but he will not hurt very much !) "
		+ "\n4. ⛏ A dwarf (his ax will deal you a lot of damage, but he does not have a lot of health) "
	)
	if let choice = readLine() {
		switch choice {
		case "1":
			newPersonageCreated.personageKind = .combatant
			newPersonageCreated.weapon = sword
		case "2":
			newPersonageCreated.personageKind = .magus
			newPersonageCreated.weapon = magic
		case "3":
			newPersonageCreated.personageKind = .colossus
			newPersonageCreated.weapon = dagger
		case "4":
			newPersonageCreated.personageKind = .dwarf
			newPersonageCreated.weapon = twoHandAx
		default:
			print("I did not understand !")
		}
	}
	return newPersonageCreated
}

// function for make a choice between personages of a team
func makePersonageChoise(inteam: Team) -> Personage {
	var personageChoised: Personage?
	print("\(inteam.playerName), choose the personage who will fight :")
	for numb in 0...2 {
		print("\(numb + 1). \(inteam.personages[numb].name), who's a \(inteam.personages[numb].personageKind) and have \(inteam.personages[numb].lifePoints) lifepoints left")
	}
	if let choice = readLine() {
		switch choice {
		case "1":
			personageChoised = inteam.personages[0]
		case "2":
			personageChoised = inteam.personages[1]
		case "3":
			personageChoised = inteam.personages[2]
		default:
			print("I did not understand !")
		}
	}
	return personageChoised!
}

// function that make a fight between 2 personage
func makeAFightBetween(_ fighter1: Personage, _ fighter2: Personage) {
	print("...⚒.....⚒.....⚒....⚒....⚒"
		+ "\n \(fighter1.name) and \(fighter2.name) are fighting together "
		+ "\n...⚒.....⚒.....⚒....⚒....⚒")
	fighter1.removeLifePoint(attackPoints: fighter2.weapon.attackPoints)
	fighter2.removeLifePoint(attackPoints: fighter1.weapon.attackPoints)

	if fighter1.isdead {
		print("unfortunately, \(fighter1.name) is dead")
	}	else {
		print("now, \(fighter1.name) have \(fighter1.lifePoints) life points left")
	}
	
	if fighter2.isdead {
		print("unfortunately, \(fighter2.name) is dead")
	}	else {
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
// creation of team 1

var team1 = newTeam(number: 1)
for personnageNumber in 1...3 {
	team1.personages.append(newPersonage(number: personnageNumber, forTeam: 1))
}

// creation of team 2
var team2 = newTeam(number: 2)
for personnageNumber in 1...3 {
	team2.personages.append(newPersonage(number: personnageNumber, forTeam: 2))
}

// the 2 teams are completed
print("Thank you both, the teams are now ready !!")

while !team1.isOver && !team2.isOver {
// selection of the fighter for team 1
fighter1 = makePersonageChoise(inteam: team1)

// selection of the fighter for team 2
fighter2 = makePersonageChoise(inteam: team2)

// we make the fight between the 2 selected fighter
makeAFightBetween(fighter1!, fighter2!)
}

print("the game is now over because all the personages of one team are dead !!!")
