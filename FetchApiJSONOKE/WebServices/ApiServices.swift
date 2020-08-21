//
//  ApiServices.swift
//  FetchApiJSONOKE
//
//  Created by Ipung Dev Center on 21/08/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ApiServices: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var datatotal = [Total]() {
        willSet {
            objectWillChange.send()
        }
    }
    

    init(){
        guard let url = URL(string: "https://data.covid19.go.id/public/api/update.json") else {
            fatalError("INVALID URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            let result = try? JSONDecoder().decode(CovidResponse.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    self.datatotal = [result.update.total]
                    
                }
            }
        }.resume()
    }
}
