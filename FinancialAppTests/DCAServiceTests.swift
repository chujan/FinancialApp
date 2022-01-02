//
//  FinancialAppTests.swift
//  FinancialAppTests
//
//  Created by Chukwuemeka Jennifer on 30/12/2021.
//

import XCTest
@testable import FinancialApp

class DCAServiceTests: XCTestCase {
    
    var systemUnderTest: DCAService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        systemUnderTest = DCAService()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        systemUnderTest = nil
    }
    
    func testResult_givenWinningAssetAndDCAIsUsed_expectPositiveGains() {
        //given
        let initialInvestmentAmount: Double = 5000
        let monthlyDollarCostAveragingAmount : Double = 1500
        let initialDateOfInvestmentIndex: Int = 5
        let asset = buildWinningAsset()
        //when
        let result = systemUnderTest.calculate(asset: asset, initialInvestmentAmount: initialInvestmentAmount, monthlyDollarCostAveragingAmount: monthlyDollarCostAveragingAmount, initialDateOfInvestmentIndex: initialDateOfInvestmentIndex)
        XCTAssertEqual(result.investmentAmount, 12500)
        XCTAssertTrue(result.isProfitable)
        XCTAssertEqual(result.currentValue, 29342.257, accuracy: 0.1)
        XCTAssertEqual(result.gain, 16842.257, accuracy: 0.1)
        XCTAssertEqual(result.yield, 1.3473, accuracy: 0.0001)
        //then
        
    }
    func testResult_givenWinningAssetAndDCAIsNotUsed_expectPositiveGains() {
        let initialInvestmentAmount: Double = 5000
        let monthlyDollarCostAveragingAmount : Double = 0
        let initialDateOfInvestmentIndex: Int = 3
        let asset = buildWinningAsset()
        //when
        let result = systemUnderTest.calculate(asset: asset, initialInvestmentAmount: initialInvestmentAmount, monthlyDollarCostAveragingAmount: monthlyDollarCostAveragingAmount, initialDateOfInvestmentIndex: initialDateOfInvestmentIndex)
        XCTAssertEqual(result.investmentAmount, 5000)
        XCTAssertTrue(result.isProfitable)
        XCTAssertEqual(result.currentValue, 6666.667, accuracy: 0.1)
        XCTAssertEqual(result.gain, 1666.667, accuracy: 0.1)
        XCTAssertEqual(result.yield, 0.3333, accuracy: 0.0001)
        //then
        
    }
    func testResult_givenWinningAssetAndDCAIsUsed_expectNegativeGains() {
        let initialInvestmentAmount: Double = 5000
        let monthlyDollarCostAveragingAmount : Double = 500
        let initialDateOfInvestmentIndex: Int = 5
        let asset = buildLossingAsset()
        //when
        let result = systemUnderTest.calculate(asset: asset, initialInvestmentAmount: initialInvestmentAmount, monthlyDollarCostAveragingAmount: monthlyDollarCostAveragingAmount, initialDateOfInvestmentIndex: initialDateOfInvestmentIndex)
        XCTAssertEqual(result.investmentAmount, 7500)
        XCTAssertFalse(result.isProfitable)
        XCTAssertEqual(result.currentValue, 6837.625, accuracy: 0.1)
        XCTAssertEqual(result.gain, -662.375, accuracy: 0.1)
        XCTAssertEqual(result.yield, -0.0883, accuracy: 0.0001)
        
        
    }
    func testResult_givenWinningAssetAndDCAIsNotUsed_expectNegativeGains() {
        let initialInvestmentAmount: Double = 5000
        let monthlyDollarCostAveragingAmount : Double = 0
        let initialDateOfInvestmentIndex: Int = 3
        let asset = buildLossingAsset()
        //when
        let result = systemUnderTest.calculate(asset: asset, initialInvestmentAmount: initialInvestmentAmount, monthlyDollarCostAveragingAmount: monthlyDollarCostAveragingAmount, initialDateOfInvestmentIndex: initialDateOfInvestmentIndex)
        XCTAssertEqual(result.investmentAmount, 5000)
        XCTAssertFalse(result.isProfitable)
        XCTAssertEqual(result.currentValue, 3666.667, accuracy: 0.1)
        XCTAssertEqual(result.gain, -1333.333, accuracy: 0.1)
        XCTAssertEqual(result.yield,-0.2666, accuracy: 0.0001)
        //then
        
    }
    
    private func buildWinningAsset() -> Asset {
        let searchResult = buildSearchResult()
        let meta  = buildMeta()
        let timeSeries: [String : OHLC] = ["2021-07-21": OHLC(open: "100", close: "110", adjustedClose: "110"),
                                           "2021-08-21": OHLC(open: "110", close: "120", adjustedClose: "120"),
                                           "2021-09-21": OHLC(open: "120", close: "130", adjustedClose: "130"),
                                           "2021-10-21": OHLC(open: "130", close: "140", adjustedClose: "140"),
                                           "2021-11-21": OHLC(open: "140", close: "150", adjustedClose: "150"),
                                           "2021-12-21": OHLC(open: "150", close: "160", adjustedClose: "160")]
        let timeSeriesMonthlyAdjusted = TimeSeriesMonthlyAdjusted(meta: meta, timeSeries: timeSeries)
        
        return Asset(searchResult: searchResult, timeSeriesMonthlyAdjusted: timeSeriesMonthlyAdjusted)
    }
    private func buildLossingAsset() -> Asset {
        let searchResult = buildSearchResult()
        let meta = buildMeta()
        let timeSeries: [String : OHLC] = ["2021-07-21": OHLC(open: "170", close: "160", adjustedClose: "160"),
                                           "2021-08-21": OHLC(open: "160", close: "150", adjustedClose: "150"),
                                           "2021-09-21": OHLC(open: "150", close: "140", adjustedClose: "140"),
                                           "2021-10-21": OHLC(open: "140", close: "130", adjustedClose: "130"),
                                           "2021-11-21": OHLC(open: "130", close: "120", adjustedClose: "120"),
                                           "2021-12-21": OHLC(open: "120", close: "110", adjustedClose: "110")]
        let timeSeriesMonthlyAdjusted = TimeSeriesMonthlyAdjusted(meta: meta, timeSeries: timeSeries)
        return Asset(searchResult: searchResult, timeSeriesMonthlyAdjusted: timeSeriesMonthlyAdjusted)
    }
    
    
    private func buildSearchResult() -> SearchResult {
        return SearchResult(symbol: "XYZ", name: "XYZ", currency: "USD", type: "ETF")
    }
    private func buildMeta() -> Meta {
        return Meta(symbol: "XYZ")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
   

    
    }


