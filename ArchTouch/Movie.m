//
//  Movie.m
//  ArchTouch
//
//  Created by Luis alberto Torres on 08/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(id)initWithName:(NSString *)movieName overview:(NSString*)overviewM genre:(NSString *)movieGenre releaseDate:(NSString *)movieDate andImageURL:(NSString* )url{
    self = [super init];
    
    if(self){
        self.name = movieName;
        self.genre = movieGenre;
        self.date = movieDate;
        self.imageURL = url;
        self.overview = overviewM;
    }
    
    return self;
}

@end
