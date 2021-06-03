//
//  ReviewViewController.swift
//  blueprint
//
//  Created by Justin Horner on 4/26/21.
//

import UIKit

class ReviewViewController: UIViewController {
    var delegate : choiceProtocol?
    var choice : String = "error"
    var choiceRating : String = "error"
    var userData : [User] = []
    var currentUser : [CurrentUser] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    @IBOutlet weak var serviceChosen: UILabel!
    var ratings = 0;
    var qNum = 0;
    @IBAction func star1Action(_ sender: Any) {
        setStars(rating:0)

    }
    @IBAction func star2Action(_ sender: Any) {
        setStars(rating:1)

        
    }
    @IBAction func star3Action(_ sender: Any) {
        setStars(rating:2)

    }
    @IBAction func star4Action(_ sender: Any) {
        setStars(rating:3)

    }
    @IBAction func star5Action(_ sender: Any) {
        setStars(rating:4)

    }
    @IBAction func postRatings(_ sender: Any) {// post rating depending on qNum and Choice
        switch choice {
        case "Food":
            switch qNum {
            case 0:
                userData[0].foodRating = Int64(ratings)
                question.text = ("How was the freshness of the food?")
            case 1:
                userData[0].foodQ1 = Int64(ratings)
                question.text = ("How do you feel about the diversity of options available?")

            case 2:
                userData[0].foodQ2 = Int64(ratings)
                question.text = ("How do you feel about the freshness of the ingredients")


            case 3:
                userData[0].foodQ3 = Int64(ratings)
                question.text = ("Did we cater enough to the specific food needs you had?")


            case 4:
                userData[0].foodQ4 = Int64(ratings)
                question.text = ("Were the prices reasonable for the food?")


            case 5:
                print("Q5")
                userData[0].foodQ5 = Int64(ratings)
                question.text = ("Thank you for responding to our food survey! Please press Post to continue!")

            case 6:
                do{
                    try self.context.save()
                }
                catch{
                    print("error")
                }
                print("going to next")
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard?.instantiateViewController(withIdentifier: "generalReview")as! GeneralReviewViewController
                    self.present(vc, animated: true, completion: nil)
                print(try! context.fetch(User.fetchRequest()))

            default:
                print("error")
            }

            
        case "Gym":
            switch qNum {
            case 0:
                userData[0].gymRating = Int64(ratings)
                question.text = ("How were the conditions of the machinese?")
            case 1:
                userData[0].gymQ1 = Int64(ratings)
                question.text = ("How was the cleanliness of the gym?")

            case 2:
                userData[0].gymQ2 = Int64(ratings)
                question.text = ("Did you have to wait often to choose the machine you wanted?")


            case 3:
                userData[0].gymQ3 = Int64(ratings)
                question.text = ("How was the music at the gym?")


            case 4:
                userData[0].gymQ4 = Int64(ratings)
                question.text = ("Did we have the right machine you were looking for?")


            case 5:
                print("Q5")
                userData[0].gymQ5 = Int64(ratings)
                question.text = ("Thank you for responding to our gym survey! Please press Post to continue!")

            case 6:
                do{
                    try self.context.save()
                }
                catch{
                    print("error")
                }
                print("going to next")
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard?.instantiateViewController(withIdentifier: "generalReview")as! GeneralReviewViewController
                    self.present(vc, animated: true, completion: nil)
                print(try! context.fetch(User.fetchRequest()))

            default:
                print("error")
            }


            
        case "Room":
            switch qNum {
            case 0:
                userData[0].roomRating = Int64(ratings)
                question.text = ("How was the cleanliness of your room?")
            case 1:
                userData[0].roomQ1 = Int64(ratings)
                question.text = ("How was the price of your room")
            case 2:
                userData[0].roomQ2 = Int64(ratings)
                question.text = ("Was your room quiet enough?")
            case 3:
                userData[0].roomQ3 = Int64(ratings)
                question.text = ("How did you feel about the price of your room?")
            case 4:
                userData[0].roomQ4 = Int64(ratings)
                question.text = ("How did you feel about the room service in your room?")
                
            case 5:
                print("Q5")
                userData[0].roomQ5 = Int64(ratings)
                question.text = ("Thank you for responding to our room survey! Please press Post to continue.")
            case 6:
                do{
                    try self.context.save()
                }
                catch{
                    print("error")
                }
                print("going to next")
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard?.instantiateViewController(withIdentifier: "generalReview")as! GeneralReviewViewController
                    self.present(vc, animated: true, completion: nil)
                    print(try! context.fetch(User.fetchRequest()))
            default:
                print("error")
            }
        case "Beach":
            switch qNum {
            case 0:
                userData[0].beachRating = Int64(ratings)
                question.text = ("How crowded was the beach?")
            case 1:
                userData[0].beachQ1 = Int64(ratings)
                question.text = ("How was the water at the beach?")

            case 2:
                userData[0].beachQ2 = Int64(ratings)
                question.text = ("How were the anemities at the beach?")


            case 3:
                userData[0].beachQ3 = Int64(ratings)
                question.text = ("How was the weather at the beach?")


            case 4:
                userData[0].beachQ4 = Int64(ratings)
                question.text = ("How was the noice at the beach?")


            case 5:
                print("Q5")
                userData[0].beachQ5 = Int64(ratings)
                question.text = ("Thank you for responding to our beach survey! Please press Post to continue..")

            case 6:
                do{
                    try self.context.save()
                }
                catch{
                    print("error")
                }
                print("going to next")
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard?.instantiateViewController(withIdentifier: "generalReview")as! GeneralReviewViewController
                    self.present(vc, animated: true, completion: nil)
                print(try! context.fetch(User.fetchRequest()))

            default:
                print("error")
            }


        default:
            print("error")
        }// choses rating depending on choice choosen previous view

        print(userData[0])
        qNum += 1
        clearStars()
//TODO Make it so that when the button is pressed the next question is asked
        //TODO post to core data
    }
    var starArray : [UIButton]{
    return [star1, star2, star3, star4, star5]}// this is a computed property
    
    func setStars(rating:Int){
        for i in 0...rating{
            starArray[i].setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
        }
        for i in (rating + 1)..<5{
            starArray[i].setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
        }
        ratings = rating + 1;
    }
    func clearStars(){
        for i in 0..<5 {
            starArray[i].setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
        }
    }
    override func viewDidLoad() {
        do{
            userData = try context.fetch(User.fetchRequest()) // fetches users
            }
            catch{
                print("error")
            }
        do{
            currentUser = try context.fetch(CurrentUser.fetchRequest())
        }
        catch{
            print("error")
        }
        print(currentUser[0].currentUser!)
        userData = userData.filter{($0.userName == currentUser[0].currentUser!)}
        print("current user is",userData)
        super.viewDidLoad()
        switch choice {
        case "Food":
            question.text = "What do you think of our food in general?"
        case "Gym":
            question.text = "What do you think of our gym in general?"
        case "Room":
            question.text = "What do you think of your room in general?"
        default:
            print("error")
        }
        print(choice)
        serviceChosen.text = choice
        qNum = 0;

        for star in starArray{
            star.setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
        }


        

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
