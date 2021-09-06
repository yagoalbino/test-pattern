import XCTest

typealias DefaultClosure = () -> Void

class TestPatternTests: XCTestCase {
    
    // MARK: - Test methods
    
    public func given(_ description: String = String(), _ given: DefaultClosure) {
        XCTContext.runActivity(named: description) { _ in
            given()
        }
    }
    
    public func when(_ description: String = String(), _ when: DefaultClosure) {
        XCTContext.runActivity(named: description) { _ in
            when()
        }
    }
    
    public func then(_ description: String = String(), _ then: DefaultClosure) {
        XCTContext.runActivity(named: description) { _ in
            then()
        }
    }
    
    // MARK: - Wait methods
    
    public func wait(for duration: TimeInterval, withDescription description: String, then: DefaultClosure? = nil) {
        let waitExpectation = expectation(description: description)
        let dispatchTime: DispatchTime = .now() + duration
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            waitExpectation.fulfill()
            then?()
        }
        
        wait(for: [waitExpectation], timeout: duration)
    }
}
