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

// function that make a fight between 2 personage
func makeAFightBetween(_ fighter1: Personage, _ fighter2: Personage) {
	print("...⚒.....⚒.....⚒....⚒....⚒"
		+ "\n \(fighter1.name) and \(fighter2.name) are fighting together "
		+ "...⚒.....⚒.....⚒....⚒....⚒")
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
// selection of the fighter for team 1
print("Thank you both, the teams are now ready !!")
print("\(team1.playerName), chose the personage who will fight :")
for numb in 0...2 {
	print("\(numb + 1). \(team1.personages[numb].name), who's a \(team1.personages[numb].personageKind)")
}
if let choice = readLine() {
	switch choice {
	case "1":
		fighter1 = team1.personages[0]
	case "2":
		fighter1 = team1.personages[1]
	case "3":
		fighter1 = team1.personages[2]
	default:
		print("I did not understand !")
	}
}
// selection of the fighter for team 2
print("\(team2.playerName), chose the personage who will fight :")
for numb in 0...2 {
	print("\(numb + 1). \(team2.personages[numb].name), who's a \(team2.personages[numb].personageKind)")
}
if let choice = readLine() {
	switch choice {
	case "1":
		fighter2 = team2.personages[0]
	case "2":
		fighter2 = team2.personages[1]
	case "3":
		fighter2 = team2.personages[2]
	default:
		print("I did not understand !")
	}
}
makeAFightBetween(fighter1!, fighter2!)
