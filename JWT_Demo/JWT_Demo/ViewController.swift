//
//  ViewController.swift
//  JWT_Demo
//
//  Created by Vivek Gajbe on 11/30/18.
//  Copyright © 2018 Intelegain. All rights reserved.
//

import UIKit
//import JWTDecode
import JWT

class ViewController: UIViewController {
let tocken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL3NhbXBsZXMuYXV0aDAuY29tIiwic3ViIjoiYXV0aDB8MTAxMDEwMTAxMCIsImF1ZCI6Imh0dHBzOi8vc2FtcGxlcy5hdXRoMC5jb20iLCJleHAiOjEzNzI2NzQzMzYsImlhdCI6MTM3MjYzODMzNiwianRpIjoicXdlcnR5MTIzNDU2IiwibmJmIjoxMzcyNjM4MzM2LCJlbWFpbCI6InVzZXJAaG9zdC5jb20iLCJjdXN0b20iOlsxLDIsM119.JeMRyHLkcoiqGxd958B6PABKNvhOhIgw-kbjecmhR_E"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setControllerPrrefrances()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - custom function
    func setControllerPrrefrances()
    {
        let strKey = "iOS Developer Tips encoded in Base64"
       // let utf8str = strKey.toBase64()
        
        var claims = ClaimSet()
        claims.issuer = "fuller.li"
        claims.issuedAt = Date()
        claims["custom"] = "Hi"

        let str = JWT.encode(claims: claims, algorithm: .hs384(strKey.data(using: .utf8)!))
        

        do {
            let claims1: ClaimSet = try JWT.decode("eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJmdWxsZXIubGkiLCJpYXQiOjE1NDM1NzMzNDkuMTE4ODU3OSwiY3VzdG9tIjoiSGkifQ.Ct_9lxO-Px1Ujj0qbqlvT1cQM8lpfoE4_SmH4NK3MSDcfsrOfYMyQLmKNr6KThPa", algorithm: .hs384(strKey.data(using: .utf8)!))//"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.2_8pWJfyPup0YwOXK7g9Dn0cF1E3pdn299t4hSeJy5w"
            print(claims1)
        } catch {
            print("Failed to decode JWT: \(error)")
        }
    }

}
extension String {
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}
