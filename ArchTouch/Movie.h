//
//  Movie.h
//  ArchTouch
//
//  Created by Luis alberto Torres on 08/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *overview;

-(id)initWithName:(NSString *)movieName overview:(NSString*)overviewM genre:(NSString *)movieGenre releaseDate:(NSString *)movieDate andImageURL:(NSString* )url;

@end
