//
//  ViewController.swift
//  Youtube App
//
//  Created by Sai Naveen Katla on 05/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let manager = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        manager.delegate = self
        
        manager.perform()
    }


}

//MARK: - TableView - Delegate and Datasource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "youtubeCell", for: indexPath) as! VideoViewCell
        let video = videos[indexPath.row]
        
        cell.title.text = video.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        cell.subtitle.text = df.string(from: video.published)
        
        cell.thumbnail.loadImageFromURL(video.thumbnail)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.video = videos[tableView.indexPathForSelectedRow!.row]
    }
    
    
}

extension ViewController: VideoData {
    
    func gotdata(_ Model: Model, _ videos: [Video]) {
        self.videos = videos
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
    
    
}



