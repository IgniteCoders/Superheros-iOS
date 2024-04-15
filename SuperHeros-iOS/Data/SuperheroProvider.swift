//
//  SuperheroProvider.swift
//  SuperHeros-iOS
//
//  Created by Mañanas on 12/4/24.
//

import Foundation

class SuperheroProvider {
    
    static func searchByName(query: String, completionHandler: @escaping ([Superhero]) -> Void) {
        let url = URL(string: "\(Constants.API_BASE_URL)search/\(query)")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error fetching superheroes: \(error)")
                return
            }
            
            /*if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                print("Error with the response, unexpected status code: \(httpResponse.statusCode)")
                return
            }*/
            
            guard let data = data else {
                print("Error with the data")
                return
            }
            
            print("Data: \(data)")
            
            guard let json = try? JSONDecoder().decode(SuperheroResponse.self, from: data) else {
                print("JSON parse exception")
                return
            }
            
            completionHandler(json.results)
            
        })
        
        task.resume()
    }
    
    static func findById() {
        
    }
}

// MARK: Utils

struct RuntimeError: Error {
    let description: String

    init(_ description: String) {
        self.description = description
    }
}
