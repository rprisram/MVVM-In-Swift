//
//  ViewController.swift
//  MVVM_Testing_swift
//
//  Created by macbook on 6/5/16.
//  Copyright © 2016 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bodyTextLabel: UILabel!
    var titleLabel: UILabel!
    var dateLabel: UILabel!
    var imageView : UIImageView!
    
    var mvvmSample : mvvmViewModel! {
        didSet {
            
            mvvmSample.title.bindAndFire { [unowned self] in
                self.titleLabel.text = $0
            }
            mvvmSample.body.bindAndFire { [unowned self] in
                self.bodyTextLabel.text = $0
            }
            mvvmSample.date.bindAndFire { [unowned self] in
                self.dateLabel.text = $0
            }
            
            mvvmSample.thumbnail.bindAndFire { [unowned self] in
                self.imageView.image = $0
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadUI()
        let mvvmdata : mvvmDataModel = mvvmDataModel()
        mvvmdata.body = "hi"
        mvvmdata.date = NSDate()
        mvvmdata.title = "Trial 1"
        mvvmdata.thumbnail = NSURL(string: "http://www.newyorker.com/wp-content/uploads/2015/03/Stokes-Baby-1200.jpg")
        self.mvvmSample = mvvmViewModelFromModel(mvvmdata)
    }
    
    func loadUI()
    {
        self.titleLabel = UILabel(frame: CGRectMake(0, 50, 300, 20));
        self.titleLabel.text = "";
        self.view.addSubview(self.titleLabel);
        
        self.dateLabel = UILabel(frame: CGRectMake(0, 100, 300, 20));
        self.dateLabel.text = "";
        self.view.addSubview(self.dateLabel);
        
        self.bodyTextLabel = UILabel(frame: CGRectMake(0, 150, 300, 20));
        self.bodyTextLabel.text = "";
        self.view.addSubview(self.bodyTextLabel);
        
        self.imageView = UIImageView(frame: CGRectMake(30, 300, 100, 100))
        self.imageView.image = nil
        self.view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

