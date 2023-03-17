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

        let player = Player(
                        attack: 1,
                        protection: 1,
                        level: "Низкий",
                        name: "Игрок",
                        health: 3,
                        lowDamage: 1,
                        highDamage: 6)
        let monster = Monster(
                        attack: 1,
                        protection: 1,
                        name: "Монстр",
                        health: 2,
                        lowDamage: 1,
                        highDamage: 6)

        if monster != nil && player != nil {
            while true {
                if player!.health.isAlive && monster!.health.isAlive {
                    attacking_full_scenario(player: player!, monster: monster!, isPlayerAttacking: false)
                } else {
                    break
                }

                if player!.health.isAlive && monster!.health.isAlive {
                    attacking_full_scenario(player: player!, monster: monster!, isPlayerAttacking: true)
                } else {
                    break
                }

                print("\n")
            }
        }
    }

    func attacking_full_scenario(player: Player, monster: Monster, isPlayerAttacking: Bool) {

        if isPlayerAttacking {
            print("\(player.name) нападает на \(monster.name)!")

            let attackModif = Damage.attack_modificator(
                                        attackersAttack: player.attack,
                                        protectorsProtect: monster.protection)
            if Damage.is_success(modif: attackModif) {
                Damage.attacking(player: player, monster: monster, isPlayerAttacking: true)
                if !monster.health.isAlive {
                    print("\(monster.name) побежден ура!")
                }
            }
        } else {
            print("\(monster.name) нападает на \(player.name)!")

            let attackModif = Damage.attack_modificator(
                                        attackersAttack: monster.attack,
                                        protectorsProtect: player.protection)
            if Damage.is_success(modif: attackModif) {
                Damage.attacking(player: player, monster: monster, isPlayerAttacking: false)
                if !player.health.isAlive {
                    print("\(player.name) побежден ура!")
                }
            }
        }
    }

}
