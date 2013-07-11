//
//  STPlayer.m
//  soccertrainer
//
//  Created by Edgar Nunez on 7/11/13.
//  Copyright (c) 2013 Edgar Nunez. All rights reserved.
//

#import "STPlayer.h"

@implementation STPlayer

@synthesize playerNameFull, playerNameFirst, playerNameLast, playerAge, playerAddressOne, playerAddressTwo, playerAddressCity, playerAddressState, playerAddressZip, playerEmail, playerPhone, playerParentName, playerPhoto, playerPosition, paymentAmount, paymentDate;

- (void) loadPlayerWithName: (NSString *) playerName {
    PFQuery *playerQuery = [PFQuery queryWithClassName: PLAYER];
    [playerQuery whereKey: PLAYER_NAME_FULL equalTo: playerName];
    [playerQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (objects.count == 1) {
            PFObject *obj = [objects objectAtIndex: 0];
            self.playerNameFull = [obj objectForKey: PLAYER_NAME_FULL];
            self.playerNameFirst = [obj objectForKey: PLAYER_NAME_FIRST];
            self.playerNameLast = [obj objectForKey: PLAYER_NAME_LAST];
            self.playerAddressOne = [obj objectForKey: PLAYER_ADDRESS_ONE];
            self.playerAddressTwo = [obj objectForKey: PLAYER_ADDRESS_TWO];
            self.playerAddressCity = [obj objectForKey: PLAYER_ADDRESS_CITY];
            self.playerAddressState = [obj objectForKey: PLAYER_ADDRESS_STATE];
            self.playerAddressZip = [obj objectForKey: PLAYER_ADDRESS_ZIP];
            self.playerAge = [NSNumber numberWithInt: [[obj objectForKey: PLAYER_AGE] intValue]];
            self.playerEmail = [obj objectForKey: PLAYER_EMAIL];
            self.playerPhone = [obj objectForKey: PLAYER_PHONE];
            self.playerParentName = [obj objectForKey: PLAYER_PARENT_NAME];
            self.playerPosition = (STPlayerPosition *)[[obj objectForKey: PLAYER_POSITION] intValue];
            self.isActive = (BOOL)[[obj objectForKey: PLAYER_IS_ACTIVE] intValue];
            self.isPaid = (BOOL)[[obj objectForKey: PLAYER_IS_PAID] intValue];
            self.paymentAmount = [NSNumber numberWithFloat: [[obj objectForKey: PLAYER_PAYMENT_AMOUNT] floatValue]];
        } else {
            NSLog(@"error: %@", error.localizedDescription);
        }
    }];
}

- (void) savePlayer {
    PFObject *playerObj = [PFObject objectWithClassName: PLAYER];
    [playerObj setObject: self.playerNameFull forKey: PLAYER_NAME_FULL];
    [playerObj setObject: self.playerNameFirst forKey: PLAYER_NAME_FIRST];
    [playerObj setObject: self.playerNameLast forKey: PLAYER_NAME_LAST];
    [playerObj setObject: self.playerAddressOne forKey: PLAYER_ADDRESS_ONE];
    [playerObj setObject: self.playerAddressTwo forKey: PLAYER_ADDRESS_TWO];
    [playerObj setObject: self.playerAddressCity forKey: PLAYER_ADDRESS_CITY];
    [playerObj setObject: self.playerAddressState forKey: PLAYER_ADDRESS_STATE];
    [playerObj setObject: self.playerAddressZip forKey: PLAYER_ADDRESS_ZIP];
    [playerObj setObject: self.playerAge forKey: PLAYER_AGE];
    [playerObj setObject: self.playerEmail forKey: PLAYER_EMAIL];
    [playerObj setObject: self.playerPhone forKey: PLAYER_PHONE];
    [playerObj setObject: self.playerParentName forKey: PLAYER_PARENT_NAME];
    [playerObj setObject: [NSNumber numberWithInt: (int) self.playerPosition] forKey: PLAYER_POSITION];
    [playerObj setObject: [NSNumber numberWithInt: self.isPaid] forKey: PLAYER_IS_PAID];
    [playerObj setObject: self.paymentAmount forKey: PLAYER_PAYMENT_AMOUNT];
    
    [playerObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"save successful.");
        } else {
            NSLog(@"error: %@", error.localizedDescription);
        }
    }];
}

@end
