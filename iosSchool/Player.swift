//
//  Player.swift
//  iosSchool
//
//  Created by Student 1 on 15.03.2023.
//

import Foundation

enum Level: String {
    case low = "Низкий"
    case middle = "Средний"
    case high = "Высокий"

    func percent() -> Double {
        switch self {
        case .low:
            return 0.1
        case .middle:
            return 0.25
        case .high:
            return 0.5
        }
    }
}

class Player {
    let attack, protection: Int
    var level: Level?
    let name: String
    var health: Health
    var damage: Damage?

    init? (attack: Int, protection: Int, level: String, name: String, health: Int, lowDamage: Int, highDamage: Int) {
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

        self.level = Level(rawValue: level) ?? nil
        if self.level == nil {
            print("Уровень игрока выбран неверно. Может быть: Низкий Средний и Высокий.")
            return nil
        }

        self.name = name
        self.health = Health(health: health, isPlayer: true)

        let controlDamage = Damage(lowDamage: lowDamage, highDamage: highDamage)
        if controlDamage != nil {
            self.damage = controlDamage
        } else {
            return nil
        }
    }
}
