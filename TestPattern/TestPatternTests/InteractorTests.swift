@testable import TestPattern
import XCTest

class InteractorTests: TestPatternTests {
    
    // MARK: - Properties
    
    var interactor: Interactor?
    var simulateRequestCount: Int = .zero
    
    // MARK: - Tests
    
    func testInteractor_whenInstantiate_shouldBeInInitialValues() {
        given("Instanciate Interactor") {
            interactor = Interactor()
        }
        
        then("check if is in initial values") {
            XCTAssertEqual(interactor?.someVar, "")
            XCTAssertEqual(interactor?.total, .zero)
        }
    }
    
    func testInteractor_whenSetSomeVar_valueShouldBeCorrect() {
        given("Instanciate Interactor") {
            interactor = Interactor()
        }
        
        when("set someVar value") {
            interactor?.set(someVar: "someValue")
        }
        
        then("check if value is someValue") {
            XCTAssertEqual(interactor?.someVar, "someValue")
        }
    }
    
    func testInteractor_whenSumValues_valueShouldBeCorrect() {
        given("Instanciate Interactor") {
            interactor = Interactor()
        }
        
        when("sum ten and seven") {
            interactor?.sum(valueOne: 10, valueTwo: 7)
        }
        
        then("check if sum is seventen") {
            XCTAssertEqual(interactor?.total, 17)
        }
    }
    
    func testInteractor_whenSimulateRequestTypeOne_valueShouldBeCorrect() {
        given("Instanciate Interactor") {
            interactor = Interactor()
        }
        
        when("Simulate some request") {
            interactor?.simulateRequestWithTwoSeconds(simulateRequestFunction)
        }
        
        then("check if count is correct") {
            wait(for: 2.0, withDescription: "wait request end") {
                XCTAssertEqual(self.simulateRequestCount, 1)
            }
        }
    }
    
    func testInteractor_whenSimulateRequestTypeTwo_valueShouldBeCorrect() {
        given("Instanciate Interactor") {
            interactor = Interactor()
        }
        
        when("Simulate some request") {
            interactor?.simulateRequestWithTwoSeconds { data in
                self.simulateRequestCount = data == "someData" ? 1 : .zero
            }
        }
        
        then("check if count is correct") {
            wait(for: 2.0, withDescription: "wait request end") {
                XCTAssertEqual(self.simulateRequestCount, 1)
            }
        }
    }
    
    func testInteractor_whenSimulateRequestTypeThree_valueShouldBeCorrect() {
        given("Instanciate Interactor") {
            interactor = Interactor()
        }
        
        when("Simulate some request") {
            interactor?.simulateRequestWithTwoSeconds { data in
                self.then("check if count is correct") {
                    XCTAssertEqual(data, "someData")
                }
            }
        }
        
        wait(for: 2.1, withDescription: "wait request end")
    }
    
    // MARK: - Private methods
    
    private func simulateRequestFunction(_ dataReturned: String) {
        simulateRequestCount = dataReturned == "someData" ? 1 : .zero
    }
}
