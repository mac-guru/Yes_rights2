//
//  ViewController.swift
//  Quiz Game
//
//  Created by amrit on 12/11/15.
//  Copyright © 2015 Amrit. All rights reserved.
//

import UIKit
import Social


struct Question {
    var Question: String!
    var Answers: [String]!
    var Answer: Int!
}


class QuizController: UIViewController {
    
    
    @IBOutlet var fbIcon: UIButton!
    
    @IBOutlet var QuesionLabel: UILabel!
    
    @IBOutlet var Buttons: [UIButton]!
    
    @IBOutlet var scoreLevel: UILabel!
    
    
    var Questions = [Question]()
    var QNumber = Int()
    
    var AnswerNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scoreLevel.text = "0";
        fbIcon.hidden = true
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        Questions = [Question(Question: "When is International Human Rights Day?", Answers: ["8 March","3 September","10 December","9 March"], Answer: 2),
            Question(Question: "How many rights are there in the Universal Declaration of Human Rights?", Answers: ["15","30","35","25"], Answer: 1),
            Question(Question: "Who sets out international human rights standards?", Answers: ["The International red Cross","Government of Individual Countries","United Nations","Amnesty Internationa"], Answer: 2),
            Question(Question: "Which international law opened for signature on 3 June 2013?", Answers: ["Arms Trade Treaty","Banana Trade Treaty","Candle Trade Treaty","Versales Treaty"], Answer: 0),
            Question(Question: "Which of the following is absolutely prohibited under international law?", Answers: ["Death penalty (execution)","Slavery","Selling guns","Murder"], Answer: 1),
            Question(Question: "Which situation has broken someone’s right?", Answers: ["A young girl is not allowed to have a new dress","A little boy is sent to bed early for misbehaving","A year 6 boy is not allowed to go to the swimming baths","CA country's government does not allow girls to go to school"], Answer: 3),
            Question(Question: "According to a United Nations report, on average one in four women is beaten, coerced into sex, or otherwise abused, by an intimate partner in the course of her lifetime.", Answers: ["True","False","Not Sure","Yes"], Answer: 0)
        
        
        
        
        ]
        
        pickQuestion();
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func increaseScore(){
        
        var score = Int();
        
        score = Int(scoreLevel.text!)!;
        
        score = score+1;
        
        scoreLevel.text = String(score);
        
    }
    
    
    func userDidUpdate()
    {
        let title = "Congratulations"
        let message = "Your Score \("") Share on Facebook"
        fbIcon.hidden = false
        
        UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "OK").show()
    }
    
    func wrongAns(title:String, subTitle:String)
    {

        
        let alertViewController = SCLAlertView().showError("Ooops!", subTitle: subTitle)
        
        alertViewController.setTitle(title)
        pickQuestion()
    }
    
    
    
    func pickQuestion(){
        if Questions.count > 0{
            QNumber = random() % Questions.count
            QuesionLabel.text = Questions[QNumber].Question
            
            AnswerNumber = Questions[QNumber].Answer
            
            for i in 0..<Buttons.count {
                Buttons[i].setTitle(Questions[QNumber].Answers[i], forState: UIControlState.Normal)
            }
            Questions.removeAtIndex(QNumber)
        }
        else
        {
            NSLog("Question Finished");
            userDidUpdate();
            
        }
        
    }
    
    
    
    
    @IBAction func button1(sender: AnyObject) {
        
        if AnswerNumber == 0 {
            pickQuestion()
            
            increaseScore();
            
        }
        else{
            
            wrongAns("Wrong Ans!", subTitle: "Hey Try again")
        }
        
    }
    
    @IBAction func button2(sender: AnyObject) {
        
        if AnswerNumber == 1 {
            pickQuestion()
            increaseScore();
        }
        else{
            wrongAns("Wrong Ans!", subTitle: "Hey Try again")
        }
    }
    
    @IBAction func button3(sender: AnyObject) {
        
        if AnswerNumber == 2 {
            pickQuestion()
            increaseScore();
        }
        else{
            wrongAns("Wrong Ans!", subTitle: "Hey Try again")
        }
        
        
    }
    
    @IBAction func button4(sender: AnyObject) {
        
        if AnswerNumber == 3 {
            pickQuestion()
            increaseScore();
        }
        else{
            wrongAns("Wrong Ans!", subTitle: "Hey Try again")
        }
    }
    
    @IBAction func fbShare(sender: AnyObject) {
        let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        vc.setInitialText("OMG i scored \(scoreLevel.text) point in the #Yes rights  on iOS")
        
        
        presentViewController(vc, animated: true, completion: nil)
        
        vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        
        print("hi")
    }
    
    
    
    
}

