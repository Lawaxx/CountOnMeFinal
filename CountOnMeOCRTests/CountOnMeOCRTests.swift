//
//  CountOnMeOCRTests.swift
//  CountOnMeOCRTests
//
//  Created by Aurélien Waxin on 30/09/2021.
//

import XCTest
@testable import CountOnMeOCR


class Delegate: DisplayDelegate {
    
    var result: String?
    

    init(testCase: XCTestCase) {}
    
    func updateDisplay(text: String) {
        result = text
    }
    func presentAlert(text: String) {
        result = text
    }
}

class CalculatorTestCase: XCTestCase {
    
    var calculator: Calculator!
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    // MARK: Testing ErrorDisplay
    func testGivenDivideByZeroInExpression_WhenTapEqualButton_ThenDisplayShowExpressionError() {
        
        let delegate = Delegate(testCase: self)
        
        calculator.delegate = delegate
        
        calculator.insertNumber(number: "10")
        calculator.insertOperand(operand: "/")
        calculator.insertNumber(number: "0")
        calculator.insertEqual()
        
        let result = delegate.result
        
        XCTAssertEqual(result, "Expression incorrect")
    }
    
    
    
    // MARK: - Testing display
    
    func testGivenElementsIsEmpty_WhenAddingElement_ThenDisplayReturnsJoinedStringResult() {
        
        let delegate = Delegate(testCase: self)
        
        
        calculator.delegate = delegate
        
        calculator.insertNumber(number: "2")
        calculator.insertOperand(operand: "+")
        calculator.insertNumber(number: "5")
        calculator.insertEqual()
        
        let result = delegate.result
        
        XCTAssertEqual(result, "2+5=7")
    }
    
    
    // MARK: - Testing reset()
    
    func testGivenAnExpression_WhenTriggeringFunctionReset_ThenElementsIsEmpty() {
        calculator.insertNumber(number: "5")
        calculator.reset()
        XCTAssertTrue(calculator.elements.isEmpty)
    }
    
    // MARK: - Testing Priority Calcul
    
    func testGivenElementsHasACorrectExpression1_WhenPerformingCalcul_ThenElementsContainsCorrectResult() {
        
        let delegate = Delegate(testCase: self)
        
        calculator.delegate = delegate
        
        calculator.insertNumber(number: "5")
        calculator.insertOperand(operand: "+")
        calculator.insertNumber(number: "2")
        calculator.insertOperand(operand: "*")
        calculator.insertNumber(number: "2")
        calculator.insertEqual()
        
        let result = delegate.result
        
        XCTAssertEqual(result, "5+2*2=9")
    }
    func testGivenExpressionWithResult_WhenAddNumbers_ThenExpressionAddNewNumbers(){
        let delegate = Delegate(testCase: self)
        
        calculator.delegate = delegate
        
        calculator.insertNumber(number: "2")
        calculator.insertOperand(operand: "*")
        calculator.insertNumber(number: "3")
        calculator.insertOperand(operand: "/")
        calculator.insertNumber(number: "4")
        calculator.insertEqual()
       
        let result = delegate.result
        
        XCTAssertEqual(result, "2*3/4=1.5")
    }
    
    // MARK: Testing decimal result
    func testGivenElementsHasACorrectExpression3_WhenPerformingCalcul_ThenElementsContainsCorrectResult() {
        
        let delegate = Delegate(testCase: self)
        
        calculator.delegate = delegate
        
        calculator.insertNumber(number: "3")
        calculator.insertOperand(operand: "/")
        calculator.insertNumber(number: "2")
        calculator.insertEqual()

        let result = delegate.result
        
        XCTAssertEqual(result, "3/2=1.5")
        
    }
    
    // MARK:  Testing number
    func testGivenElementsIsEmpty_WhenTriggeringFuncWithParameter5_ThenElementsContains5() {
        
        let delegate = Delegate(testCase: self)
        
        calculator.delegate = delegate
        
        calculator.insertNumber(number: "5")
        
        let result = delegate.result
        
        XCTAssertEqual(result, "5")
        
    }
    // MARK: Testing Last element
    func testGivenAnExpressionWithResult_WhenTriggeringFuncWithParameter3_ThenLastElementIs3() {
        let delegate = Delegate(testCase: self)
        
        calculator.delegate = delegate
        
        calculator.insertNumber(number: "2")
        calculator.insertOperand(operand: "+")
        calculator.insertNumber(number: "3")
        calculator.insertEqual()
        calculator.insertNumber(number: "3")
        
        let result = delegate.result
        
        XCTAssertEqual(result, "3")
        
    }
    // MARK: Testing operand
    func testGivenExpressionWithJustOperand_WhenTapEqual_ThenDisplayShowAlert() {
        let delegate = Delegate(testCase: self)
        
        calculator.delegate = delegate
        
        calculator.insertOperand(operand: "-")
        calculator.insertEqual()

        let result = delegate.result
        
        XCTAssertEqual(result, "Expression incorrect")
    }
    //MARK: Testing Expression Incorrect
    func testGivenExpression_WhenLastElementIsOperand_ThenExpressionIsIncorrect(){
        let delegate = Delegate(testCase: self)
        
        calculator.delegate = delegate
        
        calculator.insertNumber(number: "2")
        calculator.insertOperand(operand: "-")
        calculator.insertEqual()

        let result = delegate.result
        
        XCTAssertEqual(result, "Expression incorrect")
    }
    //MARK: Testing result with result
    func testGivenExpressionWithResult_WhenAddAnOperand_ThenExpressionBeganByResult(){
        let delegate = Delegate(testCase: self)
        
        calculator.delegate = delegate
        
        calculator.insertNumber(number: "10")
        calculator.insertOperand(operand: "-")
        calculator.insertNumber(number: "8")
        calculator.insertEqual()
        calculator.insertOperand(operand: "+")
        calculator.insertNumber(number: "2")

        let result = delegate.result
        
        XCTAssertEqual(result, "2+2")
    }
    //MARK: Testing join numbers
    func testGivenNumberInExpression_WhenAddNumber_ThenJoigningNumbers(){
        let delegate = Delegate(testCase: self)
        
        calculator.delegate = delegate
        
        calculator.insertNumber(number: "2")
        calculator.insertNumber(number: "2")
        
        let result = delegate.result
        
        XCTAssertEqual(result, "22")
        
    }
}
