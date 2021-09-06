import Foundation

class Interactor {
    
    // MARK: - Properties
    
    private(set) var someVar = String()
    private(set) var total: Int = .zero
    
    // MARK: - Methods
    
    func set(someVar: String) {
        self.someVar = someVar
    }
    
    func sum(valueOne: Int, valueTwo: Int) {
        total = valueOne + valueTwo
    }
    
    func simulateRequestWithTwoSeconds(_ closure: @escaping (String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            closure("someData")
        }
    }
}
