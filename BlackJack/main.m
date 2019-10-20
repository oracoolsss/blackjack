
//  main.m
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright � 2019 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

NSString * question() {
    NSLog(@"Do you want to play a game? (print yes or no)");
    NSFileHandle * input = NSFileHandle.fileHandleWithStandardInput;
    NSData * data = input.availableData;
    return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
            stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
    
}

NSString * getInput() {
    NSLog(@"take card?");
    NSFileHandle * input = NSFileHandle.fileHandleWithStandardInput;
    NSData * data = input.availableData;
    return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
            stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
}

NSInteger * play() {
    @autoreleasepool {
        Game *game = [Game new];
        [game startGame];
        if([game iHaveBlackJack] == YES){
            NSLog(@"BlackJack!\nYou won");
            return 0;
        }
        
        NSLog(@"'hit me' to take card 'stop' to stop");
        while(![game iHaveMore] && ![game iHaveBlackJack] && [getInput() isEqualToString:@"hit me"]){
            [game hitMe];
            [game printMy];
        }
        
        if([game iHaveMore]){
            NSLog(@"You have more than 21\n Dealer won");
            return 0;
        }
        
        while([game hitDealer]){
            [game printDealer];
        }
        
        if([game dealerHasMore]){
            NSLog(@"Dealer has more than 21\n You won");
            return 0;
        }
        
        if([game scoreEqual]){
            NSLog(@"Equal score\n Dealer won");
            return 0;
        }
        
        if([game iHaveHigherScore]){
            NSLog(@"You have higher score\n You won");
        } else{
            NSLog(@"Dealer has higher score\n Dealer won");
        }
        
    }
    return 0;}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while([question() isEqualToString:@"yes"]) {
            play();
        }
        NSLog(@"Good luck!");
    }
    return 0;
}
