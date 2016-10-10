//
//  CustomMovieTableCell.h
//  ArchTouch
//
//  Created by Luis alberto Torres on 08/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomMovieTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* nameLbl;
@property (weak, nonatomic) IBOutlet UILabel* genereLbl;
@property (weak, nonatomic) IBOutlet UILabel* dateLbl;
@property (weak, nonatomic) IBOutlet UIImageView* imageView;

@property (strong, nonatomic) NSString* overview;


@end
