//
//  PetImageViewController.swift
//  MyPets
//
//  Created by NguyenDucBien on 2/17/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit
import Photos
protocol PetImageViewControllerDelegate {
    func didSelectRow(clickedImage: CGFloat)
}

class PetImageViewController: UIView{
    
    var imageArray = [UIImage]()
    var fileList: NSArray?
    var documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory
        , .allDomainsMask, true)[0]
    let fileManager:FileManager = FileManager.default
    var fileNames: [String] = []
    var images: Images!
    var scrollView: ViewScroll!
    var clickedImage: CGFloat!
    var urlArray: [URL] = []
    var imageCollectionView:UICollectionView!
    var delegate: PetImageViewControllerDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
        grabPhotos2()
        print(urlArray)
        self.setupCollectionView()
    }
    
    
    
    
    func grabPhotos2() {
        fileList = listFilesFromDocumentsFolder() as NSArray?
        var image: UIImage
        if (fileList?.count)! > 0 {
            for i in 0..<(fileList?.count)! {
                if fileManager.fileExists(atPath: (fileList?[i])! as! String) != true {
                    let fileURL = URL(fileURLWithPath: documentsPath + "/\((fileList?[i])!)")
                    //                    print(fileURL.pathExtension)
                    if fileURL.pathExtension == "jpg" || fileURL.pathExtension == "jpeg" || fileURL.pathExtension == "png" {
                        let data = try? Data(contentsOf: fileURL)
                        //                        print(fileURL)
                        image = UIImage(data: data!)!
                        self.imageArray.append(image)
                        let a: [String] = [fileURL.lastPathComponent]
                        fileNames = fileNames + a
                        urlArray = urlArray + [fileURL]
                        
                    }
                }
            }
        }
    }
    
    func listFilesFromDocumentsFolder() -> [String]? { // duyet folder de xem trong day co nhung file nao
        let dirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        if dirs != nil {
            let dir = dirs[0]
            do {
                if let fileList = try? FileManager.default.contentsOfDirectory(atPath: dir)
                {
                    return fileList
                }
            }
            catch let e as exception {
                //                print("e: \(e)")
            }
        }else {
            
            //            print("bien 2 : \(fileList.count)")
            
            let fileList = [""]
            return fileList
        }
        return nil
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.bounds.width/4, height: self.bounds.width/4)
        layout.scrollDirection = .vertical
        
        imageCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height), collectionViewLayout: layout)
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(CellItem.self, forCellWithReuseIdentifier: "Cell")
        self.addSubview(imageCollectionView)
    }
    
    
    
}
extension PetImageViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
extension PetImageViewController: UICollectionViewDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        clickedImage = CGFloat(indexPath.row)
        let images = Images.sharedInstance
        images.clickedImage = clickedImage
        images.cells = imageArray
        delegate.didSelectRow(clickedImage: clickedImage)
        
    }

    
    
}

extension PetImageViewController: UICollectionViewDataSource
    
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CellItem
        cell.sizeImageView = CGSize(width: (collectionView.frame.width/4), height: (collectionView.frame.width/4))
        cell.addSubViews()
        cell.imageView.image = imageArray[indexPath.item]
        return cell
    }
}
