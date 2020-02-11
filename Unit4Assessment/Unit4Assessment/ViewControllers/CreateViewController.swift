//
//  CreateViewController.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

//- **2: Create** - the user can create a flash card here. It should consist of a UITextField and two UITextViews.

//1. Enter the title of the card. e.g "Quick Sort."
//2. Enter a first term (description) for the card. e.g "Uses divide and conquer and splits the array into three parts based on a "pivot" variable."
//3. Enter a second term (description) for the card e.g "Picks an element as pivot and partitions the given array around the picked pivot."
//4. After all required fields are filled in, the user then taps on the "Create" button.
//5. The card should now be visible in the Flash Cards tab.


//### Creating a flash card
//The second view controller allows the user to create a flash card.

//Make sure to handle all required fields appropriately with alerts to the user. e.g "Title is required," or "The Quiz requires two facts." **All fields are required**

import UIKit
import DataPersistence

class CreateViewController: UIViewController {

    public var dataPersistence: DataPersistence<Card>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   view.backgroundColor = .orange
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
