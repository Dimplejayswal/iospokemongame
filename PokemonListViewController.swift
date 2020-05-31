//
//  PokemonListViewController.swift
//  labtest1pokemon
//
//  Created by Dhwani  on 2020-05-25.
//  Copyright © 2020 Dimple. All rights reserved.
//

import UIKit
import CoreData

class PokemonListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
   
    var pokemon : [Pokemon] = [Pokemon]()
    
    @IBOutlet weak var pokemontableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemontableview.delegate=self
        pokemontableview.dataSource=self
         let db = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let sortingName = NSSortDescriptor(key: "pokemonName",ascending: true)
        let request : NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        request.sortDescriptors = [sortingName]
        
        
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
        //let request = NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        // Do any additional setup after loading the view.
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemon.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell")as? PokemonTableViewCell
        
        print ("In table")
        
        
        
        cell?.pokename.text = pokemon[indexPath.row].pokemonName
        cell?.pokeimage.image = UIImage(named: pokemon[indexPath.row].pokemonimage!)
        cell?.poketype.text = pokemon[indexPath.row].pokemonType
        cell?.pokepoints.text=String(pokemon[indexPath.row].pokemonPoints)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "fightcell", sender: pokemon[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FightViewController {
            let anotherController = segue.destination as? FightViewController
            anotherController?.playerSelected = sender as? Pokemon
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
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
