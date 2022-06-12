//
//  GallaryViewController.swift
//  RemoteImages
//
//  Created by Sagar Kadam on 12/06/22.
//

import Foundation
import UIKit

class GallaryCell: UITableViewCell {
    @IBOutlet fileprivate(set) var gallaryImageView: UIImageView!
    
    func setup(url: String) {
        gallaryImageView?.loadImageFromURL(urlString: url, placeHolder: UIImage(named: "placeholderImage"))
    }
}

class GallaryViewController: UITableViewController {
    let dataSource = ["https://assets.imgix.net/hp/snowshoe.jpg?auto=compress&w=600&h=600&fit=crop&mask=ellipse&fm=png",
                      "https://assets.imgix.net/unsplash/transport.jpg?auto=compress&w=600&h=600&fit=crop&mask=ellipse&fm=png",
                      "https://assets.imgix.net/unsplash/coffee.JPG?auto=compress&w=600&h=600&fit=crop&mask=ellipse&fm=png",
                      "https://assets.imgix.net/unsplash/womansitting.jpg?auto=compress&w=600&h=600&fit=crop&mask=ellipse&fm=png",
                      "https://assets.imgix.net/examples/balloons.jpg?auto=compress&w=600&h=600&fit=crop&mask=ellipse&fm=png",
                      "https://assets.imgix.net/examples/mountain.jpg?auto=compress&w=600&h=600&fit=crop&mask=ellipse&fm=png",
                      "https://assets.imgix.net/unsplash/umbrella.jpg?auto=compress&w=900&h=600&fit=crop&crop=focalpoint&fp-debug=1",
                      "https://assets.imgix.net/examples/bluehat.jpg?auto=compress&w=900&h=600&fit=crop&crop=focalpoint&fp-debug=1"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GallaryCell") as? GallaryCell else {
            return UITableViewCell()
        }
        
        cell.setup(url: dataSource[indexPath.row])
        return cell
    }
}
