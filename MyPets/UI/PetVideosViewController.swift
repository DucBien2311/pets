//
//  PetVideosViewController.swift
//  MyPets
//
//  Created by NguyenDucBien on 2/16/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
let kThumbVideoName = "ThumbVideos"
protocol VideoPlayDelegate {
    
    func playVideo(url: URL)
    
}

class PetVideosViewController: UIView, VideoTabViewCellDelegate {
    
    
    var delegate: VideoPlayDelegate?
    
    var arrayData: [MediaItems]!
    
    
    var fileVideoList = NSArray()// Mang chua file trong Directory Video
    var fileThumList = NSArray() // Mang chua file trong Directory Thumb
    var nameImageThumbArray: [String] = []
    var linkVideoArray: [URL]!
    let fileManager: FileManager = FileManager.default
    var linkThumbFolder: String = ""
    var linkFileThumb: String = ""
    var nameThumb: String?
    
    
    
    
    var videoTableView = UITableView(frame:CGRect(x: 0, y: 0, width: 0, height: 0),style: .plain)
    
    
    let playerBtn = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        print(nameImageThumbArray)
        arrayData = [MediaItems]();
        getNameVideo()
        creatData()
        
        creatVideoThumbFoder()
        self.setupTableView()
        
    }
    
    func creatData() {
        for videoPath in linkVideoArray
        {
            
            let name = (videoPath.lastPathComponent as NSString).deletingPathExtension
            let path = videoPath.absoluteString
            let thumb = documentsPath + "/ThumbVideo" + "/\(name).png"
            let data: MediaItems = MediaItems(name: name, urlThumb: thumb, urlVideo: path)
            arrayData.append(data)
            
            
        }

    }
    
    func getNameVideo() {
        linkVideoArray = [URL]()
        fileVideoList = (listFileVideosFromDocumentFolder() as NSArray?)!
        if(fileVideoList.count) > 0
        {
            for i in 0..<(fileVideoList.count)
            {
                if fileManager.fileExists(atPath: (fileVideoList[i])as!String) != true
                {
                    let fileURL = URL(fileURLWithPath: documentsPath + "/\((fileVideoList[i]))")
                    
                    if fileURL.pathExtension == "mp4" || fileURL.pathExtension == "mov"
                    {
                        linkVideoArray.append(fileURL)
                    }
                }
            }
        }
    }
    
    
    
    func creatVideoThumbFoder() {
        let thumbFolder = documentsPath + "/\(kThumbVideoName)"
        do {
            try FileManager.default.createDirectory(atPath: thumbFolder, withIntermediateDirectories: false, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription);
        }
        linkThumbFolder = thumbFolder
        creatThumbImageVideo()
    }
    
    
    func creatThumbImageVideo() {
        for i in 0..<linkVideoArray.count
        {
            
            let asset = AVURLAsset(url: linkVideoArray[i], options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            let cgImage = try! imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            let uiImage = UIImage(cgImage: cgImage)
            if let data = UIImagePNGRepresentation(uiImage) { //tạo một file ảnh định dạng png
                
                
                nameThumb = ((linkVideoArray[i].lastPathComponent) as NSString).deletingPathExtension
                
                print(nameThumb!)
                
                linkFileThumb = linkThumbFolder + "/\(nameThumb!).png"
                try? data.write(to: URL(fileURLWithPath: linkFileThumb)) // ghi file ảnh
                
                
            }
        }
        getThumbImage()
        
    }
    
    
    
    func getThumbImage() {
        fileThumList = (listFileThumbsFromDocumentsFolder())! as NSArray
        
        
        for name in fileThumList
        {
            if fileManager.fileExists(atPath: (name) as! String) != true
            {
                print(name)
                let fileURL = URL(fileURLWithPath: linkThumbFolder + "/\(name)" )
                
                if fileURL.pathExtension == "png"{
                    
                    let namePic: [String] = [fileURL.lastPathComponent]
                    nameImageThumbArray = nameImageThumbArray + namePic
                    
                }
            }
        }
        
    }
    
    func listFileVideosFromDocumentFolder() -> [String]? {
        
        do
        {
            if let fileName = try? FileManager.default.contentsOfDirectory(atPath: documentsPath)
            {
                return fileName
            }
        }
            
        catch let e as exception
            
        {
            print("e: \(e)")
        }
        return [""]
        
    }
    
    
    func listFileThumbsFromDocumentsFolder() -> [String]? {
            let linkThumbF = documentsPath + "/\(kThumbVideoName)"
            do
            {
                if let fileName = try? FileManager.default.contentsOfDirectory(atPath: linkThumbF)
                {
                    return fileName
                }
            }
                
            catch let e as exception
                
            {
                print("e: \(e)")
            }
        
       
        
        return [""]
    }
    
    
    
    func setupTableView() {
        
        videoTableView.frame =  CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        videoTableView.delegate = self
        videoTableView.dataSource = self
        videoTableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "VideoTableViewCell")
        self.addSubview(videoTableView)
    }
    
    func ButtonDidClick() {
        
        //            let pathVideo = NSURL(string: arrayData[i].urlVideo)
        //            playerView = AVPlayer(url: pathVideo! as URL)
        //            playViewController.player = playerView
        //            self.present(playViewController, animated: true) {
        //                self.playViewController.player?.play()
        //        }
    }
    
}
extension PetVideosViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameImageThumbArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = VideoTableViewCell(style: .default, reuseIdentifier: "VideoTableViewCell")
        
        
        cell.delegate = self
        
        self.videoTableView.separatorStyle = .none
        
        let fileURL = URL(fileURLWithPath: linkThumbFolder + "/\(nameImageThumbArray[indexPath.row])")
        
        let data = try? Data(contentsOf: fileURL as URL)
        
        cell.imageView?.image = UIImage(data: data!)
        
        cell.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 210)
        
        return cell
        
    }
}
extension PetVideosViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let videoURL = NSURL(string: arrayData[indexPath.row].urlVideo) as! URL
        print("LinkURL: \(videoURL)")
        
        
        delegate?.playVideo(url: videoURL)
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 210
    }
}
