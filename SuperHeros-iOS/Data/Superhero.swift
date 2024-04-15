//
//  Superhero.swift
//  SuperHeros-iOS
//
//  Created by Mañanas on 12/4/24.
//

import Foundation

struct SuperheroResponse: Codable {
    let response: String
    let results: [Superhero]
}

struct Superhero: Codable {
    let id:String
    let name:String
    //let val stats:Stats
    //let biography:Biography
    //let work:Work
    let image:Image
}

struct Image: Codable {
    let url:String
}
