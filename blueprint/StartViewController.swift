//
//  StartViewController.swift
//  blueprint
//
//  Created by Justin Horner on 4/30/21.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func toRegisterPage(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let welcomeViewController = storyBoard.instantiateViewController(withIdentifier: "registerPage") as! RegisterViewController// remember to have the stoyboard id of the view controller not the scene to equal...
        self.present(welcomeViewController, animated:true, completion:nil)
    }
    
    @IBAction func toLoginPage(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let welcomeViewController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginViewController// remember to have the stoyboard id of the view controller not the scene to equal...
        self.present(welcomeViewController, animated:true, completion:nil)
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
