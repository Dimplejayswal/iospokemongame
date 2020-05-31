//
//  FightViewController.swift
//  labtest1pokemon
//
//  Created by Dhwani  on 2020-05-25.
//  Copyright © 2020 Dimple. All rights reserved.
//

import UIKit
import CoreData

class FightViewController: UIViewController {

    @IBOutlet weak var playername: UILabel!
    @IBOutlet weak var Computername: UILabel!
    @IBOutlet weak var playerimage: UIImageView!
    @IBOutlet weak var computerimage: UIImageView!
    @IBOutlet weak var playerpoints: UILabel!
    @IBOutlet weak var computerpoints: UILabel!
    @IBOutlet weak var battlewinstxt: UILabel!
    
    var playerSelected : Pokemon?
    var pokemon : [Pokemon] = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Do any additional setup after loading the view.
        playername.text = playerSelected?.pokemonName
        playerimage.image = UIImage(named: (playerSelected?.pokemonimage!)!)
        playerpoints.text = String(describing: playerSelected?.pokemonPoints ?? 0)
        
        let db = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request : NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        request.predicate = NSPredicate(format:"pokemonName != %@",(playerSelected?.pokemonName)!)
        do{
            
            let results = try db.fetch(request)
            
            print ("Total count: \(results.count)")
            if results.count == 0{
                print("No results found")
            }
            else{
                pokemon=results
                for pokemon in results{
                    print(pokemon.pokemonName!)
                }
            }
        }
        catch{
            print ("Can't fetch")
        }
        generaterandom()
    }
    
    func generaterandom(){
        var battleWin : Pokemon?
        var computerWinning : Pokemon?
        let randomnumber = Int(arc4random_uniform(UInt32(pokemon.count)) + 0)
        computerWinning = pokemon[randomnumber]
        Computername.text = pokemon[randomnumber].pokemonName
        computerimage.image = UIImage(named: pokemon[randomnumber].pokemonimage!)
        let computerPointsget = pokemon[randomnumber].pokemonPoints
        computerpoints.text = String(pokemon[randomnumber].pokemonPoints)
        
        if (playerSelected?.pokemonPoints)! >= computerPointsget{
            battlewinstxt.text = "Player win"
             battleWin = playerSelected
        }
        else{
            battlewinstxt.text = "Computer win"
            battleWin = computerWinning
        }
        
        let myvalue = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let battle = Battle(context: myvalue)
        battle.date =  Date() as NSDate
        battle.winner = battleWin
        
        do{
            try myvalue.save()
        }
        catch{
            print("Cannot save to table")
        }
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
