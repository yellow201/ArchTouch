//
//  MovieDetailsViewController.m
//  ArchTouch
//
//  Created by Luis alberto Torres on 09/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import "MovieDetailsViewController.h"

@interface MovieDetailsViewController ()

@end

@implementation MovieDetailsViewController

static int icon_corner_radius = 10;

#pragma marñ - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.posterImageView.layer.cornerRadius = icon_corner_radius;
    self.posterImageView.clipsToBounds = YES;
    self.overviewTextView.layer.cornerRadius = icon_corner_radius;
    self.posterImageView.image = self.posterImage;
    self.releaseDateLbl.text = self.releaseDate;
    self.titleLbl.text = self.titleT;
    self.overviewTextView.text = self.overview;
    self.navigationItem.title = self.titleT;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated{}


@end
