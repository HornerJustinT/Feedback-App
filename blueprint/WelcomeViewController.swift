//
//  welcomeViewController.swift
//  blueprint
//
//  Created by Justin Horner on 4/26/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBAction func services(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let serviceViewController = storyBoard.instantiateViewController(withIdentifier: "services") as! ServiceViewController// remember to have the stoyboard id of the view controller not the scene to equal...
        self.present(serviceViewController, animated:true, completion:nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
