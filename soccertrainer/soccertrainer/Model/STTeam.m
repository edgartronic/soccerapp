//
//  STTeam.m
//  soccertrainer
//
//  Created by Edgar Nunez on 7/11/13.
//  Copyright (c) 2013 Edgar Nunez. All rights reserved.
//

#import "STTeam.h"
#import "STPlayer.h"

@implementation STTeam

@synthesize teamName, teamPlayers;

- (id) init {
    if (self == [super init]) {
        self.teamPlayers = [NSMutableArray array];
    }
    return self;
}

- (void) loadTeamWithName: (NSString *) _teamName {

    PFQuery *teamQuery = [PFQuery queryWithClassName: TEAM];
    [teamQuery whereKey: TEAM_NAME equalTo: _teamName];
    [teamQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (objects.count == 1) {
            PFObject *teamObj = [objects objectAtIndex: 0];
            self.teamName = [teamObj objectForKey: TEAM_NAME];
            NSLog(@"Team %@ found", self.teamName);
            PFQuery *playerQuery = [PFQuery queryWithClassName: PLAYER];
            [playerQuery whereKey: @"parent" equalTo: teamObj];
            [playerQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (objects.count > 1) {
                    NSLog(@"%i players associated with %@", objects.count, self.teamName);
                    for (PFObject *object in objects) {
                        STPlayer *player = [STPlayer new];
                        player.playerNameFull = [object valueForKey: PLAYER_NAME_FULL];
                        [self.teamPlayers addObject: player];
                        NSLog(@"Player %@ added to team %@", player.playerNameFull, self.teamName);
                    }
                }
            }];
        }
    }];
}

- (void) saveTeam {
    PFObject *teamObj = [PFObject objectWithClassName: TEAM];
    [teamObj setObject: self.teamName forKey: TEAM_NAME];
    for (STPlayer *player in self.teamPlayers) {
        player.parentObject = teamObj;
        [player savePlayer];
    }
    [teamObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Team %@ saved successfully!", self.teamName);
        } else {
            NSLog(@"ERROR: %@", error.localizedDescription);
        }
    }];
}

@end
