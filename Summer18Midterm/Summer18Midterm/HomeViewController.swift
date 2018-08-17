//
//  HomeViewController.swift
//  Summer18Midterm
//
//  Created by Jigisha Patel on 2018-08-11.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var lblNumber1: UILabel!
    @IBOutlet var imgResult: UIImageView!
    @IBOutlet var txtAnswer: UITextField!
    @IBOutlet var lblOperator: UILabel!
    @IBOutlet var lblNumber2: UILabel!
    var correctAnswer : Int!
    var resultHistory = [(String, String)]()
    var puzzle : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newPuzzle()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCheck(_ sender: UIButton) {
        let givenAnswer = Int(txtAnswer.text!)
        var resultMessage : String
        
        self.puzzle.append("= \(givenAnswer!)")
        
        if givenAnswer == correctAnswer{
            self.resultHistory.append((puzzle, "Correct"))
            resultMessage = "Hoorayy... Correct answer"
            imgResult.image = UIImage(named: "Correct")
        }else{
            self.resultHistory.append((puzzle, "Wrong"))
            resultMessage = "Oops..Wrong answer..\n Correct answer is \(String(describing: self.correctAnswer))"
            imgResult.image = UIImage(named: "Wrong")
        }
        imgResult.isHidden = false
        
        let resultAlert = UIAlertController(title: "Result", message: resultMessage, preferredStyle: .alert)
        resultAlert.addAction(UIAlertAction(title: "Play Again !", style: .default, handler: {_ in self.newPuzzle()}))
        resultAlert.addAction(UIAlertAction(title: "Show Progress", style: .default, handler: {_ in self.showProgress()}))
        
        self.present(resultAlert, animated: true, completion: nil)
    }
    
    func newPuzzle(){
        imgResult.isHidden = true
        txtAnswer.text = ""
        txtAnswer.placeholder = "?"
        let number1 = Int(arc4random_uniform(10) + 1)
        let number2 = Int(arc4random_uniform(10) + 1)
        lblNumber1.text = "\(number1)"
        lblNumber2.text = "\(number2)"
        
        let oper = Int(arc4random_uniform(4) + 1)
        switch oper {
        case 1:
            lblOperator.text = "+"
            self.correctAnswer = number1 + number2
        case 2:
            lblOperator.text = "-"
            self.correctAnswer = number1 - number2
        case 3:
            if number2 > number1 {
                self.newPuzzle()
            }
            lblOperator.text = "/"
            self.correctAnswer = number1 / number2
        case 4:
            lblOperator.text = "*"
            self.correctAnswer = number1 * number2
        default:
            lblOperator.text = "+"
            self.correctAnswer = number1 + number2
        }
        self.puzzle = "\(number1) \(lblOperator.text!) \(number2) "
    }
    
    func showProgress(){
        print("result : \(resultHistory)")
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let progressVC = mainSB.instantiateViewController(withIdentifier: "ProgressScene") as! TableViewController
        progressVC.results = resultHistory
        navigationController?.pushViewController(progressVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
