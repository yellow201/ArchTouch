//
//  ViewController.h
//  ArchTouch
//
//  Created by Luis alberto Torres on 08/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomMovieTableCell.h"
#import "DownloadMovieDataManager.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MovieDetailsViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *moviesTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray* moviesList;
@property (strong, nonatomic) NSMutableArray* filteredTableData;

@end

