//
//  DashboardViewModel.swift
//  clearscoreProject
//
//  Created by Valencia Magagane on 2021/11/22.
//

import Foundation

class DashboardViewModel {
    private weak var view: DashboardView?
    lazy var clearscoreRepository: ClearscoreRepository = ClearscoreRepositoryImpl(clearscoreService: ClearscoreServiceImpl())
    var clearscoreData: ClearscoreData?
   
    init(view: DashboardView) {
        self.view = view
    }
    
    func configureView() {
        self.view?.title(title: "Dashboard")
        self.view?.scoreDescription(description: "Your credit score is")
        self.view?.subDescription(sub: "out of 700")
    }
    
    private func handleSuccess(_ clearscoreData: ClearscoreData) {
        DispatchQueue.main.async {
            self.clearscoreData = clearscoreData
            self.view?.score(score: Double(clearscoreData.creditReportInfo.score))
        }
    }
    
    private func handleFailure(_ error: Error) {
        DispatchQueue.main.async {
            
        }
    }
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async {
           self.clearscoreRepository.fetchData(completion: { result in
                switch result {
                case .success(let clearscoreData ):
                    self.handleSuccess(clearscoreData)
                case .failure(let error ):
                    self.handleFailure(error)
                }
            })
        }
    }

}
