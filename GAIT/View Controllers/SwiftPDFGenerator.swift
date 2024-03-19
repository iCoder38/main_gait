/*
* The MIT License (MIT)
*
* Copyright (c) 2016 cr0ss
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/

import Foundation
import UIKit

let SwiftPdfGeneratorCompression:Bool = false
let SwiftPdfGeneratorCompressionValue:CGFloat = 0.5

public class SwiftPDFGenerator {

    public static func generatePDFWithPages(pages:Array<UIView>) -> String {
        let filePath:String = NSTemporaryDirectory().stringByAppendingPathComponent(path: "report").stringByAppendingPathExtension(ext: "pdf")!
        UIGraphicsBeginPDFContextToFile(filePath, CGRect.zero, nil)
        let context = UIGraphicsGetCurrentContext()

        for page:UIView in pages {
            self.drawPageWithContext(page: page, context: context!)
        }
        UIGraphicsEndPDFContext()
        return filePath
    }

    private static func drawPageWithContext(page:UIView, context: CGContext) {
        UIGraphicsBeginPDFPageWithInfo(CGRect(x: 0.0, y: 0.0, width: page.bounds.size.width, height: page.bounds.size.height), nil)
        for subview:UIView in self.allSubViewsForPage(page: page) {
            if (subview.isKind(of: UIImageView.self)) {
                let imageView:UIImageView = subview as! UIImageView
                // Compress Image
                self.drawUIImageViewWithCompression(imageView: imageView, compression: SwiftPdfGeneratorCompression, compressionValue: SwiftPdfGeneratorCompressionValue)
            } else if (subview.isKind(of: UILabel.self)) {
                // get UILabel Styles
                let label:UILabel = subview as! UILabel
                let paragraphStyle:NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
                paragraphStyle.lineBreakMode = label.lineBreakMode
                paragraphStyle.alignment = label.textAlignment

                NSString(string: label.text!).draw(in: label.frame, withAttributes: [NSAttributedString.Key.font:label.font!, NSAttributedString.Key.paragraphStyle:paragraphStyle, NSAttributedString.Key.foregroundColor:label.textColor!])
            } else if (subview.isKind(of: UITextView.self)) {
                // Draw Border
                self.drawLinesUsingUIView(view: subview, thickness: 0.5, context: context, fillView: (subview.tag==1 ? true : false))

                // Generate UILabel for UITextView.text
                let textView:UITextView = subview as! UITextView
                self.drawUITextView(textView: textView)
            } else if (subview.isKind(of: UIView.self)) {
                self.drawLinesUsingUIView(view: subview, thickness: 0.5, context: context, fillView: (subview.tag==1 ? true : false))
            }
        }
    }

    private static func drawUIImageViewWithCompression(imageView:UIImageView,compression:Bool, compressionValue:CGFloat=0.5) {
        if let image = imageView.image {
            if (imageView.contentMode == .scaleAspectFit) {
                if (image.size.width > imageView.frame.size.width || image.size.height > imageView.frame.size.height) {
                    if (image.size.width < image.size.height) {
                        let maxHeight = imageView.frame.size.height
                        let ratio = maxHeight / image.size.height
                        let ratioWidth = image.size.width * ratio
                        if (ratioWidth > imageView.frame.size.width) {
                            let correctedMaxWidth = imageView.frame.size.width
                            let correctedRatio = correctedMaxWidth / image.size.width
                            let correctedRatioHeight = image.size.height * correctedRatio
                            if compression {
                                let compressedData:NSData = image.jpegData(compressionQuality: compressionValue)! as NSData
                                let compressedImage:UIImage = UIImage(data: compressedData as Data)!
                                compressedImage.draw(in: CGRect(x: imageView.frame.origin.x, y: imageView.frame.origin.y + (imageView.frame.height / 2) - (correctedRatioHeight / 2), width: correctedMaxWidth, height: correctedRatioHeight))
                            } else {
                                image.draw(in: CGRect(x: imageView.frame.origin.x, y: imageView.frame.origin.y + (imageView.frame.height / 2) - (correctedRatioHeight / 2), width: correctedMaxWidth, height: correctedRatioHeight))
                            }
                        } else {
                            if compression {
                                let compressedData:NSData = image.jpegData(compressionQuality: compressionValue)! as NSData
                                let compressedImage:UIImage = UIImage(data: compressedData as Data)!
                                compressedImage.draw(in: CGRect(x: imageView.frame.origin.x + (imageView.frame.width / 2) - (ratioWidth / 2), y: imageView.frame.origin.y, width: ratioWidth, height: maxHeight))
                            } else {
                                image.draw(in: CGRect(x: imageView.frame.origin.x + (imageView.frame.width / 2) - (ratioWidth / 2), y: imageView.frame.origin.y, width: ratioWidth, height: maxHeight))
                            }
                        }
                    } else {
                        let maxWidth = imageView.frame.size.width
                        let ratio = maxWidth / image.size.width
                        let ratioHeight = image.size.height * ratio
                        if (ratioHeight > imageView.frame.size.height) {
                            let correctedMaxHeight = imageView.frame.size.height
                            let correctedRatio = correctedMaxHeight / image.size.height
                            let correctedRatioWidth = image.size.width * correctedRatio

                            if compression {
                                let compressedData:NSData = image.jpegData(compressionQuality: compressionValue)! as NSData
                                let compressedImage:UIImage = UIImage(data: compressedData as Data)!
                                compressedImage.draw(in: CGRect(x: imageView.frame.origin.x + (imageView.frame.width / 2) - (correctedRatioWidth / 2), y: imageView.frame.origin.y, width: correctedRatioWidth, height: correctedMaxHeight))
                            } else {
                                image.draw(in: CGRect(x: imageView.frame.origin.x + (imageView.frame.width / 2) - (correctedRatioWidth / 2), y: imageView.frame.origin.y, width: correctedRatioWidth, height: correctedMaxHeight))
                            }
                        } else {
                            if compression {
                                let compressedData:NSData = image.jpegData(compressionQuality: compressionValue)! as NSData
                                let compressedImage:UIImage = UIImage(data: compressedData as Data)!
                                compressedImage.draw(in: CGRect(x: imageView.frame.origin.x, y: imageView.frame.origin.y + (imageView.frame.height / 2) - (ratioHeight / 2), width: maxWidth, height: ratioHeight))
                            } else {
                                image.draw(in: CGRect(x: imageView.frame.origin.x, y: imageView.frame.origin.y + (imageView.frame.height / 2) - (ratioHeight / 2), width: maxWidth, height: ratioHeight))
                            }
                        }
                    }
                } else {
                    image.draw(in: imageView.frame)
                }
            } else {
                image.draw(in: imageView.frame)
            }
        }
    }

    private static func drawUITextView(textView:UITextView) {
        textView.isSelectable = true
        let textViewFrame:CGRect = CGRect(x: textView.frame.origin.x + 2, y: textView.frame.origin.y + 2, width: textView.frame.size.width - 4, height: textView.frame.size.height - 4)
        // Get UITextView.text Styles
        let paragraphStyle:NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.alignment = textView.textAlignment

        if let font = textView.font, let textColor = textView.textColor {
            NSString(string: textView.text).draw(in: textViewFrame, withAttributes: [NSAttributedString.Key.font:font, NSAttributedString.Key.paragraphStyle:paragraphStyle, NSAttributedString.Key.foregroundColor:textColor])
        } else {
            NSString(string: textView.text).draw(in: textViewFrame, withAttributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10), NSAttributedString.Key.paragraphStyle:paragraphStyle, NSAttributedString.Key.foregroundColor:UIColor(red: 70.0/255.0, green: 74.0/255.0, blue: 72.0/255.0, alpha: 1.0)])
        }
    }

    private static func drawLinesUsingUIView(view:UIView, thickness:CGFloat, context:CGContext, fillView:Bool) {
        context.saveGState()
        context.setStrokeColor(view.backgroundColor?.cgColor ?? UIColor.gray.cgColor)
        context.setFillColor(view.backgroundColor?.cgColor ?? UIColor.brown.cgColor)
        context.setLineWidth(thickness)

        if (view.frame.size.width > 1 && view.frame.size.height == 1) {
            context.move(to: CGPoint(x: view.frame.origin.x-0.5, y: view.frame.origin.y))
            context.addLine(to: CGPoint(x: view.frame.origin.x+view.frame.size.width-0.5, y: view.frame.origin.y))
            context.strokePath()
        } else if (view.frame.size.width == 1 && view.frame.size.height > 1) {
            context.move(to: CGPoint(x: view.frame.origin.x, y: view.frame.origin.y-0.5))
            context.addLine(to: CGPoint(x: view.frame.origin.x, y: view.frame.origin.y+view.frame.size.height+0.5))
            context.strokePath()
        } else if (view.frame.size.width > 1 && view.frame.size.height > 1) {
            if (fillView) {
                context.setFillColor(view.backgroundColor?.cgColor ?? UIColor.brown.cgColor)
                context.fill(view.frame)
            }
            context.stroke(view.frame)
        } else {
            // print("0x0 view")
        }
        context.restoreGState()
    }

    private static func allSubViewsForPage(page:UIView) -> Array<UIView> {
        var returnArray:Array<UIView> = []
        returnArray.append(page)
        for subview:UIView in page.subviews {
            if subview.isHidden == false {
                if (subview.isKind(of: UILabel.self)){
                    let label:UILabel = subview as! UILabel
                    label.sizeToFit()
                    label.layoutIfNeeded()
                }
                let origin:CGPoint = (subview.superview?.convert(subview.frame.origin, to: subview.superview?.superview))!
                subview.frame = CGRect(x: origin.x, y: origin.y, width: subview.frame.size.width, height: subview.frame.size.height)
                returnArray.append(contentsOf: self.allSubViewsForPage(page: subview))
            }
        }
        return returnArray
    }
}

extension String {
    func stringByAppendingPathComponent(path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }

    func stringByAppendingPathExtension(ext: String) -> String? {
        let nsSt = self as NSString
        return nsSt.appendingPathExtension(ext)
    }
}
