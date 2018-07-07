//
//  PersonageCase.swift
//  FightGameTests
//
//  Created by David DUBEZ on 03/07/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import XCTest
@testable import FightGame

class PersonageCase: XCTestCase {

	// test of creation dagger weapon
	func testGivenPersonage1has100lifePoints_WhenGettingAttackbyPersonage2withAx_ThenPersonage1isdied() {
		let personage1 = Combatant(name: "luc")
		personage1.lifePoints = 100

		let personage2 = Dwarf(name: "Steeve")
		personage1.isAttackedBy(personage2)

//		XCTAssert(personage1.isdead)
	}

}
