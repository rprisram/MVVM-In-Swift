//
//  MVVMViewModelFromModel.swift
//  MVVM_Testing_swift
//
//  Created by macbook on 6/6/16.
//  Copyright © 2016 macbook. All rights reserved.
//

import Foundation
import UIKit
protocol mvvmViewModel {
    var title : Dynamic<String> { get }
    var body : Dynamic<String> { get }
    var date : Dynamic<String> { get }
    var thumbnail : Dynamic<UIImage?> {get }
}
class mvvmViewModelFromModel : mvvmViewModel
{
    var title : Dynamic<String>
    var body : Dynamic<String>
    var date : Dynamic<String>
    var thumbnail: Dynamic<UIImage?>
    var valueDataModel : mvvmDataModel!
    
    init(_ value: mvvmDataModel)
    {
        
        self.valueDataModel = value
        self.title = Dynamic(value.title)
        self.body = Dynamic(value.body)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        self.date = Dynamic(dateFormatter.stringFromDate(value.date))
        self.thumbnail = Dynamic(nil)
        
        let downloadTask = NSURLSession.sharedSession().downloadTaskWithURL(value.thumbnail) { [weak self](location, resp, error) in
            if let data = NSData(contentsOfURL: location!), thumbnail = UIImage(data: data)
            {
                self?.thumbnail.value = thumbnail
            }
        }
        downloadTask.resume()
        
    }
    
}

