//
//  ViewController.swift
//  hyperDesignTask
//
//  Created by Doaa on 1/17/18.
//  Copyright © 2018 Doaa. All rights reserved.
//

import UIKit
import PinterestLayout

class CollectionViewController : UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource ,PinterestLayoutDelegate {

    @IBOutlet weak var collectionView: UICollectionView!

    let countParameter = 10
    
    var products = [product]()
    var alamofireObject = AlamofireRequest()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = PinterestLayout()
        collectionView.collectionViewLayout = layout
        layout.delegate = self
        layout.cellPadding = 5
        layout.numberOfColumns = 2
        collectionView.delegate = self
        collectionView.dataSource = self
        getProducts(idToStartFrom: 1)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? collectionCell
    
        if indexPath.row == products.count - 1  {
            
            getProducts(idToStartFrom: products.count + 1)
        }
        let cellData = products[indexPath.row]
        cell?.updateCell(receivedProduct: cellData)
        
        return cell!
    }

    
    func collectionView(collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        
        let imageHeight = CGFloat (products[indexPath.row].imageInfo.height)
        return imageHeight
    }
    
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        
        let labelHeight = CGFloat (products[indexPath.row].productDescription.heightForWidth(width: CGFloat(products[indexPath.row].imageInfo.width), font: UIFont.systemFont(ofSize: 17)))
        return labelHeight
    }
    
    func getProducts(idToStartFrom : Int){
        
        alamofireObject.productsRequest(count: countParameter, from: idToStartFrom, setProducts: { (receivedProducts) in
            self.products.append(contentsOf: receivedProducts)
            self.collectionView?.reloadData()
        })
        
    }
}

