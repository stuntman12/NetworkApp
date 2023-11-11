
import UIKit


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func downloadData(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else {
                print("Invalid response or data")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let user = try decoder.decode(FinanceQuery.self, from: data)
                print(user)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
