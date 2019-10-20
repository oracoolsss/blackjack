
//
//  Game.h
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject
@property NSMutableArray * myCards;
@property NSMutableArray * dealerCards;
@property NSMutableArray * usedCrads;

-(void) startGame;

-(void) hitMe;
-(BOOL) hitDealer;

-(BOOL) iHaveBlackJack;
-(BOOL) dealerHasBlackJack;

-(BOOL) iHaveMore;
-(BOOL) dealerHasMore;

-(BOOL)scoreEqual;
-(BOOL)iHaveHigherScore;

-(void)printMy;
-(void)printDealer;

-(BOOL) isCardUsed: (Card*) card;

@end

NS_ASSUME_NONNULL_END
