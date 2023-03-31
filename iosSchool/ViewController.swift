//
//  ViewController.swift
//  iosSchool
//
//  Created by Student 1 on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let player, monster: Creature
        guard let player = Player(
            attack: 1,
            protection: 1,
            level: "Низкий",
            name: "Игрок",
            health: 3,
            lowDamage: 1,
            highDamage: 6
        ) else {
            print("Исправьте вышеуказанные ошибки")
            return
        }
        guard let monster = Monster(
            attack: 1,
            protection: 5,
            name: "Монстр",
            health: 2,
            lowDamage: 1,
            highDamage: 6
        ) else {
            print("Исправьте вышеуказанные ошибки")
            return
        }

        while true {
            if player.health.isAlive && monster.health.isAlive {
                attackingFullScenario(attacker: monster, protector: player)
            } else {
                break
            }

            if player.health.isAlive && monster.health.isAlive {
                attackingFullScenario(attacker: player, protector: monster)
            } else {
                break
            }

            print("\n")
        }

    }

    func attackingFullScenario(attacker: Creature, protector: Creature) {
        print("\(attacker.name) нападает на \(protector.name)!")

        let attackModif = Damage.attackModificator(
            attackersAttack: attacker.attack,
            protectorsProtect: protector.protection
        )
        if Damage.isSuccess(modif: attackModif) {
            Damage.attacking(attacker: attacker, protector: protector)
            if !protector.health.isAlive {
                print("\(protector.name) побежден ура!")
            }
        }
    }

}
