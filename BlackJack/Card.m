//
//  Card.m
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "Card.h"

@implementation Card
-(instancetype)init
{
    self = [super init];
    if(self){
        _type = arc4random_uniform(12);
        _style=arc4random_uniform(4);
    }
    return self;
}
-(NSString *)suit{
    switch(_style){
        case Hearts:
            return @"Hearts";
            break;
        case Diamonds:
            return @"Diamonds";
            break;
        case Clubs:
            return @"Clubs";
            break;
        case Spades:
            return @"Spades";
            break;
    }
}
-(NSString *)name{
    switch(_type){
            
        case CardType2:
            return @"2";
            break;
        case CardType3:
            return @"3";
            break;
        case CardType4:
            return @"4";
            break;
        case CardType5:
            return @"5";
            break;
        case CardType6:
            return @"6";
            break;
        case CardType7:
            return @"7";
            break;
        case CardType8:
            return @"8";
            break;
        case CardType9:
            return @"9";
            break;
        case CardType10:
            return @"10";
            break;
        case CardTypeJ:
            return @"Jacke";
            break;
        case CardTypeQ:
            return @"Quin";
            break;
        case CardTypeK:
            return @"Keng";
            break;
        case CardTypeA:
            return @"Asse";
            break;
    }
    
}
-(BOOL)isAce{
    return _type==CardTypeA;
}

-(NSInteger)score{
    switch (_type){
            
        case CardType2:
            return 2;
            break;
        case CardType3:
            return 3;
            break;
        case CardType4:
            return 4;
            break;
        case CardType5:
            return 5;
            break;
        case CardType6:
            return 6;
            break;
        case CardType7:
            return 7;
            break;
        case CardType8:
            return 8;
            break;
        case CardType9:
            return 9;
            break;
        case CardType10:
            return 10;
            break;
        case CardTypeJ:
            return 10;
            break;
        case CardTypeQ:
            return 10;
            break;
        case CardTypeK:
            return 10;
            break;
        case CardTypeA:
            return 11;
            break;
    }
    
}



@end
