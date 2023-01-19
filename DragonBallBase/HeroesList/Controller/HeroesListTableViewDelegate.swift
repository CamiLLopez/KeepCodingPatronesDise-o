//
//  HeroesListTableViewDelegate.swift
//  DragonBallBase
//
//  Created by Camila Laura Lopez on 17/1/23.
//

import Foundation
import UIKit


class HeroesListTableViewDelegate: NSObject, UITableViewDelegate {
    
    var didTapOnCell : ((Int)-> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //When tapped in a specific cell open another viewController with heroes details
        
        didTapOnCell?(indexPath.row)
        
        
        
    }
    
}
