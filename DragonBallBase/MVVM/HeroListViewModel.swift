//
//  HeroListViewModel.swift
//  DragonBallBase
//
//  Created by Camila Laura Lopez on 16/1/23.
//

import Foundation
import UIKit

class HeroListViewModel: NSObject {
    
    var updateUI: ((_ heroes: [HeroModel])-> Void)?
    
    
    
    override init() {
        
    }
    
    func fetchData(){
        
        let myToken = "eyJhbGciOiJIUzI1NiIsImtpZCI6InByaXZhdGUiLCJ0eXAiOiJKV1QifQ.eyJlbWFpbCI6ImNhbWlsYWxsb3Blejk1QGdtYWlsLmNvbSIsImlkZW50aWZ5IjoiMUVDOTlEMDMtNEMxMy00RkU1LUIwREEtQkJCNDFGQUUzN0RGIiwiZXhwaXJhdGlvbiI6NjQwOTIyMTEyMDB9.exgpZhqVdpjD3S4jQ--qNVTrrhXHCrKawiI_tpHQexs"
        
        let apiClient = ApiClient(token: myToken)
        
        
        apiClient.getHeroes{ [weak self] heroes, error in
            //debugPrint("PMG: \(heroes)")
            //debugPrint("PMG:", error ?? "No error")
            self?.updateUI?(heroes)
        }
        
    }
    
}
