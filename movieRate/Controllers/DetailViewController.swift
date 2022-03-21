//
//  DetailViewController.swift
//  PrographyQuest
//
//  Created by 이범준 on 2022/02/10.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    var name: String?
    var rate: Double?
    var imageUrl: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        let url = URL(string: imageUrl!)
        do {
            let data = try Data(contentsOf: url!)
            movieImage.image = UIImage(data: data)
        }
        catch {
            
        }
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        movieName.text = name
        if let transferRate = rate {
            let stringOfRate = String(transferRate)
            movieRate.text = stringOfRate
        }
    }

    
    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

