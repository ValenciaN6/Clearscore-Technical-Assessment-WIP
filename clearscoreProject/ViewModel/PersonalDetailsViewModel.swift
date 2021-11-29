//
//  PersonalDetailsViewModel.swift
//  clearscoreProject
//
//  Created by Valencia Magagane on 2021/11/24.
//

import Foundation

class PersonalDetailViewModel {
    private weak var view: PersonalDetailsView?
    var clearscoreData: ClearscoreData?
    lazy var clearscoreRepository: ClearscoreRepository = ClearscoreRepositoryImpl(clearscoreService: ClearscoreServiceImpl())
    
    init(view: PersonalDetailsView) {
        self.view = view
    }
    
    func configureView() {
        view?.title(title: "Personal Detail")
    }
    
    private func getPersonalDetailSucceeds(_ clearscoreData: ClearscoreData) {
        DispatchQueue.main.async {
            self.clearscoreData = clearscoreData
            self.view?.status(text: "Account Status: " + (clearscoreData.accountIDVStatus))
        }
    }
    
    private func failureToGetPersonalDetails(_ error: Error) {
        
    }
    
    func fetchData() {
        DispatchQueue.global(qos: .userInitiated).async {
           self.clearscoreRepository.fetchData(completion: { result in
                switch result {
                case .success(let clearscoreData ):
                    self.getPersonalDetailSucceeds(clearscoreData)
                case .failure(let error ):
                    self.failureToGetPersonalDetails(error)
                }
            })
        }
    }
}
