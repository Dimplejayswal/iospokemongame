//
//  ResultViewController.swift
//  labtest1pokemon
//
//  Created by Dhwani  on 2020-05-25.
//  Copyright © 2020 Dimple. All rights reserved.
//

import UIKit
import CoreData


class ResultViewController: UIViewController {

    @IBOutlet weak var resulttxt: UITextView!
    
    var battle : [Battle] = [Battle]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let now = Date()
        
        
        let db = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request : NSFetchRequest<Battle> = Battle.fetchRequest()
        do{
            
            let results = try db.fetch(request)
            
            print ("Total count: \(results.count)")
            if results.count == 0{
                print("No results found")
            }
            else{
                battle=results
                for battle in results{
                    print(battle.winner)
                }
            }
        }
        catch{
            print ("Can't fetch")
        }
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd  hh:mm:SS a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
       
       
//
       
//        print(datetime)
        var getFinalValue = ""
        for battleValue in battle {
            let datetime = formatter.string(from: battleValue.date! as Date)
            if let name = battleValue.winner?.pokemonName {
                getFinalValue  = getFinalValue + "\(datetime)" + " " + name  + " " + "Wins" + "\n"
            }
        }
        resulttxt.text = getFinalValue
        // Do any additional setup after loading the view.
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
