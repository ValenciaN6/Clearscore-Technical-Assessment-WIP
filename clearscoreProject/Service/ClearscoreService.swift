//
//  clearscoreService.swift
//  clearscoreProject
//
//  Created by Valencia Magagane on 2021/11/22.
//

import Foundation

protocol ClearscoreService {
    func fetchData(completion: @escaping (Result <ClearscoreData,Error>) -> Void)
}
