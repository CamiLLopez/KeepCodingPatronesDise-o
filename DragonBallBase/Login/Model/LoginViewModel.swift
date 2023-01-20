//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by Camila Laura Lopez on 20/1/23.
//

import Foundation
import UIKit

class LoginViewModel: NSObject {
    
    
    var updateLogin: ((_ token: String)->Void)?
    
    override init() {
        
    }
    
    func fetchLogin(email: String, password: String){
        
        let email: String? = email
        let password: String? = password
        
        let myToken = "eyJhbGciOiJIUzI1NiIsImtpZCI6InByaXZhdGUiLCJ0eXAiOiJKV1QifQ.eyJlbWFpbCI6ImNhbWlsYWxsb3Blejk1QGdtYWlsLmNvbSIsImlkZW50aWZ5IjoiMUVDOTlEMDMtNEMxMy00RkU1LUIwREEtQkJCNDFGQUUzN0RGIiwiZXhwaXJhdGlvbiI6NjQwOTIyMTEyMDB9.exgpZhqVdpjD3S4jQ--qNVTrrhXHCrKawiI_tpHQexs"
        
        let apiClient = ApiClient(token: myToken)

        apiClient.login(user: email!, password: password!) { loginToken, error in
            
            debugPrint("PMG: \(loginToken ?? "No login")")
            
            debugPrint("PMG:", error ?? "No error")
            
            self.updateLogin?(loginToken ?? "No token")
        
        }
    }
}
