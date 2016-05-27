//
//  StructuredMessage.swift
//  MessageUI
//
//  Created by Arun on 4/27/16.
//  Copyright © 2016 Arun. All rights reserved.
//
//  MARK: - MOST RECENT PULL FROM GITHUB


import Foundation
import JSQMessagesViewController
import UIKit


class StructuredMessage: NSObject, JSQMessageMediaData {
    
    //    var sender: String?
    var productName = ""
    var price = 0.0
    var productAttribute = ""
    var productImage = UIImage()
    
    @objc func mediaView() -> UIView {
        return self.createView()
    }
    
    @objc func mediaPlaceholderView() -> UIView! {
        return self.createView()
    }
    
    @objc func mediaViewDisplaySize() -> CGSize {
        return self.constantFrame().size
    }
    
    @objc func mediaHash() -> UInt {
        return 1
    }
    
    
    private let cellConstant:CGFloat = 40.0
    
    func createView() -> UIView {
        
        //let view = UIView()
        let view = UIView(frame: self.constantFrame())
        
        let messageView = UIView(frame: self.constantFrame())
        //        messageView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.9)
        messageView.alpha = 1
        messageView.contentMode = UIViewContentMode.ScaleAspectFill
        messageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messageView)
        //        messageView.translatesAutoresizingMaskIntoConstraints = false
        //        messageView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: 0).active = true
        //        messageView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 0).active = true
        //        messageView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        //        messageView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        messageView.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 0).active = true
        messageView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: 0).active = true
        messageView.rightAnchor.constraintEqualToAnchor(view.rightAnchor).active = true
//        messageView.leftAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
        //        messageView.heightAnchor.constraintEqualToAnchor(view.heightAnchor).active = true
        messageView.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
        
        
        let overlayImage: UIImage = UIImage(named: "Product")!
        var overlayImageView = UIImageView(frame: self.constantFrame())
        //let squareProductImage = RBSquareImageTo(productImage, size: productImage.size)
        let squareProductImageOverlay = RBSquareImageTo(overlayImage, width: overlayImage.size.width, height: overlayImage.size.height)
        overlayImageView = UIImageView(image: squareProductImageOverlay)

//        overlayImageView.image = self.productImage
        overlayImageView.contentMode = UIViewContentMode.ScaleAspectFill
        overlayImageView.alpha = 1
        overlayImageView.translatesAutoresizingMaskIntoConstraints = false
        messageView.addSubview(overlayImageView)
        overlayImageView.topAnchor.constraintEqualToAnchor(messageView.topAnchor).active = true
        overlayImageView.bottomAnchor.constraintEqualToAnchor(messageView.bottomAnchor).active = true
        //        overlayImageView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor, constant: -50).active = true
        //        overlayImageView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        //        overlayImageView.leftAnchor.constraintEqualToAnchor(messageView.leftAnchor).active = true
        //        overlayImageView.rightAnchor.constraintEqualToAnchor(messageView.rightAnchor).active = true
        overlayImageView.widthAnchor.constraintEqualToAnchor(messageView.widthAnchor).active = true
        
        let overlayBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let overlayBlurView = UIVisualEffectView(effect: overlayBlurEffect)
        overlayBlurView.tintColor = UIColor.grayColor()
        overlayBlurView.backgroundColor = UIColor.blackColor()
        overlayBlurView.alpha = 0.4
        overlayBlurView.translatesAutoresizingMaskIntoConstraints = false
        overlayImageView.addSubview(overlayBlurView)
        overlayBlurView.topAnchor.constraintEqualToAnchor(overlayImageView.topAnchor).active = true
        overlayBlurView.bottomAnchor.constraintEqualToAnchor(overlayImageView.bottomAnchor).active = true
        overlayBlurView.widthAnchor.constraintEqualToAnchor(overlayImageView.widthAnchor).active = true
        //        overlayBlurView.leftAnchor.constraintEqualToAnchor(messageView.leftAnchor).active = true
        //        overlayBlurView.rightAnchor.constraintEqualToAnchor(messageView.rightAnchor).active = true
        ////
        //                let vibrancyEffect = UIVibrancyEffect(forBlurEffect: overlayBlurEffect)
        //                let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        //                vibrancyEffectView.frame = messageView.bounds
        //                overlayBlurView.addSubview(vibrancyEffectView)
        
        let productImage: UIImage = UIImage(named: "Product")!
        var productView: UIImageView
        //let squareProductImage = RBSquareImageTo(productImage, size: productImage.size)
        let squareProductImage = RBSquareImageTo(productImage, width: productImage.size.width, height: productImage.size.height)
        productView = UIImageView(image: squareProductImage)
        productView.contentMode = UIViewContentMode.ScaleAspectFill
        productView.translatesAutoresizingMaskIntoConstraints = false
//        productView.image = self.productImage
        messageView.addSubview(productView)
        productView.topAnchor.constraintEqualToAnchor(messageView.topAnchor, constant: 10).active = true
        productView.bottomAnchor.constraintEqualToAnchor(messageView.bottomAnchor, constant: -10).active = true
        productView.rightAnchor.constraintEqualToAnchor(messageView.rightAnchor, constant: -0.95*UIScreen.mainScreen().bounds.size.width).active = true
        productView.leftAnchor.constraintGreaterThanOrEqualToAnchor(messageView.leftAnchor, constant: 30).active = true
//        productView.leftAnchor.constraintEqualToAnchor(messageView.leftAnchor, constant: -0.025 * UIScreen.mainScreen().bounds.size.width).active = true
        
        let button = UIButton()
        button.backgroundColor = UIColor.clearColor()
        button.setTitle("$\(self.price)", forState: UIControlState.Normal)
        button.setTitleColor(UIColor(red:37.0/255.0,green:199.0/255.0,blue:255.0/255.0,alpha : 1.0), forState: .Normal)
        button.addTarget(self, action: #selector(StructuredMessage.pressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 2.5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red:37.0/255.0,green:199.0/255.0,blue:255.0/255.0,alpha: 1.0).CGColor
        button.titleLabel!.font =  UIFont(name: "HelveticaNeue", size: 0.0175*UIScreen.mainScreen().bounds.size.height)
//        button.titleLabel!.font =  UIFont(name: "HelveticaNeue", size: 12)

        button.translatesAutoresizingMaskIntoConstraints = false
        messageView.addSubview(button)
        button.bottomAnchor.constraintEqualToAnchor(messageView.bottomAnchor, constant: -17).active = true
        button.leftAnchor.constraintEqualToAnchor(messageView.leftAnchor, constant: 0.25*UIScreen.mainScreen().bounds.size.width).active = true
        button.topAnchor.constraintEqualToAnchor(messageView.topAnchor, constant: 0.11*UIScreen.mainScreen().bounds.size.height).active = true
        button.widthAnchor.constraintEqualToAnchor(messageView.widthAnchor, constant: -0.85*UIScreen.mainScreen().bounds.size.width).active = true
        
        
        let productLabel = UILabel()
        productLabel.text = "Men's Nike Roshe One NM Flyknit"
//        productLabel.text = self.productName
        productLabel.textColor = UIColor.whiteColor()
        productLabel.font = UIFont(name: "HelveticaNeue", size: 0.0175*UIScreen.mainScreen().bounds.size.height)
        productLabel.lineBreakMode = .ByWordWrapping
        productLabel.numberOfLines = 0
        productLabel.translatesAutoresizingMaskIntoConstraints = false
        messageView.addSubview(productLabel)
        productLabel.topAnchor.constraintEqualToAnchor(productView.topAnchor, constant: -10 ).active = true
        productLabel.leftAnchor.constraintEqualToAnchor(messageView.leftAnchor, constant: 0.25*UIScreen.mainScreen().bounds.size.width).active = true
        productLabel.rightAnchor.constraintEqualToAnchor(messageView.rightAnchor, constant: -0.3*UIScreen.mainScreen().bounds.size.width).active = true
        productLabel.bottomAnchor.constraintEqualToAnchor(messageView.bottomAnchor, constant: -0.16*UIScreen.mainScreen().bounds.size.width).active = true
        
        let productDetailLabel = UILabel()
        productDetailLabel.text = "Black/White/Cool Grey/Dark Grey"
//        productDetailLabel.text = self.productAttribute
        productDetailLabel.textColor = UIColor.whiteColor()
        productDetailLabel.font =  UIFont(name: "HelveticaNeue", size: 0.015*UIScreen.mainScreen().bounds.size.height)
        productDetailLabel.lineBreakMode = .ByWordWrapping
        productDetailLabel.numberOfLines = 0
        productDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        productLabel.addSubview(productDetailLabel)
        productDetailLabel.leftAnchor.constraintEqualToAnchor(productLabel.leftAnchor).active = true
        productDetailLabel.rightAnchor.constraintEqualToAnchor(productLabel.rightAnchor).active = true
        productDetailLabel.bottomAnchor.constraintEqualToAnchor(productLabel.bottomAnchor, constant: 0.015*UIScreen.mainScreen().bounds.size.height).active = true
        productDetailLabel.topAnchor.constraintEqualToAnchor(productLabel.bottomAnchor, constant: 0).active = true
        
        //
        //        let label = UILabel(frame: self.constantFrame())
        //        label.text = " [offline]"
        //        label.textColor = UIColor.blueColor()
        //        view.addSubview(label)
        return view
    }
    
    func constantFrame() -> CGRect {
        //return CGRectMake(0,0,600,100)
        return CGRectMake(0,0, UIScreen.mainScreen().bounds.size.width, 0.167*UIScreen.mainScreen().bounds.size.height)
    }
    
    //    func RBSquareImageTo(image: UIImage, size: CGSize) -> UIImage {
    //        //return RBResizeImage(RBSquareImage(image), targetSize: size)
    //        }
    func RBSquareImageTo(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage {
        return cropToBounds(RBSquareImage(image), width: width, height: height)
        
    }
    
    func RBSquareImage(image: UIImage) -> UIImage {
        let originalImageWidth  = image.size.height
        let originalImageHeight = image.size.height
        
        let cropSquare = CGRectMake(0.3*UIScreen.mainScreen().bounds.size.width+(originalImageHeight - originalImageWidth)/2, 0*UIScreen.mainScreen().bounds.size.width+(originalImageHeight - originalImageWidth)/2, originalImageWidth*4, originalImageWidth*4)
        let imageRef = CGImageCreateWithImageInRect(image.CGImage, cropSquare);
        return UIImage(CGImage: imageRef!, scale: UIScreen.mainScreen().scale, orientation: image.imageOrientation)
    }
    
    func cropToBounds(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage {
        
        let contextImage: UIImage = UIImage(CGImage: image.CGImage!)
        
        let contextSize: CGSize = contextImage.size
        
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRectMake(posX, posY, cgwidth, cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImageRef = CGImageCreateWithImageInRect(contextImage.CGImage, rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(CGImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
    
    
    //    func RBResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    //        let size = image.size
    //
    //        let imageWidthRatio  = targetSize.width / image.size.width
    //        let imageHeightRatio = targetSize.height / image.size.height
    //
    //        var newImageSize: CGSize
    //        if(imageWidthRatio > imageHeightRatio) {
    //            newImageSize = CGSizeMake(size.width * imageHeightRatio, size.height * imageHeightRatio)
    //        } else {
    //            newImageSize = CGSizeMake(size.width * imageWidthRatio,  size.height * imageWidthRatio)
    //        }
    //
    //        let rect = CGRectMake(0, 0, newImageSize.width, newImageSize.width)
    //
    //        UIGraphicsBeginImageContextWithOptions(newImageSize, false, 1.0)
    //        image.drawInRect(rect)
    //        let newImage = UIGraphicsGetImageFromCurrentImageContext()
    //        UIGraphicsEndImageContext()
    //        
    //        return newImage
    //    }
    
    
    func pressed(sender: UIButton!) {
        let alertView = UIAlertView();
        alertView.addButtonWithTitle("Ok");
        alertView.title = "title";
        alertView.message = "message";
        alertView.show();
    }
}