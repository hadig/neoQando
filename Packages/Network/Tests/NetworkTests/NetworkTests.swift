import XCTest
@testable import Network

final class NetworkTests: XCTestCase {
    func testAPIService() async throws {
        let mockResponse = Bundle.module.url(forResource: "MockResponse", withExtension: "json")

        let mockString = try XCTUnwrap(mockResponse?.absoluteString)

        print(mockString)
        
        let data: RealTime = try await APIService.getJSON(urlString: mockString)

        print(data)
    }
}
