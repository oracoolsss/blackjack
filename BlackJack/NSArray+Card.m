//
//  NSArray+Card.m
//  BlackJack
//
//  Created by User on 17/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "NSArray+Card.h"
#import "Card.h"
@implementation NSArray (Card)

-(NSString*)getCardNames{
    NSMutableString *cardNames=[[NSMutableString alloc]init];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Card * card = obj;//будет вызвана ко всем элементам массива
        [cardNames appendString:[card name]];
        [cardNames appendString:@" of "];
        [cardNames appendString:[card suit]];
        [cardNames appendString:@", "];
    }];
    return cardNames;
}
-(NSInteger)calcScore{
    __block NSInteger score=0,aceCount=0;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Card * card = obj;
        score+=[card score];
        if([card isAce])aceCount++;
    }];
    while(score>21&&aceCount>0){
        aceCount--;
        score-=10;
    }
    return score;
}
/*
 -(NSInteger)calcScore{
 NSInteger score=0,aceCount=0;
 for (Card* card in self){
 score+=[card score];
 if([card isAce])aceCount++;
 }
 while(score>21&&aceCount>0){
 aceCount--;
 score-=10;
 }
 return score;
 }*/
@end

