//
//  DownloadMovieDataManager.m
//  ArchTouch
//
//  Created by Luis alberto Torres on 08/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import "DownloadMovieDataManager.h"


@implementation DownloadMovieDataManager

static int const maxNumberOfMovies = 50;


#pragma mark - GET response methods

/*
 * get the list of movies bases on the web API
 */
-(void)getMovieDataWithHanlder:(void(^)(NSArray *movies, NSError *error))handler{
    NSURL *requestURL = [[NSURL alloc] initWithString:GET_MOVIES_URL];
    NSURLSession* session = [NSURLSession sharedSession];
    
    //Response handling and JSON parsing
    [[session dataTaskWithURL:requestURL
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                NSMutableArray *movies = [[NSMutableArray alloc]init];
                
                if(!error){
                    NSDictionary *movieDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                    NSDictionary* mDict = [movieDict objectForKey:@"results"];
                    int maxMovieIndex = 0;
                    
                    for (NSDictionary *movieDict in mDict){
                        if(maxMovieIndex >= maxNumberOfMovies){ //Take only the first 'maxNumberOfMovies'
                            break;
                        }
                        
                        Movie *movie = [[Movie alloc]initWithName:[movieDict objectForKey:@"title"] overview:[movieDict objectForKey:@"overview"] genre:[movieDict objectForKey:@"title"] releaseDate:[movieDict objectForKey:@"release_date"] andImageURL:[movieDict objectForKey:@"poster_path"]];
                        
                        maxMovieIndex++;
                        [movies addObject:movie];
                    }
                    
                    NSArray *sortedMoviesArray = [self getSortedMoviesByDate:movies];
                    handler(sortedMoviesArray, error); //Array of Movies with possible error
                    
                }else{
                    NSLog(@"Error getting data, %@", [error localizedDescription]);
                }
            }]
     resume];
}

#pragma mark - auxiliar methods

/*
 *Sorts the movile list by release date
 *
 */
-(NSArray*) getSortedMoviesByDate:(NSMutableArray* )movies{
    NSArray *sortedMoviesArray = [movies sortedArrayUsingComparator:
                                  ^(id obj1, id obj2) {
                                      Movie* m1 = obj1;
                                      Movie* m2 = obj2;
                                      
                                      return [m1.date compare:m2.date];
                                  }];
    
    return sortedMoviesArray;
}

@end
