//
//  TestViewController.swift
//  sinsungo
//
//  Created by 원동진 on 2023/01/12.
//

import UIKit
import FirebaseAuth
class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let email = Auth.auth().currentUser?.email ?? "고객"
        print("\(email)")
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
