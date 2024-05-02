//
//  Service.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import Foundation

protocol ServiceProtocol {
    var dataTask: URLSessionDataTask? { get set }
}

class Service: ServiceProtocol {
    var dataTask: URLSessionDataTask?
    
    func getProduct(onSuccess: @escaping([ProductFeed]) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: Status Code.. \(response.statusCode)")
                }
                
                if let data = data {
                    do {
                        let productResponse = try JSONDecoder().decode([ProductResponse].self, from: data)
                        var productFeed: [ProductFeed] = []
                        
                        for prod in productResponse {
                            productFeed.append(
                                ProductFeed(
                                    title: prod.title,
                                    price: prod.price,
                                    description: prod.description,
                                    category: ProductFeed.Category.init(
                                        electronics: prod.category.rawValue,
                                        jewelery: prod.category.rawValue,
                                        menSClothing: prod.category.rawValue,
                                        womenSClothing: prod.category.rawValue),
                                    image: prod.image,
                                    rating: prod.rating.rate))
                        }
                        onSuccess(productFeed)
                        print("DEBUG: Produtos.. \(productFeed)")
                    } catch {
                        onError(error)
                        print("DEBUG: Erro ao decodificar Produtos.. \(error.localizedDescription)")
                    }
                }
            }
        })
        dataTask?.resume()
    }
}
