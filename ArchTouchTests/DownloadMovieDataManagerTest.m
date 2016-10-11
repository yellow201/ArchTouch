//
//  DownloadMovieDataManagerTest.m
//  ArchTouch
//
//  Created by Luis Alberto Torres Virues on 11/10/16.
//  Copyright © 2016 Luis Torres. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DownloadMovieDataManager.h"
#import "Movie.h"

@interface DownloadMovieDataManagerTest : XCTestCase

@end

@implementation DownloadMovieDataManagerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testOrderMoviesByDate{
    Movie* mov = [[Movie alloc]initWithName:@"Movie1" overview:@"This is a test" genre:@"Test" releaseDate:@"2016-01-23"andImageURL:@"URL"];
    Movie* mov2 = [[Movie alloc]initWithName:@"Movie2" overview:@"This is a test" genre:@"Test" releaseDate:@"2016-01-20"andImageURL:@"URL"];
    Movie* mov3 = [[Movie alloc]initWithName:@"Movie3" overview:@"This is a test" genre:@"Test" releaseDate:@"2015-11-2016"andImageURL:@"URL"];
    
    
    NSMutableArray* moviesArr = [[NSMutableArray alloc]init];
    [moviesArr addObject:mov3];
    [moviesArr addObject:mov];
    [moviesArr addObject:mov2];
    
    NSMutableArray* moviesArrExpected = [[NSMutableArray alloc]init];
    [moviesArrExpected addObject:mov3];
    [moviesArrExpected addObject:mov];
    [moviesArrExpected addObject:mov2];
    
    XCTAssertEqualObjects(moviesArr, moviesArrExpected, @"The reversed array did not match the expected result");
}

@end