//
//  MovieDetailsViewController.h
//  ArchTouch
//
//  Created by Luis alberto Torres on 09/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UITextView *overviewTextView;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLbl;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@property (strong, nonatomic) NSString *titleT;
@property (strong, nonatomic) NSString *releaseDate;
@property (strong, nonatomic) NSString *overview;
@property (strong, nonatomic) UIImage *posterImage;


@end
