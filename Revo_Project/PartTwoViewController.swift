//
//  PartTwoViewController.swift
//  Revo_Project
//
//  Created by John on 8/2/20.
//  Copyright © 2020 Chris N. All rights reserved.
//

import UIKit
import AVKit

class PartTwoViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    
    var player = AVPlayer()
    var isPlaying = false
    var didPlay = false
    
    //Grab MP3 from this link.
    let url = "https://p.scdn.co/mp3-preview/757bc5732e5c92e36ea249d631120b381a4885e2?cid=e188f3e083e741659b2ef6cfb07cddbd.mp3"
    
    //CREATE TIMER
    var timer = Timer()
    

    override func viewDidLoad() {
        //hide activity view
        blackView.alpha = 0
        activityView.alpha = 0
        activityView.color = UIColor.white
        activityView.hidesWhenStopped = true
        
        restartButton.alpha = 0
        
        //set observer for player
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemReadyToPlay(notification:)),
        name: .AVPlayerItemNewAccessLogEntry,
        object: player.currentItem)
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player.pause()
    }
    
   @objc func playerItemReadyToPlay(notification: Notification) {
        if let _ = notification.object as? AVPlayerItem {
            // player is ready to play now!!
            //stop loading indicator
            activityView.stopAnimating()
            blackView.alpha = 0
            restartButton.alpha = 1
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)

           }
   }
    
    @objc func updateTimeLabel(){
        //TURN CMTIME VALUES INTO REGULAR Ints!
        let timeNow = Int(self.player.currentTime().value) / Int(self.player.currentTime().timescale)
        
        //GRAB MIN / SECONDS
        let currentMins = timeNow / 60
        let currentSec = timeNow % 60

        //ADD 0 IF LESS THAN 9 SECONDS
        if currentSec < 10 {
            let duration: String = "\(currentMins):0\(currentSec)"
            self.timerLabel.text = duration
        }else{
            let duration: String = "\(currentMins):\(currentSec)"
            self.timerLabel.text = duration
        }

    }
    
    @IBAction func playButton(_ sender: Any) {
        //show activity indicator
        blackView.alpha = 0.8
        activityView.alpha = 1
        activityView.startAnimating()
        
        if isPlaying == false && didPlay == false{
            isPlaying = true
            didPlay = true
            self.playButton.setTitle("Pause", for: .normal)
            guard let url = URL.init(string: self.url) else { return }
            let playerItem = AVPlayerItem.init(url: url)
            self.player = AVPlayer.init(playerItem: playerItem)
            self.player.play()
        }else if didPlay == true && isPlaying == false {
            self.player.play()
            isPlaying = true
            self.playButton.setTitle("Pause", for: .normal)
        }else if isPlaying == true{
            isPlaying = false
            self.player.pause()
            self.playButton.setTitle("Play", for: .normal)
        }
    }
    
    @IBAction func restartButton(_ sender: Any) {
        self.player.seek(to: .zero)
        self.player.play()
        self.playButton.setTitle("Pause", for: .normal)
        isPlaying = true
    }
    
}
