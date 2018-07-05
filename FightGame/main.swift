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
var fighter1: Personage!
var fighter2: Personage!
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
	print("What's the name of your personage number  \(number) ?")
	let choosedName = chooseAName(in: inGame)
	var newPersonageCreated: Personage!

	// loop that make a choice of personage and control if the choice is correct
	// create a new personage with the name choosed
	validAnswer = false
	while validAnswer == false {
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
	}
	return newPersonageCreated
}

// function for choose a name and control if the name of the personage doesn't already exist
func chooseAName(in game: Game) -> String {
	var validName = ""
	validAnswer = false
	while validAnswer == false {
		if let choice = readLine() {
			if game.listOfNames.contains(choice) {
				print("Sorry but the name already exist !")
			} else {
				validName = choice
				validAnswer = true
			}
		}
	}
	return validName
}

// function for make a choice between personages of a team
func choosePersonage(inteam: Team) -> Personage {
	var personageChoised: Personage?
	validAnswer = false
	repeat {
		var numberOfPossiblesChoices = 0
		var indexOfPossiblesChoices = [Int]()
		for numb in 0...2 where !inteam.personages[numb].isdead {
			print("\(numberOfPossiblesChoices + 1). " + inteam.personages[numb].makeDescription())
			numberOfPossiblesChoices += 1
			indexOfPossiblesChoices.append(numb)
			}
		if let choice = readLine() {
			switch choice {
			case "1":
				personageChoised = inteam.personages[indexOfPossiblesChoices[0]]
				validAnswer = true
			case "2" where numberOfPossiblesChoices > 1:
				personageChoised = inteam.personages[indexOfPossiblesChoices[1]]
				validAnswer = true
			case "3" where numberOfPossiblesChoices > 2:
				personageChoised = inteam.personages[indexOfPossiblesChoices[2]]
				validAnswer = true
			default:
				print("I did not understand !")
			}
		}
	} while validAnswer == false
	
	return personageChoised!
}

// function that perform an action by a team
func performAnActionBy(_ teamA: Team, on teamB: Team ) {

	// selection of the fighter for team
	print("\(teamA.playerName), choose the personage who will perform an action :")
	fighter1 = choosePersonage(inteam: teamA)

	let newWeaponFound = isBoxAppear()
	if newWeaponFound != nil {
		changeWeapon(of: fighter1, with: newWeaponFound!)
	}

	if fighter1.personageKind == .magus {
		// selection and heal personage in team A
		print("And now, choose the personage that you want to heal :")
		fighter2 = choosePersonage(inteam: teamA)
		fighter2.isHealedBy(fighter1)
		print("""
			💉      💊
			Good job, \(fighter2.name) has now \(fighter2.lifePoints) lifepoints left !

			""")
	} else {
		// selectection and attack pessonage in team B
		print("And now, choose the personage that you want to attack :")
		fighter2 = choosePersonage(inteam: teamB)
		fighter2.isAttackedBy(fighter1)
		print("""
			⚔️      🛡
			\(fighter1.name) is attacking \(fighter2.name) !!
			""")

		if fighter2.isdead {
			print("""
				unfortunately, \(fighter2.name) is dead

				""")
		} else {
			print("""
				now, \(fighter2.name) have \(fighter2.lifePoints) life points left
				""")
		}
	}
}

// function that make appear a box by chance
func isBoxAppear() -> Weapon? {
	var weaponInBox: Weapon? = nil
	if arc4random_uniform(10) > 5 {
		print("""
			🎁
			you are luky, a box appears in front of you !
			🎁
			""")
		let randomIndex = Int(arc4random_uniform(UInt32(WeaponFactory.list.count)))
		weaponInBox = WeaponFactory.list[randomIndex]
		print("""
			You found a \(weaponInBox!.kind) !!
			""")
	}
	return weaponInBox
}

// function taht make a personge change or not his weapon
func changeWeapon(of fighter: Personage, with weapon: Weapon) {
	switch fighter.sort {
	case .fighter where weapon.action == .heal:
		print("Sorry, but a \(fighter.personageKind) can't have a heal weapon ")
	case .healer where weapon.action == .attack:
		print("Sorry, but a \(fighter.personageKind) can't have a attack weapon ")
	default:
		print("""
			Now, \(fighter.name) has a \(fighter.weapon.kind) for weapon
			witch have \(fighter.weapon.attackPoints) attack point.
			Do you want to change it with \(weapon.kind) witch have \(weapon.attackPoints) attack points ?
			(y / n)
			""")
		validAnswer = false
		while validAnswer == false {
			if let choice = readLine() {
				switch choice {
				case "y":
					fighter.weapon = weapon
					print("ok, \(fighter.name) has now a \(fighter.weapon.kind) for weapon")
					validAnswer = true
				case "n":
					print("ok")
					validAnswer = true
				default:
					print("I did not understand !")
				}
			}
		}
	}
}

//======================
// MARK: - Activities
//=====================

//TODO: sdfqdsfqsdfqs
// FIXME: ajouter

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
		performAnActionBy(game.ne peuteam1, on: game.team2)
	} else {
		performAnActionBy(game.team2, on: game.team1)
	}
	game.endTurn()
}

print("""
	the game is now over because all the personages of one team are dead !!!
	and the winner is \(game.winner!.playerName) 🏆 🏆
	he wins with \(game.numberOfTurn) turns
	""")
