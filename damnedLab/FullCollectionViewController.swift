//
//  ViewController.swift
//  lab
//
//  Created by Admin on 24.01.17.
//  Copyright © 2017 swiftlabs. All rights reserved.
//

import UIKit

class FullCollectionViewController: UIViewController, UICollectionViewDataSource {

    var data_source = ImageSource()
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //so far we have just one section
        let count = data_source.getImages().count
        guard count < 0 else {
            return count
        }
        
        let messageEmpty : UILabel = UILabel(frame: collectionView.bounds)
        messageEmpty.text = "Nothing to show. Pull down to refresh."
        messageEmpty.backgroundColor = collectionView.backgroundColor
        messageEmpty.sizeToFit()
        
        collectionView.backgroundView = messageEmpty
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "com.codepath.CustomCell", for: indexPath as IndexPath) as! CustomCell
        
        
        return cell
    }
}

