//
//  STPlayer.h
//  soccertrainer
//
//  Created by Edgar Nunez on 7/11/13.
//  Copyright (c) 2013 Edgar Nunez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    STPlayerPositionGoalie,
    STPlayerPositionCenterBack,
    STPlayerPositionLeftBack,
    STPlayerPositionRightBack,
    STPlayerPositionLeftMid,
    STPlayerPositionCenterMid,
    STPlayerPositionRightMid,
    STPlayerPositionForward,
    
} STPlayerPosition;

@interface STPlayer : NSObject

@property (nonatomic, strong) NSString *playerNameFirst;
@property (nonatomic, strong) NSString *playerNameLast;
@property (nonatomic, strong) NSNumber *playerAge;
@property (nonatomic, strong) NSString *playerAddressOne;
@property (nonatomic, strong) NSString *playerAddressTwo;
@property (nonatomic, strong) NSString *playerAddressCity;
@property (nonatomic, strong) NSString *playerAddressState;
@property (nonatomic, strong) NSString *playerAddressZip;
@property (nonatomic, strong) NSString *playerEmail;
@property (nonatomic, strong) NSString *playerPhone;
@property (nonatomic, strong) NSString *playerParentName;
@property (nonatomic, strong) UIImage *playerPhoto;
@property (nonatomic) STPlayerPosition *playerPosition;
@property (nonatomic) BOOL isActive;
@property (nonatomic) BOOL isPaid;
@property (nonatomic, strong) NSNumber *paymentAmount;
@property (nonatomic, strong) NSDate *paymentDate;

@end
