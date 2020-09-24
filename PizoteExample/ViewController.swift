//
//  ViewController.swift
//  PizoteExample
//
//  Created by Fernando Valverde on 9/23/20.
//

import UIKit
import Pizote

class ViewController: UIViewController {

    @IBOutlet weak var webView: ForemWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.load("https://forem.dev")
    }

}

