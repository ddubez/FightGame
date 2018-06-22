//
//  WeaponCase.swift
//  FightGameTests
//
//  Created by David DUBEZ on 22/06/2018.
//  Copyright © 2018 David DUBEZ. All rights reserved.
//

import XCTest
@testable import FightGame

class WeaponCase: XCTestCase {

	// test of creation dagger weapon
	func testGivenWeaponIsDagger_WhenGettingAttackPoints_ThenAttackPointsShouldBe10() {
		let newWeapon =  dagger

		XCTAssertEqual(newWeapon.attackPoints: 15)
		XCTAssertEqual(newWeapon.kind: "dagger")
	}
}
