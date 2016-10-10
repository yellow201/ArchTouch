//
//  CustomMovieTableCell.m
//  ArchTouch
//
//  Created by Luis alberto Torres on 08/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import "CustomMovieTableCell.h"

@implementation CustomMovieTableCell

@synthesize imageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
