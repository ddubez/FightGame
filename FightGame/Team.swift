//
//  Team.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

// the structure Team define a list of personage in a team
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
		for perso in personages where perso.isdead {
				numberOfDeadPersonages += 1
		}
		return numberOfDeadPersonages == personages.count
	}

	// initialization of properties
	init(number: Int, personages: [Personage], playerName: String) {
		self.number = number
		self.personages = personages
		self.playerName = playerName
	}

	//======================
	// MARK: - Methods
	//======================

	// function for make a choice between personages of a team

	private func chooseAPersonage() -> Personage {
		var personageChoised: Personage?
		var validAnswer = true
		repeat {
			var numberOfPossiblesChoices = 0
			var indexOfPossiblesChoices = [Int]()
			for numb in 0...2 where !personages[numb].isdead {
				print("\(numberOfPossiblesChoices + 1). " + personages[numb].makeDescription())
				numberOfPossiblesChoices += 1
				indexOfPossiblesChoices.append(numb)
			}
			if let choice = readLine() {
				switch choice {
				case "1":
					personageChoised = personages[indexOfPossiblesChoices[0]]
					validAnswer = true
				case "2" where numberOfPossiblesChoices > 1:
					personageChoised = personages[indexOfPossiblesChoices[1]]
					validAnswer = true
				case "3" where numberOfPossiblesChoices > 2:
					personageChoised = personages[indexOfPossiblesChoices[2]]
					validAnswer = true
				default:
					print("I did not understand !⁉️\n")
					validAnswer = false
				}
			}
		} while !validAnswer

		return personageChoised!
	}

	// function that perform an action by a team
	func performAnActionOn(_ otherTeam: Team ) {

		// selection of the fighter for team
		print("\(playerName), choose the personage who will perform an action :\n")
		let fighter1 = chooseAPersonage()

		// find or not a new weapon
		let newWeaponFound = isBoxAppear()
		if newWeaponFound != nil {
			fighter1.changeWeapon(with: newWeaponFound!)
		}

		// choose or not to use his superPower
		if fighter1.superPower != nil {
			fighter1.chooseSuperPower()
		} else {
			fighter1.usingWeapon = fighter1.weapon
		}

		if fighter1.personageKind == .magus {
			// selection and heal personage in team A
			print("And now, choose the personage that you want to heal :")
			let fighter2 = chooseAPersonage()
			fighter2.isHealedFor(fighter1.usingWeapon!.attackPoints)
			print("""
				💉      💊
				Good job, \(fighter2.name) has now \(fighter2.lifePoints) lifepoints left !

				""")
		} else {
			// selectection and attack pessonage in team B
			print("And now, choose the personage that you want to attack :\n")
			let fighter2 = otherTeam.chooseAPersonage()
			fighter2.isDamageFor(fighter1.usingWeapon!.attackPoints)
			print("""

				⚔️🛡   \(fighter1.name) is attacking \(fighter2.name) !!    🛡⚔️

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
	private func isBoxAppear() -> Weapon? {
		var weaponInBox: Weapon? = nil
		if arc4random_uniform(10) > 5 {
			print("""
			🎁  you are luky, a box appears in front of you ! 🎁
			""")
			let randomIndex = Int(arc4random_uniform(UInt32(WeaponFactory.list.count)))
			weaponInBox = WeaponFactory.list[randomIndex]
			print("""
				And you found in a \(weaponInBox!.kind) !!\n
				""")
		}
		return weaponInBox
	}

}
