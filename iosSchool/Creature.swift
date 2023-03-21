//
//  Creature.swift
//  iosSchool
//
//  Created by Student 1 on 18.03.2023.
//

import Foundation

protocol Creature {
    var attack: Int { get }
    var protection: Int { get }
    var name: String { get }
    var health: Health { get }
    var damage: Damage { get }
}
