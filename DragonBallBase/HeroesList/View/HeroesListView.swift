//
//  HeroesListView.swift
//  DragonBallBase
//
//  Created by Camila Laura Lopez on 16/1/23.
//

import Foundation
import UIKit

class HeroesListView: UIView {
    
    //Create header view
    
    let headerLabel = {
        let label = UILabel()
        label.text = "MVC"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        //label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Create table view
    //let table = UIView()
    let heroesTableView = {
        let tableView = UITableView()
        tableView.register(HeroListViewCell.self, forCellReuseIdentifier: "HeroesListViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.backgroundColor = .blue
        
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Create app views
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        //addSubview(heroesTableView)
        backgroundColor = .white
        
        
        addSubview(headerLabel)
        addSubview(heroesTableView)
        
       NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
           // heroesTableView.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 50),
            //Si la label cambia su alto, de esta manera queda bien alineado
            heroesTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            heroesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            heroesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            heroesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
            
        ])
        
    }
    
}


