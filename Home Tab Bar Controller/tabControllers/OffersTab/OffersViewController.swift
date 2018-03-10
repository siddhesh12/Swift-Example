//
//  OffersViewController.swift
//  TimBurtons
//
//  Created by Siddhesh Mahadeshwar on 09/03/18.
//  Copyright © 2018 net.siddhesh. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController {

    @IBOutlet weak var giftcardCTrailingConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func segmentClicked(_ sender: UISegmentedControl) {
        showGiftCardController(Bool(sender.selectedSegmentIndex == 1 ? true:false))
    }
    
    func showGiftCardController(_ show:Bool)
    {
        giftcardCTrailingConstraint.constant = show ? 0 : -view.frame.size.width
        UIView.animate(withDuration: 0.24) {
            self.view.layoutIfNeeded()
        }
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
