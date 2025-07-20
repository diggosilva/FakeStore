//
//  Service.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import Foundation

protocol ServiceProtocol {
    func getProducts(onSuccess: @escaping([Product]) -> Void, onError: @escaping(Error) -> Void)
}

final class Service: ServiceProtocol {
    func getProducts(onSuccess: @escaping([Product]) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: Status Code.. \(response.statusCode)")
                }
                
                if let data = data {
                    do {
                        let productResponse = try JSONDecoder().decode([ProductResponse].self, from: data)
                        var product: [Product] = []
                        
                        for prod in productResponse {
                            product.append(Product(id: prod.id,
                                                   title: prod.title,
                                                   price: prod.price,
                                                   description: prod.description,
                                                   category: prod.category.rawValue,
                                                   image: prod.image,
                                                   rating: prod.rating.rate))
                        }
                        onSuccess(product)
                    } catch {
                        onError(error)
                        print("DEBUG: Erro ao decodificar Produtos.. \(error.localizedDescription)")
                    }
                }
            }
        }).resume()
    }
}
