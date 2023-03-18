//
//  Monster.swift
//  iosSchool
//
//  Created by Student 1 on 15.03.2023.
//

import Foundation

struct Monster {
    let attack: Int
    let protection: Int?
    let name: String
    var health: Health
    var damage: Damage

    init?(attack: Int, protection: Int?, name: String, health: Int, lowDamage: Int, highDamage: Int) {

        if attack < 1 || attack > 20 {
            print("Атакой может быть целое число от 1 до 20. Пожалуйста, повторите попытку ввода.")
            return nil
        }

        if let protection, protection >= 0 && protection <= 20 {
            self.protection = protection
        } else if protection == nil {
            self.protection = 0
        } else {
            print("Защитой может быть целое число от 0 до 20. Пожалуйста, повторите попытку ввода.")
            return nil
        }

        self.attack = attack
        self.name = name
        self.health = Health(health: health, isPlayer: false)

        let controlDamage = Damage(lowDamage: lowDamage, highDamage: highDamage)
        if let controlDamage {
            self.damage = controlDamage
        } else {
            return nil
        }
    }
}
