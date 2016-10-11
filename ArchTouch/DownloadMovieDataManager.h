//
//  DownloadMovieDataManager.h
//  ArchTouch
//
//  Created by Luis alberto Torres on 08/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface DownloadMovieDataManager : NSObject


-(void)getMovieDataWithHanlder:(void(^)(NSArray *movies, NSError *error))handler;
-(NSArray*) getSortedMoviesByDate:(NSMutableArray* )movies;


@end
