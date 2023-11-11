import UIKit

struct Finance: Decodable {
    let id: String
    let name: String
    let min_size: String
}

struct FinanceQuery: Decodable {
    let data: [Finance]
}
