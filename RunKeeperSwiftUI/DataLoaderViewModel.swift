//
//  WebService.swift
//  RunKeeperSwiftUI
//
//  Created by Razieh Halimi on 2022-10-22.
//

import Foundation

class DataLoaderViewModel: ObservableObject {
    @Published var medals = [Medal]()
    @Published var medalByCategory = [String: [Medal]]()
    
    func getData() {
        if let file = Bundle.main.url(forResource: "data", withExtension: "json"){
            do {
                let content = try Data(contentsOf: file)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(MedalData.self, from: content)
                self.medals = decodedData.medals
                self.medalByCategory = Dictionary(grouping: decodedData.medals) { $0.categoryType}
            }
            catch let error{
                print(error.localizedDescription)
            }
        }
    }
    
//    func getData(completion: @escaping(Result<[Medal],Error>)-> Void) {
//        if let file = Bundle.main.url(forResource: "data", withExtension: "json"){
//            do {
//                let content = try Data(contentsOf: file)
//                let decoder = JSONDecoder()
//                let decodedData = try decoder.decode(MedalData.self, from: content)
//                completion(.success(decodedData.medals))
//            }
//            catch let error{
//                completion(.failure(error))
//            }
//        }
//    }
}
