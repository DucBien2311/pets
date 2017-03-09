//
//  ImagesMainView.swift
//  MyPets
//
//  Created by NguyenDucBien on 2/17/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ImagesMainView: UIViewController{
    
    
    
    
    var petVideoView: PetVideosViewController!
    
    var petImageView: PetImageViewController!
    
    var delegate: VideoPlayDelegate?
    
    
    
    var playViewController = AVPlayerViewController()
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
    
    @IBAction func indexChange(_ sender: AnyObject) {
        
        
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            showImageView()
            
        case 1:
            showVideoView()
            break
        default:
            break;
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if(mainView.bounds.size.width != 165 && petImageView == nil)
        {
            showImageView()
        }
    }
    
    func showVideoView() {
        if(petVideoView == nil)
        {
            petVideoView = PetVideosViewController(frame: mainView.frame)
            petVideoView.delegate = self
            self.view.addSubview(petVideoView)
        }
        
        petVideoView?.isHidden = false
        petImageView?.isHidden = true
        
        
    }
    
    func showImageView() {
        if(petImageView == nil)
        {
            petImageView = PetImageViewController(frame: mainView.frame)
            petImageView.delegate = self
            self.view.addSubview(petImageView)
        }
        
        petVideoView?.isHidden = true
        petImageView?.isHidden = false
        
        
        
    }
    
}
extension ImagesMainView: VideoPlayDelegate
{
    func playVideo(url: URL){
        
        let playerView = AVPlayer(url: url)
        playViewController.player = playerView
        
        self.present(playViewController, animated: true) {
            
            self.playViewController.player?.play()
        }
        
    }
}
extension ImagesMainView: PetImageViewControllerDelegate
{
    func didSelectRow(clickedImage: CGFloat)
    {
        
        let viewScroll = ViewScroll(nibName: "ViewScroll", bundle: Bundle.main)
        self.navigationController?.pushViewController(viewScroll, animated: true)
    }
}
