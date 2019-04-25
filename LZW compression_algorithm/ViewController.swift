//
//  ViewController.swift
//  LZW compression_algorithm
//
//  Created by SAM on 12/16/18.
//  Copyright © 2018 SAM. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController  , UITextFieldDelegate{

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var outputView: UITextView!
    
    var AllChar = [String : Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func Enter(_ sender: Any) {
      myMain()
        AllChar = [String : Int]()                   // to make it to default that has assci .... if not every enter the ALLCHAR will be increased
    }
    func myMain( ){
        let input = inputTextField.text
      //  var input2 = input?.characters.map{String($0)} //convert my input text to each char
       var compressed = [Int]()
        for i in 0 ..< 256 {
            let cc = Character(UnicodeScalar(i)!)
            let s = String(cc)
            AllChar[s] = i
        }
        var dictSize = 256
        var  p = String()
        for c in input! {
            let pc  = p+String(c)                                        //cannot add char to string
            if AllChar[pc] != nil{                                      // a char look like a or b or c....
                p = pc                                               //p = w
                }
                
            else                                            // a new string that i create ww wcc
            
            {
                compressed.append(AllChar[p]!)
                AllChar[pc] = dictSize
                dictSize = dictSize + 1
                p = String(c)
                }
    }
        compressed.append(AllChar[p]!)
        let ans = String(describing: compressed)            // convert int tto string .. to output to view text
        outputView.text = ans
        print(compressed)                                   //ckeck in print
        }
    
    
    
    
        /*var p = input?.characters.map{String($0)}     //convert my input text to each char
        let coont = p?.count
        
       for i in 0..<(coont! ?? 0){
        
      //  var asci = UnicodeScalar(p![i])
        print(i)
        if i == coont!-1{
        let pc = p![i] + p! [i+1]
        if  stringTable.contains(pc)
        {
            print (pc)
        }
        else {
            print(p?[i])
            stringTable.append(pc)
            
            }
        
        }
    }*/
}

