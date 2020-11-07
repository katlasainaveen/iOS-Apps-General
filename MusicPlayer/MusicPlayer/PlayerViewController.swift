//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by Sai Naveen Katla on 16/10/20.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var imageRS: NSLayoutConstraint!
    @IBOutlet weak var imageLS: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var imageTop: NSLayoutConstraint!
    
    var position: Int = 0
    var songs = [Song]()
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = songs[position].name
        
        slider.addTarget(self, action: #selector(adjustVolume), for: .valueChanged)
        
        setProperties()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setProperties() {
        image.image = UIImage(named: songs[position].imageName)
        artistName.text = songs[position].artistName
        
        setPlayer()
    }
    
    @objc func adjustVolume(slider: UISlider) {
        player?.volume = slider.value
    }
    
    func setPlayer() {
        let song = songs[position]
        
        guard let url = Bundle.main.path(forResource: song.albumName, ofType: ".mp3") else {
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            player = try AVAudioPlayer(contentsOf: URL(string: url)!)
            player?.delegate = self
            player?.play()
        }
        catch {
            print(error)
        }
    }
    
    @objc func playerFinished(note: NSNotification) {
        forwardTapped(self)
        print("song over")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if let player = player {
            player.stop()
        }
    }
    
    @IBAction func playTapped(_ sender: Any) {
        if player?.isPlaying == true {
            player?.pause()
            playButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            UIView.animate(withDuration: 0.2) { [self] in
                imageRS.constant = 30
                imageLS.constant = 30
                imageTop.constant = 27
                imageHeight.constant = 360
            }
            
        }
        else {
            player?.play()
            playButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            UIView.animate(withDuration: 0.2) { [self] in
                imageRS.constant = 12
                imageLS.constant = 12
                imageTop.constant = 12
                imageHeight.constant = 390
            }
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        if position > 0 {
            position = position - 1
        }
        else {
            position = songs.count - 1
        }
        player?.stop()
        setProperties()
    }
    
    @IBAction func forwardTapped(_ sender: Any) {
        if position < songs.count - 1 {
            position = position + 1
        }
        else if position == songs.count - 1 {
            position = 0
        }
        player?.stop()
        setProperties()
    }
    

}

extension PlayerViewController: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("done")
        forwardTapped(self)
    }
    
}

