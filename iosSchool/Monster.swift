//
//  Monster.swift
//  iosSchool
//
//  Created by Student 1 on 15.03.2023.
//

import Foundation

struct Monster {
    let attack, protection: Int
    let name: String
    var health: Health
    var damage: Damage?

    init?(attack: Int, protection: Int, name: String, health: Int, lowDamage: Int, highDamage: Int) {

        if attack < 1 || attack > 20 {
            print("Атакой может быть целое число от 1 до 20. Пожалуйста, повторите попытку ввода.")
            return nil
        }
        if protection < 1 || protection > 20 {
            print("Защитой может быть целое число от 1 до 20. Пожалуйста, повторите попытку ввода.")
            return nil
        }

        self.attack = attack
        self.protection = protection
        self.name = name
        self.health = Health(health: health, isPlayer: false)

        let controlDamage = Damage(lowDamage: lowDamage, highDamage: highDamage)
        if controlDamage != nil {
            self.damage = controlDamage
        } else {
            return nil
        }
    }
}
