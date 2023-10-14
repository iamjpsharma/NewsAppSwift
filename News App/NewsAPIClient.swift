//
//  NewsAPIClient.swift
//  News App
//
//  Created by jaiprakash sharma on 14/10/23.
//

import Foundation
import Alamofire

class NewsAPIClient {
    static let shared = NewsAPIClient()

    private init() {}

    // Function to fetch news articles
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        let urlString = "\(NewsAPIConfig.baseUrl)?country=\(NewsAPIConfig.country)&apiKey=\(NewsAPIConfig.apiKey)"

        AF.request(urlString).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                        completion(.success(newsResponse.articles))
                    } catch {
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
