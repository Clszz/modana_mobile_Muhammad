//
//  APIService.swift
//  modana_mobile_Muhammad
//
//  Created by Muhammad Reynaldi on 12/03/20.
//  Copyright © 2020 -. All rights reserved.
//

import Foundation

enum PublicServiceError: Error{
    case noDataAvailable
}

struct PublicService {
    var resourceURL:URL
    
    init(category:String) {
        let resourceString = "https://api.publicapis.org/entries?category=\(category)"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}

        self.resourceURL = resourceURL
    }
    
    func getPublic(completion: @escaping(Result<[Public], PublicServiceError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL){ data, res, error in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let publicReponse = try decoder.decode(Publics.self, from: jsonData)
                let publics = publicReponse.entries
                completion(.success(publics))
            }catch{
                completion(.failure(.noDataAvailable))
                return
            }
        }
        dataTask.resume()
    }
}
