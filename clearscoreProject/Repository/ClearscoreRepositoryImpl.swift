//
//  ClearscoreRepositoryImpl.swift
//  clearscoreProject
//
//  Created by Valencia Magagane on 2021/11/22.
//

import Foundation

class ClearscoreRepositoryImpl: ClearscoreRepository {
    let clearscoreService: ClearscoreService
    
    init(clearscoreService: ClearscoreService) {
        self.clearscoreService = clearscoreService
    }
   
    func fetchData(completion: @escaping ( Result<ClearscoreData, Error>) -> Void ) {
        clearscoreService.fetchData(completion: { result in
            switch result {
            case .success(let clearscoreData ):
                completion(Result.success(clearscoreData))
            case .failure(let error ):
                completion(Result.failure(error))
            }
        })
    }
}
