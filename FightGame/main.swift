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
	print("Nous allons maintenant créer l'équipe \(number) :"
		+ "\n Quel est le nom du joueur?")
	if let choice = readLine() {
		playerNameChoised = choice
	}
	let team = Team(number: number, personages: [Personage](), playerName: playerNameChoised)
	print("\(team.playerName), tu vas maintenant composer ton équipe :")
	return team
}

// function that create a personage
func newPersonage(number: Int, forTeam: Int) -> Personage {
	var choisedName: String
	print("Quel est le nom du personnage numéro \(number) ?")
	choisedName = readLine()!
	let newPersonageCreated = Personage(name: choisedName)
	print("De quel type est-il ?"
		+ "\n1. 🤺 Un combattant (bon guerrier) "
		+ "\n2. 🧙‍♂️ Un mage (soigne ses copains) "
		+ "\n3. 🏋️‍♀️ Un colosse (très résistant, mais il ne vous fera pas bien mal) "
		+ "\n4. ⛏ Un nain (Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie) "
	)
	if let choice = readLine() {
		switch choice {
		case "1":
			newPersonageCreated.sort = .combattant
			newPersonageCreated.weapon = .glaive
		case "2":
			newPersonageCreated.sort = .mage
			newPersonageCreated.weapon = .magie
		case "3":
			newPersonageCreated.sort = .colosse
			newPersonageCreated.weapon = .poignard
		case "4":
			newPersonageCreated.sort = .nain
			newPersonageCreated.weapon = .hache
		default:
			print("Je ne comprend pas !")
		}
	}
	return newPersonageCreated
}

// function that make a fight between 2 personage
func makeAFightBetween(_ fighter1: Personage, _ fighter2: Personage) {
	print("...⚒.....⚒.....⚒....⚒....⚒"
		+ "\nle combat est en cours entre \(fighter1.name) et \(fighter2.name)"
		+ "...⚒.....⚒.....⚒....⚒....⚒")
}

//======================
// MARK: - Activities
//======================

print(".................."
	+ "\n.................."
	+ "\n.................."
	+ "\nBonjour à tous,")
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
print("Merci à vous deux, les équipes sont maintenant prêtes !!")
print("\(team1.playerName), choisi le personnage qui va combatre :")
for numb in 0...2 {
	print("\(numb + 1). \(team1.personages[numb].name), qui est un \(team1.personages[numb].sort)")
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
		print("Je ne comprend pas !")
	}
}
// selection of the fighter for team 2
print("\(team2.playerName), choisi le personnage qui va combatre :")
for numb in 0...2 {
	print("\(numb + 1). \(team2.personages[numb].name), qui est un \(team2.personages[numb].sort)")
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
		print("Je ne comprend pas !")
	}
}
makeAFightBetween(fighter1!, fighter2!)
