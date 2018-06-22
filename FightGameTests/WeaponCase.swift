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

	func testGivenWeaponIsDagger_WhenGettingAttackPoints_ThenAttackPointsShouldBe10() {
		let newWeapon =  Weapon(kind: dagger, attackPoints: 10)

		XCTAssertEqual(newWeapon.attackPoints: 15)
	}
}
