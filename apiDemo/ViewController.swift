//
//  ViewController.swift
//  apiDemo
//
//  Created by West Kraemer on 8/16/17.
//  Copyright © 2017 West Kraemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityTextField: UITextField!
    
    @IBAction func submit(_ sender: Any) {
    }
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=e938df6166d02d7d30aa798c4ac23687")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                
                print (error)
                
            } else {
                
                if let urlContent = data {
                    
                    do {
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    
                    print(jsonResult)
                        print(jsonResult["name"])
                        
                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                        
                            DispatchQueue.main.sync(execute: {
                            
                                    self.resultLabel.text = description
                            
                            })
                        
                        }
                        
                    
                    } catch {
                        
                        print("JSON Processing Failed")
                    }
                    
                }
                
            }
            }
        
        task.resume()
            
        }
        
        
    }



//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}
//
