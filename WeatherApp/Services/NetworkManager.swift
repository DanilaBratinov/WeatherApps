import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    var links = ["https://api.openweathermap.org/data/2.5/weather?lat=55.75&lon=37.61&lang=ru&appid=28ede8c4626bcba101f47c928f53f1b9&units=metric"]
    
    func fetch<T: Decodable>(_ type:T.Type, from url: String, completion: @escaping(Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let type = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func getRequest<T: Decodable>(type: T.Type, from url: String, completion: @escaping(Result<Any, NetworkError>)  -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("X-Yandex-API-Key", forHTTPHeaderField: "d977696d-c43d-4202-be70-2703a6a6abb5")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                completion(.success(type))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
