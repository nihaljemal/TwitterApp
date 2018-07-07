//
//  TweetCell.m
//  twitter
//
//  Created by Nihal Riyadh Jemal on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@implementation TweetCell

-(void)configureCell:(Tweet *)tweet {
    self.tweet = tweet;
    self.TweetLabel.text = tweet.text;
    self.UsernameLabel.text = tweet.user.name;
    self.ScreenName.text =tweet.user.screenName;
    self.CreatedAt.text =tweet.createdAtString;
    self.RetweetCount.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    self.FavoriteCount.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    //NSLog(@"%d", tweet.favoriteCount);
    NSString *fullPicURLString = tweet.user.url;
    NSURL *picURL = [NSURL URLWithString:fullPicURLString];
    self.ProfilePic.image = nil;
    [self.ProfilePic setImageWithURL:picURL];
    
    if(self.tweet.favorited){
        self.LikeButton.selected = YES;
    }
    else{
        self.LikeButton.selected = NO;
    }
    
    if(self.tweet.retweeted){
        self.RetweetButton.selected = YES;
    }
    else{
        self.RetweetButton.selected = NO;
    }
}

-(void) refeshData{
   self.FavoriteCount.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
   self.RetweetCount.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
}

- (IBAction)didTypeLike:(id)sender  {
    
    if(self.LikeButton.selected){
        self.LikeButton.selected = NO;
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
         [self refeshData];
        
    }
    else{
        self.LikeButton.selected = YES;
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
         [self refeshData];
    }
   //[self refeshData];
    
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             [self refeshData];
            
        }
    }];
    
}
- (IBAction)didTypeRetweet:(id)sender {
    
    if(self.RetweetButton.selected){
        self.RetweetButton.selected = NO;
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [self refeshData];
        
    }
    else{
        self.RetweetButton.selected = YES;
        self.tweet.retweeted= YES;
        self.tweet.retweetCount += 1;
        [self refeshData];
    }
   // [self refeshData];
    
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            
        }
    }];
}

@end
