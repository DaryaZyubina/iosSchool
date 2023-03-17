//
//  Damage.swift
//  iosSchool
//
//  Created by Student 1 on 15.03.2023.
//

import Foundation

public class Damage {
    let lowDamage, highDamage: Int

    init? (lowDamage: Int, highDamage: Int) {
        if lowDamage < 0 || highDamage < 0 {
            print("Cущество не может нанести самому себе урон. Введите положительные целые числа для урона.")
            return nil
        }
        if lowDamage > highDamage {
            print("Нижняя граница урона не может быть выше верхней границы урона. Пожалуйста, повторите попытку ввода.")
            return nil
        }
        self.lowDamage = lowDamage
        self.highDamage = highDamage
    }

    static func attack_modificator(attackersAttack: Int, protectorsProtect: Int) -> Int {
        let modif = attackersAttack - protectorsProtect + 1
        print("Модификатор атаки = \(modif)")
        return modif
    }

    static func is_success(modif: Int) -> Bool {
        let minN = 1, maxN = 6
        let num = Swift.max(modif, 1)
        for _ in 1...num {
            if (Int.random(in: minN..<(maxN+1))) >= 5 {
                print("Удар был успешным!")
                return true
            }
        }
        print("Удар не был успешным")
        return false
    }

    static func attacking(player: Player, monster: Monster, isPlayerAttacking: Bool) {
        var healthProtector: Health
        var damageAttacker: Damage

        if isPlayerAttacking {              // определяем кто атакует и кто защищается
            healthProtector = monster.health
            damageAttacker = player.damage!
        } else {
            healthProtector = player.health
            damageAttacker = monster.damage!
        }

        let attack = Int.random(in: damageAttacker.lowDamage..<(damageAttacker.highDamage + 1))
        print("Урон атаки = \(attack)")

        healthProtector.health -= attack
        Health.check_health(health: healthProtector, player: player)    // проверяем здоровье жертвы
    }
}
