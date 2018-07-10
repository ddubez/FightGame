//
//  Personage.swift
//  FightGame
//
//  Created by David DUBEZ on 20/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import Foundation

class Personage {
	//======================
	// MARK: - Properties
	//======================

	// creation of name property : a String (the name of the Personage)
	var name: String

	// creation of kind property : a PersonageKind enum (the kind of the personage : "combatant", "magus" ...)
	var personageKind: PersonageKind

	// creation of PersonageKind enum : a list of kind of personages
	enum PersonageKind {
		case combatant, magus, colossus, dwarf
	}

	// creation of lifePoints property : a Int (the number of point of life for e personage)
	var lifePoints = 0

	// creation of weapon property : a Weapon structure (the weapon of a personage)
	var weapon: Weapon

	// creation of usingWeapon property : the weapon or the superPower that personage is using to perform an action
	var usingWeapon: Weapon?

	// creation of inGame : the game where is the personage
	var inGame: Game

	// creation of isdead property : a Bool (is the personage is alive or dead)
	var isdead: Bool {
		return lifePoints <= 0
	}

	// creation of a get property : sort : a Sort Enum for the sort of the personage
	var sort: Sort {
		if personageKind == .magus {
			return Sort.healer
		} else {
			return Sort.fighter
		}
	}

	// création of sort enum
	enum Sort {
		case fighter, healer
	}

	// création of SuperPower property : a super power that points increments at each turn of the game
	var superPower: SuperPower?

	// initialization of properties
	init(name: String, kind: PersonageKind, weapon: Weapon, inGame: Game) {
		self.name = name
		self.personageKind = kind
		self.weapon = weapon
		self.inGame = inGame
	}
	convenience init(name: String, inGame: Game) {
		self.init(name: name, kind: .combatant, weapon: WeaponFactory.sword, inGame: inGame)
	}

	//======================
	// MARK: - Methods
	//======================

	// function that remove lifepoints during an attack
	func isDamageFor(_ points: Int) {
		lifePoints -= points
	}

	//function that add lifepoints during a magus care
	func isHealedFor(_ points: Int) {
		lifePoints += points
	}

	// function that make a description of a personage
	func makeDescription() -> String {
		var powerDescription = ""
		if superPower != nil {
			powerDescription = " and he still had his super power : \n      \(superPower!.kind) "
			+ "which have \(superPower!.attackPoints) attack points "
			+ "but will cause a damage of \(superPower!.damagePoints) life points to him"
		}
		return "\(name): He's a \(personageKind) with \(lifePoints) lifepoints left,"
		+ " he's got a \(weapon.kind) with \(weapon.attackPoints) attack points " + powerDescription
	}

	// function that make a personge change or not his weapon
	func changeWeapon(with newWeapon: Weapon) {
		switch sort {
		case .fighter where newWeapon.action == .heal:
			print("Sorry, but a \(personageKind) can't have a heal weapon ")
		case .healer where newWeapon.action == .attack:
			print("Sorry, but a \(personageKind) can't have a attack weapon ")
		default:
			print("""
				Now, \(name) has a \(weapon.kind) for weapon witch have \(weapon.attackPoints) attack point.
				Do you want to change it with \(newWeapon.kind) witch have \(newWeapon.attackPoints) attack points ?
				(y / n)
				""")
			var validAnswer = false
			repeat {
				if let choice = readLine() {
					switch choice {
					case "y":
						weapon = newWeapon
						print("ok, \(name) has now a \(weapon.kind) for weapon")
						validAnswer = true
					case "n":
						print("ok")
						validAnswer = true
					default:
						print("I did not understand !⁉️\n")
					}
				}
			} while validAnswer == false
		}
	}

	// function that make a personage choose or not his superPower
	func chooseSuperPower() {
		print("""
			You've got \(superPower!.kind) as a super power, with \(superPower!.attackPoints) attack points
			(but will cause a damage of \(superPower!.damagePoints) life points to you)
			Do you want to use your super power ?
			(y / n)
			""")
		var validAnswer = false
		repeat {
			if let choice = readLine() {
				switch choice {
				case "y":
					usingWeapon = superPower
					print("ok, \(name) will use his super power\n")
					isDamageFor(superPower!.damagePoints)
					validAnswer = true
					superPower = nil
				case "n":
					usingWeapon = weapon
					print("ok")
					validAnswer = true
				default:
					print("I did not understand !⁉️\n")
				}
			}
		} while validAnswer == false
	}

	// func that add experience (superpower and life point) to a personage in function of the number of turn in a game
	func addExperience() {
		if let power = superPower {
			power.increasePower(for: game)
			lifePoints += 10
			}
	}
}
