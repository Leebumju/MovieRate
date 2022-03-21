//
//  MovieCell.swift
//  PrographyQuest
//
//  Created by 이범준 on 2022/02/08.
//

import UIKit

class MovieCell: UITableViewCell {
    //MARK: MovieCell Custom
    var movieNameDisplay: Movie?
    var limit: Double = 0.0
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var moveRate: UILabel!
    
    func displayMovieName(movie: Movie, minimum_rating: Double) {
        
        movieNameDisplay = movie
        
        if let existRate = movieNameDisplay?.rating {
            limit = existRate
        }
        
        if limit >= minimum_rating {
            movieName.text = movieNameDisplay!.title
            moveRate.text = String(limit)
        } else {
            movieNameDisplay = nil
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
