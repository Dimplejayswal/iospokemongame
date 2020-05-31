//
//  AddViewController.swift
//  labtest1pokemon
//
//  Created by Dhwani  on 2020-05-25.
//  Copyright © 2020 Dimple. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var imagetxt: UITextField!
    @IBOutlet weak var reroll: UIButton!
    @IBOutlet weak var typetxt: UITextField!
    @IBOutlet weak var basepointstxt: UITextField!
    var pickerData =  ["normal","fire","water","grass","electric"]
    let pickerView = UIPickerView()
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       typetxt.text = pickerData[row]
    }

    
    
    @IBAction func rerollbtn(_ sender: UIButton) {
        
                getrandom()
       
    }
    
    @IBAction func savebtn(_ sender: UIButton) {
        
        
        if (nametxt.text?.isEmpty)! || (imagetxt.text?.isEmpty)! || (basepointstxt.text?.isEmpty)!{
            let alert = UIAlertController(title: "My Alert", message: "No field should be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let db = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let poke = Pokemon(context: db)
            poke.pokemonName = nametxt.text
            poke.pokemonimage = imagetxt.text
            poke.pokemonType = typetxt.text
            if let str = basepointstxt.text,
                let zip = Int(str) {
                poke.pokemonPoints = Int16(zip)
            }
            
            do{
                try db.save()
                let alert = UIAlertController(title: "", message: "Your data has been saved", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
            catch{
                print("Cannot save to table")
            }
        }
        
    }
    
    func getrandom() {
        let randomnumber = Int(arc4random_uniform(201) + 50)
        basepointstxt.text = String(randomnumber)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getrandom()
    
       

        // Do any additional setup after loading the view.
        
        pickerView.delegate = self
        typetxt.inputView = pickerView
        
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
