//
//  CityViewController.swift
//  weather, table
//
//  Created by Nivardo Ibarra on 12/16/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    var zip = ""
    @IBOutlet weak var lblWeather: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urls = "https://query.yahooapis.com/v1/public/yql?format=json&q=SELECT%20*%20FROM%20weather.forecast%20WHERE%20u%20=%20%27c%27%20and%20location%20=%20%27"
        let url = NSURL(string: urls + zip + "%27")
        let data = NSData(contentsOfURL: url!)
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves)
            let dictionary1 = json as! NSDictionary
            let dictionary2 = dictionary1["query"] as! NSDictionary
            let dictionary3 = dictionary2["results"] as! NSDictionary
            let dictionary4 = dictionary3["channel"] as! NSDictionary
//            let dictionary5 = dictionary4["location"] as! NSDictionary
//            self.lblCity.text = dictionary5["city"] as! NSString as String
            let dictionary6 = dictionary4["item"] as! NSDictionary
            let dictionary7 = dictionary6["condition"] as! NSDictionary
            print(dictionary7["temp"] as! NSString as String)
            self.lblWeather.text = dictionary7["temp"] as! NSString as String
        }catch {
            print("Error")
            return
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
