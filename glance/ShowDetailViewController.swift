//
//  ShowDetailViewController.swift
//  glance
//
//  Created by Andrew Tsukuda on 1/21/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit
import Kingfisher

class ShowDetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var summaryTextView: UITextView!
    
    var show: Show? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let show = self.show {
            if let imageUrl = URL(string: show.imageUrl) {
                self.posterImageView.kf.setImage(with: imageUrl)
            }
            self.summaryTextView.text = show.summary
        }
        
        // Do any additional setup after loading the view.
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
