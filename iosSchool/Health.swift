//
//  Health.swift
//  iosSchool
//
//  Created by Student 1 on 15.03.2023.
//

import Foundation

public class Health {
    var health: Int         // здоровье, диапозон равен 0..N
    var isAlive: Bool      // статус существа: жив или нет, при первоначальном создании существа равно "жив"
    var countHeal: Int     // кол-во исцелений (0..3), при первоначальном создании существа равно 0
    var maxHealth: Int     // максимально возможное значение здоровья, равно певроначальному здоровью

    init(health: Int, isPlayer: Bool) {
        self.health = health
        if isPlayer {
            self.countHeal = 0     // первоначально никто не воскрешался
        } else {
            self.countHeal = 3     // монстру нельзя воскрешаться, поэтому лимит исчерпан
        }
        self.isAlive = true    // первоначально все живые
        self.maxHealth = health
    }

    static func checkHealth(health: Health, player: Player) {
        if health.health < 0 {
            if health.countHeal < 3 {           // ниже монстр не пройдет
                healing(player: player)
            } else {
                health.isAlive = false
            }
        }
    }

    static func healing(player: Player) {
        let health = player.health
        let percent = player.level.percent()
        var newHealth = Double(health.maxHealth) * percent
        newHealth.round(.up)
        health.health = Int(newHealth)
        health.countHeal += 1
    }
}
