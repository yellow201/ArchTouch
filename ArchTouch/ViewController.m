//
//  ViewController.m
//  ArchTouch
//
//  Created by Luis alberto Torres on 08/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static NSString* const reuseIdentifier = @"customcellview";
static NSString* const imagesurl = @"https://image.tmdb.org/t/p/w500/";

bool isFiltered = NO;
const int icon_corner_radius = 10;


#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.moviesTableView.delegate = self;
    self.moviesTableView.dataSource = self;
    self.searchBar.delegate = self;
    
    //Register custom table view cell
    [self.moviesTableView registerNib:[UINib nibWithNibName:@"CustomMovieTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self reloadMovieData];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.searchBar resignFirstResponder];
}

#pragma mark - UITableView delegate and data source methods
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Check for the proper data according to the search criteria (if any)
    if(isFiltered == NO){
        return self.moviesList.count;
    }else{
        return self.filteredTableData.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomMovieTableCell* cell = (CustomMovieTableCell*)[tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"movieDetails" sender:cell];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomMovieTableCell *cell = (CustomMovieTableCell *) [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Movie* movie;
    
    //Search flag - Used for the UISearchBar
    if(isFiltered == NO){
        movie = [self.moviesList objectAtIndex:indexPath.row];
    }else{
        movie = [self.filteredTableData objectAtIndex:indexPath.row];
    }
    
    NSString* poster_path = @" ";
    cell.nameLbl.lineBreakMode = NSLineBreakByWordWrapping;
    cell.nameLbl.numberOfLines = 0;
    
    // JSON DATA CHECK - DATA ERROR VALIDATION
    if(![movie.imageURL isEqual:[NSNull null]] && movie.imageURL.length != 0){
        poster_path = [imagesurl stringByAppendingString:[movie imageURL]];
    }
    
    if( ![movie.name isEqual:[NSNull null]] && movie.name != nil){
        [cell.nameLbl setText:movie.name];
    }else{
        [cell.nameLbl setText:@"N/A"];
    }
    
    if( ![movie.overview isEqual:[NSNull null]] && movie.overview != nil){
        cell.overview  = movie.overview;
    }else{
        cell.overview  = @"N/A";
    }
    
    if( ![movie.date isEqual:[NSNull null]] && movie.date != nil){
        [cell.dateLbl setText:movie.date];
    }else{
        [cell.dateLbl setText:@"N/A"];
    }
    
    //CustomCell round corners
    cell.imageView.layer.cornerRadius = icon_corner_radius;
    cell.imageView.clipsToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //Downloads and shows the icon image asynchronously
    [cell.imageView sd_setImageWithURL: [NSURL URLWithString: poster_path]
                placeholderImage:[UIImage imageNamed:@"photo_not_available"]];
    
    return cell;
}

#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"movieDetails"]){
        MovieDetailsViewController *vc = [segue destinationViewController];
        [vc setTitleT: ((CustomMovieTableCell*) sender).nameLbl.text];
        [vc setReleaseDate:((CustomMovieTableCell*) sender).dateLbl.text];
        [vc setPosterImage:((CustomMovieTableCell*) sender).imageView.image];
        [vc setOverview:((CustomMovieTableCell*) sender).overview];
    }
}

#pragma mark - Network related methods
/*
 * Downloads the movie list data and reloads the UItableView data
 *
 */
-(void)reloadMovieData{
    DownloadMovieDataManager *manager = [[DownloadMovieDataManager alloc]init];
    [manager getMovieDataWithHanlder:^(NSArray *moviesArr, NSError *error){
        self.moviesList = moviesArr;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.moviesTableView reloadData];
        });

    }];
}

#pragma mark - Search bar delegate methods
-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text{
    if(text.length == 0){
        isFiltered = FALSE;
        [searchBar resignFirstResponder];
    }else{
        isFiltered = true;
        self.filteredTableData = [[NSMutableArray alloc] init];
        
        for (Movie* movie in self.moviesList){
            NSRange nameRange = [movie.name rangeOfString:text options:NSCaseInsensitiveSearch];
            NSRange descriptionRange = [movie.description rangeOfString:text options:NSCaseInsensitiveSearch];
            
            if(nameRange.location != NSNotFound || descriptionRange.location != NSNotFound){
                [self.filteredTableData addObject:movie];
            }
        }
    }
    [self.moviesTableView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

@end
