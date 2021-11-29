//
//  DashboardViewController.swift
//  clearscoreProject
//
//  Created by Valencia Magagane on 2021/11/22.
//

import UIKit
import Foundation

class DashboardViewController: UIViewController {
    @IBOutlet weak var dashboardView: UIView!
    @IBOutlet weak var scoreHeader: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    private var clearscoreData: ClearscoreData?
    private var clearscoreRepository: ClearscoreRepository?
    
    private lazy var viewModel = DashboardViewModel(view: self)
    lazy var clearScoreView = ClearScoreView()
    
    public init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewModel.configureView()
        viewModel.fetchData()
        
        addClearScoreView()
    }
    
    func addClearScoreView() {
        dashboardView.layer.cornerRadius = 100
        dashboardView.layer.cornerRadius = 100
        dashboardView.addSubview(clearScoreView)
        clearScoreView.translatesAutoresizingMaskIntoConstraints = false
        clearScoreView.centerXAnchor.constraint(equalTo: dashboardView.centerXAnchor).isActive = true
        clearScoreView.centerYAnchor.constraint(equalTo: dashboardView.centerYAnchor).isActive = true
        clearScoreView.widthAnchor.constraint(equalToConstant: dashboardView.frame.width * 0.95).isActive = true
        clearScoreView.heightAnchor.constraint(equalToConstant: dashboardView.frame.height * 0.95).isActive = true
    }
  
}
extension DashboardViewController: DashboardView {
   func title(title: String) {
        self.titleLabel.text = title
    }
    
   func scoreDescription(description: String) {
        self.scoreHeader.text = description
   }

   func score(score: Double) {
        self.scoreLabel.text = "\(score)"
        let progress = score/700
       
        clearScoreView.progress = progress
      
        if (clearScoreView.progress < 1) {
            clearScoreView.progress =  progress
        }
    }

    func subDescription(sub: String) {
        self.totalLabel.text = sub
    }
}
