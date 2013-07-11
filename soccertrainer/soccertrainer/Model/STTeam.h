//
//  STTeam.h
//  soccertrainer
//
//  Created by Edgar Nunez on 7/11/13.
//  Copyright (c) 2013 Edgar Nunez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STTeam : NSObject

@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSMutableArray *teamPlayers;

@end
