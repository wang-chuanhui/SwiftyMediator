import XCTest
@testable import CHSwiftyMediator

struct NameRequestor: Requestor {
    typealias Target = String
    let id: Int
}
extension NameRequestor: Provider {
    func providTarget() -> String {
        return "name provider \(id)"
    }
}

struct Name2Requestor: Requestor {
    typealias Target = String
    let id: Int
}

struct DefaultStringProvider: Provider {
    typealias Target = String
    func providTarget() -> String {
        return "default null"
    }
}

final class SwiftyMediatorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(SwiftyMediator().text, "Hello, World!")
    }
    
    func testMediator() {
        let requestor = NameRequestor(id: 1)
        do {
            let name = try Mediator.throws(requestor)
            print(name)
        } catch {
            print(error)
        }
    }
    
    func testDefaultMediator() {
        let requestor = Name2Requestor(id: 1)
        let provider = DefaultStringProvider()
        let name = Mediator.defaultProvider(requestor, provider)
        print(name)
    }
    
    func testFatalErrorMediator() {
        let requestor = NameRequestor(id: 1)
        let name = Mediator.fatal(requestor)
        print(name)
    }

    static var allTests = [
        ("testExample", testExample),
        ("testMediator", testMediator),
        ("testDefaultMediator", testDefaultMediator),
        ("testFatalErrorMediator", testFatalErrorMediator)
    ]
}
