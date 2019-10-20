//
//  Card.h
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,CardStyle){
    Hearts,
    Diamonds,
    Clubs,
    Spades
};

typedef NS_ENUM(NSInteger,CardType){
    CardType2,
    CardType3,
    CardType4,
    CardType5,
    CardType6,
    CardType7,
    CardType8,
    CardType9,
    CardType10,
    CardTypeJ,
    CardTypeQ,
    CardTypeK,
    CardTypeA
};

@interface Card : NSObject
@property(nonatomic,assign)CardType type;
@property(nonatomic,assign)CardStyle style;

-(NSString *) name;
-(NSString *) suit;
-(NSInteger) score;
-(BOOL) isAce;
@end

NS_ASSUME_NONNULL_END
