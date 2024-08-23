///
/// @Generated by Mockolo
///

@testable import AnytimeWeather
import Foundation

final class KeywordProviderMock: KeywordProvider {
    init() {}

    static var historyCallCount = 0
    static var historyHandler: (() -> ([Keyword]))?
    static func history() -> [Keyword] {
        historyCallCount += 1
        if let historyHandler = historyHandler {
            return historyHandler()
        }
        return [Keyword]()
    }

    static var predictCallCount = 0
    static var predictHandler: (() -> ([Keyword]))?
    static func predict() -> [Keyword] {
        predictCallCount += 1
        if let predictHandler = predictHandler {
            return predictHandler()
        }
        return [Keyword]()
    }
}