//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Sai Naveen Katla on 16/10/20.
//

import UIKit

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let songName: String
    let imageName: String
}

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        addSongs()
    }
    
    func addSongs() {
        songs.append(Song(name: "A", albumName: "AA", artistName: "AAA", songName: "AAAA", imageName: "1"))
        
        songs.append(Song(name: "B", albumName: "BB", artistName: "BBB", songName: "BBBB", imageName: "2"))
        
        songs.append(Song(name: "C", albumName: "CC", artistName: "CCC", songName: "CCCC", imageName: "3"))
        
        songs.append(Song(name: "A", albumName: "AA", artistName: "AAA", songName: "AAAA", imageName: "1"))
        
        songs.append(Song(name: "B", albumName: "BB", artistName: "BBB", songName: "BBBB", imageName: "2"))
        
        songs.append(Song(name: "C", albumName: "CC", artistName: "CCC", songName: "CCCC", imageName: "3"))
        
        songs.append(Song(name: "A", albumName: "AA", artistName: "AAA", songName: "AAAA", imageName: "1"))
        
        songs.append(Song(name: "B", albumName: "BB", artistName: "BBB", songName: "BBBB", imageName: "2"))
        
        songs.append(Song(name: "C", albumName: "CC", artistName: "CCC", songName: "CCCC", imageName: "3"))
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "player") as! PlayerViewController
        
        vc.songs = songs
        vc.position = indexPath.row
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = songs[indexPath.row].name
        cell.detailTextLabel?.text = songs[indexPath.row].albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: "\(songs[indexPath.row].imageName)")
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
}

