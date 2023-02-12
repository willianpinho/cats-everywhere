//
//  SearchService.swift
//  Cats Everywhere
//
//  Created by Willian Junior Peres de Pinho on 09/02/23.
//

import Foundation
import Alamofire

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

class SearchService {
    
    // MARK: - Properties
    private let baseURL = URL(string: "https://api.imgur.com/3/gallery/search/")!
    
    // MARK: - Methods
    public func getSearchCats(completion: @escaping (_ result: Result<[ImageObject]>) -> Void) {
        let clientID: String = "1ceddedc03a5d71"
        let secretID: String = "63775118a9f912fd91ed99574becf3b375d9eeca"
        let urlPath: String = "https://api.imgur.com/3/gallery/search/?q=cats"
        
        let parameters = [
            "client_id" : clientID,
            "client_secret" : secretID,
            "grant_type" : "client_credentials",
            "q": "cats"
        ]
        var items = [URLQueryItem]()

        for (key,value) in parameters {
            items.append(URLQueryItem(name: key, value: value))
        }
        
        guard let url = URL(string: urlPath) else {
            return
        }
        
        var request = URLRequest(url: url.appending(queryItems: items))
        request.setValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data, error == nil else { return }
            do {
                let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: dataResponse)
                completion(.success(searchResponse.data))
            } catch let parsingError {
                completion(.failure(parsingError))
            }
        }
        task.resume()
    }
}
