//
//  DetailViewController.swift
//  Youtube App
//
//  Created by Sai Naveen Katla on 06/10/20.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    let embedURL = "https://www.youtube.com/embed/"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webkit: WKWebView!
    @IBOutlet weak var descriptionText: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard video != nil else { return }
        
        let url = embedURL + video!.videoId
        let request = URLRequest(url: URL(string: url)!)
        webkit.load(request)
        
        titleLabel.text = video?.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        descriptionText.text = video?.description
    }
    

    
}
