//
//  ServiceViewController.swift
//  blueprint
//
//  Created by Justin Horner on 4/26/21.
//

import UIKit

class ServiceViewController: UIViewController, choiceProtocol {
    func serviceChosen(string: String) {
        print("protocol implemented")
    }
    
    var choice : String = ""
    @IBAction func room(_ sender: Any) {
        choice = "Room"
        perform(#selector(advance))
    }
    @IBAction func gym(_ sender: Any) {
        choice = "Gym"
        perform(#selector(advance))
    }
    @IBAction func food(_ sender: Any) {
        choice = "Food"
        perform(#selector(advance))
    }
    @IBAction func beach(_ sender: Any) {
        choice = "Beach"
        perform(#selector(advance))
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @objc func advance(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "review") as! ReviewViewController// remember to have the stoyboard id of the view controller not the scene to equal...
        vc.delegate = self
        vc.choice = choice
        self.present(vc,animated: true,completion: nil)
    }
    
    func review() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let reviewViewController = storyBoard.instantiateViewController(withIdentifier: "review") as! ReviewViewController// remember to have the stoyboard id of the view controller not the scene to equal...
        self.present(reviewViewController, animated:true, completion:nil)

        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
