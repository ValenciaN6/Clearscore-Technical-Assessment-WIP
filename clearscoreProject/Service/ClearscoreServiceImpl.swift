//
//  clearscoreServiceImpl.swift
//  clearscoreProject
//
//  Created by Valencia Magagane on 2021/11/22.
//

import Foundation

class ClearscoreServiceImpl: ClearscoreService {
    let error = NSError(domain: "", code: 1, userInfo: nil)
    
    func fetchData(completion: @escaping (Result<ClearscoreData, Error>) -> Void) {
        guard let url = URL(string: .clearscoreUrl)
        else {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error) in if let error = error {
            completion(.failure(error.localizedDescription as! Error))
        }
            do {
                let clearscoreData = try JSONDecoder().decode(ClearscoreData.self, from: data!)
                completion(.success(clearscoreData))
            } catch{
                completion(.failure(error))
            }}).resume()
    }
    
    
}
