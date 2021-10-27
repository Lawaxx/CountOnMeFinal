//
//  ViewController.swift
//  CountOnMeOCR
//
//  Created by Aurélien Waxin on 30/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    private let calculator = Calculator()
    
    // MARK: - IBOutlets
    @IBOutlet weak var textView: UILabel!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        calculator.delegate = self
        textView.text = "0"
    }
    // MARK: - IBActions
    @IBAction func resetButton(_ sender: UIButton) {
        calculator.reset()
    }
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberButton = sender.title(for: .normal) else {
            return
        }
        calculator.insertNumber(number: numberButton)
    }
    @IBAction func tappedOperandButton(_ sender: UIButton) {
        guard let operandButton = sender.title(for: .normal) else {
            return
        }
        calculator.insertOperand(operand: operandButton)
    }
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculator.insertEqual()
    }
}
// MARK: - Extension

extension ViewController: DisplayDelegate {
    func updateDisplay(text: String) {
        textView.text = text
    }
    func presentAlert(text: String) {
        let alertVC = UIAlertController(title: "Oops..", message:
            "Expression incorrect !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)
    }
}



