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
    
    var updateLogin: ((_ token: String)->Void)?
    
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
    
    func fetchLogin(email: String, password: String){
        
        let email: String? = email
        let password: String? = password
        
        let myToken = "eyJhbGciOiJIUzI1NiIsImtpZCI6InByaXZhdGUiLCJ0eXAiOiJKV1QifQ.eyJlbWFpbCI6ImNhbWlsYWxsb3Blejk1QGdtYWlsLmNvbSIsImlkZW50aWZ5IjoiMUVDOTlEMDMtNEMxMy00RkU1LUIwREEtQkJCNDFGQUUzN0RGIiwiZXhwaXJhdGlvbiI6NjQwOTIyMTEyMDB9.exgpZhqVdpjD3S4jQ--qNVTrrhXHCrKawiI_tpHQexs"
        
        let apiClient = ApiClient(token: myToken)

        apiClient.login(user: email ?? "camilallopez95@gmail.com", password: password ?? "Cl1995#") { loginToken, error in
            
            debugPrint("PMG: \(loginToken ?? "No login")")
            
            debugPrint("PMG:", error ?? "No error")
            
            self.updateLogin?(loginToken ?? "No token")
        }
    }
}
