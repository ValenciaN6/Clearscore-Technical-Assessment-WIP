//
//  DashboardView.swift
//  clearscoreProject
//
//  Created by Valencia Magagane on 2021/11/22.
//

import Foundation

protocol DashboardView: AnyObject {
    func title (title: String)
    func scoreDescription (description: String)
    func score (score: Double)
    func subDescription (sub: String)
}
