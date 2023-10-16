//
//  NetworkManager.swift
//  HKR News
//
//  Created by Hayner Esteves on 28/09/23.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var stories = [Stories]() //create a property that is going to be observed by the contant view
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in //add the |let task = | to use after the closure to start it with |task.resume()|
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let result = self.parseJSON(with: safeData){
                        //every time you use a published property, it needs to be on the main thread
                        DispatchQueue.main.async {
                            self.stories = result.hits
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(with hnData: Data) -> HkrData? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(HkrData.self, from: hnData)
            return decodedData
            
        } catch {
            print(error)
            return nil
        }
        
        
        
    }
}
