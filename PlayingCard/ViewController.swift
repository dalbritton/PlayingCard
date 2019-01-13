//
//  ViewController.swift
//  PlayingCard
//
//  Created by davida on 1/11/19.
//  Copyright © 2019 davida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    @IBOutlet weak var playingCardView: PlayingCardView! {
    //        didSet {
    //            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.pan(recognizer:))
    //            )
    //            playingCardView.addGestureRecognizer(panGestureRecognizer)
    //        }
    //    }
    //
    //    @objc func pan(recognizer: UIPanGestureRecognizer) {
    //        switch recognizer.state {
    //        case .changed: fallthrough
    //        case .ended:
    //            let translation = recognizer.translation(in: playingCardView)
    //            //update anything that depends on the pan gesture using translation .x and .y
    //            recognizer.setTranslation(CGPoint.zero, in: playingCardView)
    //        default: break
    //        }
    //    }
    
    //    @IBOutlet weak var playingCardView: PlayingCardView! {
    //        didSet {
    //            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(recognizer:))
    //            )
    //            playingCardView.addGestureRecognizer(tapGestureRecognizer)
    //        }
    //    }
    //
    //    @objc func tap(recognizer: UITapGestureRecognizer) {
    //        switch recognizer.state {
    //        case .changed: fallthrough
    //        default: break
    //        }
    //    }
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(playingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @objc func nextCard(recognizer: UIGestureRecognizer) {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }

    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        playingCardView.isFaceUp = !playingCardView.isFaceUp
    }
}

