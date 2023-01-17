//
//  HeroesListTableViewController.swift
//  DragonBallBase
//
//  Created by Camila Laura Lopez on 16/1/23.
//

import Foundation
import UIKit


class HeroesListTableViewController: UIViewController {
    
    var mainView: HeroesListView { self.view as! HeroesListView}
    
    var heroes : [HeroModel] =  []
    var tableViewDataSource: HeroesListTableViewDataSource?
    var viewModel: HeroListViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        viewModel = HeroListViewModel()
        //Preparando para recibir datos del viewModel
        viewModel?.updateUI = { [weak self] heroes in
            self?.heroes = heroes
            self?.tableViewDataSource?.heroes = heroes
            
        }
        
        //CALL API TO GET HEROES LIST
        viewModel?.fetchData()
        
    }
    
    override func loadView() {
        view = HeroesListView()
        
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView)
        
        mainView.heroesTableView.dataSource = tableViewDataSource
    }
    
    
}
