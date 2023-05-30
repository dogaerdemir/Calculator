//
//  ViewController.swift
//  Calculator
//
//  Created by Doğa Erdemir on 16.01.2023.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var calcWorkings: UILabel!
    @IBOutlet weak var calcResults: UILabel!
    var isFirstBracket = true
    var isFirstCalculations = false
    var workings = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func addToWorkings(value:String)
    {
        workings = workings + value
        calcWorkings.text = workings
    }
    
    func formatResult(result:Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    func validInput() -> Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == workings.count - 1)
            {
                return false
            }
            
            if(previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            
            previous = index
        }
        return true
    }
    
    func specialCharacter(char : Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        
        if(char == "/")
        {
            return true
        }
        
        if(char == "+")
        {
            return true
        }
        
        if(char == "-")
        {
            return true
        }
        
        return false
    }
    
    func calculate()
    {
        if(validInput())
        {
            if(isFirstCalculations){
                calcWorkings.text = ""
                calcResults.text = ""
            }
            let checkedPercentageOperator = workings.replacingOccurrences(of: "%", with: "*0.01*")
            let expression = NSExpression(format: checkedPercentageOperator)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calcResults.text = resultString
            isFirstCalculations = false
        }
    }
    
    @IBAction func clearClicked(_ sender: Any)
    {
        workings = ""
        calcWorkings.text = ""
        calcResults.text = ""
    }
    
    @IBAction func paranthesisClicked(_ sender: Any)
    {
        if(isFirstBracket)
        {
            addToWorkings(value: "(")
            isFirstBracket = false
        }
        else
        {
            addToWorkings(value: ")")
            isFirstBracket = true
        }
    }
    
    @IBAction func percentageClicked(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func divideClicked(_ sender: Any)
    {
        addToWorkings(value: "/")
    }
    
    @IBAction func multiplyClicked(_ sender: Any)
    {
        addToWorkings(value: "*")
    }
    
    @IBAction func minusClicked(_ sender: Any)
    {
        addToWorkings(value: "-")
    }
    
    @IBAction func addClicked(_ sender: Any)
    {
        addToWorkings(value: "+")
    }
    
    @IBAction func equalClicked(_ sender: Any)
    {
        if validInput()
        {
            calculate()
            isFirstBracket = true
            workings = ""
            //calcWorkings.text = ""
        }
    }
    
    @IBAction func deleteClicked(_ sender: Any)
    {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calcWorkings.text = workings
        }
    }
    
    @IBAction func dotClicked(_ sender: Any)
    {
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroClicked(_ sender: Any)
    {
        addToWorkings(value: "0")
        //calculate()
    }
    
    @IBAction func oneClicked(_ sender: Any)
    {
        addToWorkings(value: "1")
        //calculate()
    }
    
    @IBAction func twoClicked(_ sender: Any)
    {
        addToWorkings(value: "2")
        //calculate()
    }
    
    @IBAction func threeClicked(_ sender: Any)
    {
        addToWorkings(value: "3")
        //calculate()
    }
    
    @IBAction func fourClicked(_ sender: Any)
    {
        addToWorkings(value: "4")
        //calculate()
    }
    
    @IBAction func fiveClicked(_ sender: Any)
    {
        addToWorkings(value: "5")
        //calculate()
    }
    
    @IBAction func sixClicked(_ sender: Any)
    {
        addToWorkings(value: "6")
        //calculate()
    }
    
    @IBAction func sevenClicked(_ sender: Any)
    {
        addToWorkings(value: "7")
        //calculate()
    }
    
    @IBAction func eightClicked(_ sender: Any)
    {
        addToWorkings(value: "8")
        //calculate()
    }
    
    @IBAction func nineClicked(_ sender: Any)
    {
        addToWorkings(value: "9")
        //calculate()
    }
}
