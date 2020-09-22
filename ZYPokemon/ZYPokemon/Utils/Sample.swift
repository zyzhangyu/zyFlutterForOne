//
//  Sample.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/21.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import Foundation
extension PokemonViewModel {
    static var all: [PokemonViewModel] = {
        (1...30).map { id in
            let pokemon = Pokemon.sample(id: id)
            let species = PokemonSpecies.sample(url: pokemon.species.url)
            return PokemonViewModel(pokemon: pokemon, species: species)
        }
    }()

    static let samples: [PokemonViewModel] = [
        sample(id: 1),
        sample(id: 2),
        sample(id: 3),
    ]

    static func sample(id: Int) -> PokemonViewModel {
        let pokemon = Pokemon.sample(id: id)
        let species = PokemonSpecies.sample(url: pokemon.species.url)
        return PokemonViewModel(pokemon: pokemon, species: species)
    }
}

extension Pokemon {
    static func sample(id: Int) -> Pokemon {
        return FileHelper.loadBundledJSON(file: "pokemon-\(id)")
    }
}
extension PokemonSpecies {
    static func sample(url: URL) -> PokemonSpecies {
        return FileHelper.loadBundledJSON(file: "pokemon-species-\(url.extractedID!)")
    }
}
extension AbilityViewModel {
    static func sample(pokemonID: Int) -> [AbilityViewModel] {
        Pokemon.sample(id: pokemonID).abilities.map {
            AbilityViewModel(ability: Ability.sample(url: $0.ability.url))
        }
    }
}
extension Ability {
    static func sample(url: URL) -> Ability {
        sample(id: url.extractedID!)
    }

    static func sample(id: Int) -> Ability {
        return FileHelper.loadBundledJSON(file: "ability-\(id)")
    }
}
