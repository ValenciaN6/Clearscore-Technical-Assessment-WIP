//
//  PersonalDetailViewController.swift
//  clearscoreProject
//
//  Created by Valencia Magagane on 2021/11/24.
//

import UIKit

class PersonalDetailViewController: UIViewController, PersonalDetailsView {
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var status: UILabel!
   
    private var clearscoreData: ClearscoreData?
    private var clearscoreRepository: ClearscoreRepository?
    
    private lazy var viewModel = PersonalDetailViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.configureView()
        viewModel.fetchData()
    }

    public init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func title(title: String) {
        self.headerTitle.text = title
    }
    
    func status(text: String) {
        self.status.text = text
    }

}
