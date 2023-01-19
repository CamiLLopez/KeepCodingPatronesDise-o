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
    var tableViewDelegate: HeroesListTableViewDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setUpUpdateUI()
       setUpTableDelegate()
       getData()
            
        }
    
    override func loadView() {
        view = HeroesListView()
        
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView)
        
        mainView.heroesTableView.dataSource = tableViewDataSource
        
        tableViewDelegate = HeroesListTableViewDelegate()
        mainView.heroesTableView.delegate = tableViewDelegate
    }
    
    func setUpUpdateUI(){
        viewModel = HeroListViewModel()
        //Preparando para recibir datos del viewModel
        viewModel?.updateUI = { [weak self] heroes in
            self?.heroes = heroes
            self?.tableViewDataSource?.heroes = heroes
        }
    }
    
    func getData(){
        
        //CALL API TO GET HEROES LIST
        viewModel?.fetchData()
        
    }
        
    func setUpTableDelegate(){
            
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            
           //Take hero in the hero list according to position index
           let hero = dataSource.heroes[index]
            
            //Prepare view controller to present detail
            
            let heroDetailViewController = HeroDetailViewController(heroeDetailModel: hero)
            
            //present controller details
            
            self?.present(heroDetailViewController, animated: true)
        }
    }

}
