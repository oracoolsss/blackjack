//
//  Game.m
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "Game.h"
#import"Card.h"
#import "NSArray+Card.h"
/*
 @interface Game ()//расширение
 -(NSInteger)calcScore:(NSArray*)arr;
 -(NSString*)getCardNames:(NSArray*)cards;
 @end*/

@implementation Game
-(instancetype)init{
    self=[super init];
    if(self){
        _myCards=[NSMutableArray new];
        _dealerCards=[NSMutableArray new];
    }
    return self;
}
-(void)startGame{
    for(NSUInteger i = 0; i < 2; i++) {
        Card *card = [[Card alloc]init];
        while([self isCardUsed:card]) {
            card = [[Card alloc]init];
        }
        [self.myCards addObject:card];
        [self.usedCrads addObject:card];
        
    }
    
    Card *card = [[Card alloc]init];
    while([self isCardUsed:card]) {
        card = [[Card alloc]init];
    }
    [self.dealerCards addObject:card];
    [self.usedCrads addObject:card];
    
    [self printMy];
    [self printDealer];
}

-(void)hitMe{
    Card *card = [[Card alloc]init];
    while([self isCardUsed:card]) {
        card = [[Card alloc]init];
    }
    [self.myCards addObject:card];
    [self.usedCrads addObject:card];
}



-(BOOL)hitDealer{
    NSInteger  dealerScore=[self.dealerCards calcScore];
    if(dealerScore>=17)return NO;
    
    Card *card = [[Card alloc]init];
    while([self isCardUsed:card]) {
        card = [[Card alloc]init];
    }
    [self.dealerCards addObject:card];
    [self.usedCrads addObject:card];
    
    return YES;
}

-(BOOL) iHaveBlackJack{
    NSInteger  myScore=[self.myCards calcScore];
    if(myScore==21)return YES;
    return NO;
    
}
-(BOOL) dealerHasBlackJack{
    NSInteger  dealerScore=[self.dealerCards calcScore];
    if(dealerScore==21)return YES;
    return NO;
}
-(BOOL) iHaveMore{
    NSInteger  myScore=[self.myCards calcScore];
    return myScore>21;
}
-(BOOL) dealerHasMore{
    NSInteger  dScore=[self.dealerCards calcScore];
    return dScore>21;
}

-(BOOL)scoreEqual{
    NSInteger  myScore=[self.myCards calcScore];
    NSInteger  dScore=[self.dealerCards calcScore];
    return myScore==dScore;
}
-(BOOL)iHaveHigherScore{
    NSInteger  myScore=[self.myCards calcScore];
    NSInteger  dScore=[self.dealerCards calcScore];
    return myScore>dScore;
}



-(void)printMy{
    NSLog(@"I have: %@",[self.myCards getCardNames]);
}
-(void)printDealer{
    NSLog(@"Dealer has: %@",[self.dealerCards getCardNames]);
}

-(BOOL)isCardUsed: (Card*) card{
    for(Card *usedCard in _usedCrads) {
        if(usedCard.style == card.style && usedCard.type == card.type) {
            return YES;
        }
    }
    return NO;
}

@end
