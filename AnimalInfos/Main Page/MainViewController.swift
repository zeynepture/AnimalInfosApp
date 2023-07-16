//
//  MainViewController.swift
//  AnimalInfos
//
//  Created by Zeynep on 15.07.2023.
//

import UIKit
import AVKit
import AVFoundation
class MainViewController: UIViewController {
   
    @IBOutlet weak var cheetahView: BoxView!
    @IBOutlet weak var elephantView: BoxView!
    @IBOutlet weak var giraffeView: BoxView!
    @IBOutlet weak var gorillaView: BoxView!
    @IBOutlet weak var hippoView: BoxView!
    @IBOutlet weak var lionView: BoxView!
    @IBOutlet weak var ostrichView: BoxView!
    @IBOutlet weak var zebraView: BoxView!
    
    
    @IBOutlet weak var cheetahImage: UIImageView!
    @IBOutlet weak var elephantImage: UIImageView!
    @IBOutlet weak var giraffeImage: UIImageView!
    @IBOutlet weak var gorillaImage: UIImageView!
    @IBOutlet weak var hippoImage: UIImageView!
    @IBOutlet weak var lionImage: UIImageView!
    @IBOutlet weak var ostrichImage: UIImageView!
    @IBOutlet weak var zebraImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animals 🐆🦧🦒🐘🦏🦁🦓 "
        setupMyViews()
        
    }
    
    private func setupMyViews() {
        cheetahView.webLink = "https://en.wikipedia.org/wiki/Cheetah"
        giraffeView.webLink = "https://en.wikipedia.org/wiki/Giraffe"
        gorillaView.webLink = "https://en.wikipedia.org/wiki/Gorilla"
        hippoView.webLink = "https://en.wikipedia.org/wiki/Hippopotamus"
        lionView.webLink = "https://en.wikipedia.org/wiki/Lion"
        zebraView.webLink = "https://en.wikipedia.org/wiki/Zebra"
        ostrichView.webLink = "https://en.wikipedia.org/wiki/Common_ostrich"
        elephantView.webLink = "https://en.wikipedia.org/wiki/Elephant"
        cheetahView.gotoLinkAction = routeWebVC()
        giraffeView.gotoLinkAction = routeWebVC()
        gorillaView.gotoLinkAction = routeWebVC()
        hippoView.gotoLinkAction = routeWebVC()
        lionView.gotoLinkAction = routeWebVC()
        zebraView.gotoLinkAction = routeWebVC()
        ostrichView.gotoLinkAction = routeWebVC()
        elephantView.gotoLinkAction = routeWebVC()
        
        cheetahView.gotoVideoAction = {
            self.playVideo("cheetah")
        }
        elephantView.gotoVideoAction = {
            self.playVideo("elephant")
        }
        giraffeView.gotoVideoAction = {
            self.playVideo("giraffe")
        }
        gorillaView.gotoVideoAction = {
            self.playVideo("gorilla")
        }
        hippoView.gotoVideoAction = {
            self.playVideo("hippo")
        }
        lionView.gotoVideoAction = {
            self.playVideo("lion")
        }
        ostrichView.gotoVideoAction = {
            self.playVideo("ostrich")
        }
        zebraView.gotoVideoAction = {
            self.playVideo("zebra")
        }
    }
    
    func routeWebVC() -> (String) -> () {
        return { urlString in
            let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
            if let webVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
                webVC.urlString = urlString
                self.navigationController?.pushViewController(webVC, animated: true)
            }
        }
    }
    
    func playVideo(_ videoPath: String) {
        if let path = Bundle.main.path(forResource: videoPath, ofType: "mp4") {
            let player = AVPlayer(url: URL(filePath: path))
            let playerControl = AVPlayerViewController()
            playerControl.player = player
            self.present(playerControl, animated: true) {
                player.play()
            }
        }
    }
    
}




