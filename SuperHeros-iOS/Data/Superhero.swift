//
//  Superhero.swift
//  SuperHeros-iOS
//
//  Created by Mañanas on 12/4/24.
//

import UIKit

struct SuperheroResponse: Codable {
    let response: String
    let results: [Superhero]
}

struct Superhero: Codable {
    let id: String
    let name: String
    let powerstats: Stats
    let biography:Biography
    //let work:Work
    var image: Image
}

struct Image: Codable {
    let url: String
}

struct Biography: Codable {
    let publisher: String
}

struct Stats: Codable {
    let intelligence: String?
    let strength: String?
    let speed: String?
    let durability: String?
    let power: String?
    let combat: String?
}
