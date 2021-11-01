//
//  ViewController.swift
//  FaceRecognition
//
//  Created by Swayam Barik on 11/1/21.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        
        let authContext = LAContext()
        var error: NSError?
        
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Use FaceID To Log In") { (isSuccess, error) in
                if isSuccess {
                    
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondViewController", sender: nil)
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"
                    }
                    
                }
            }
        }
    }
    
}

