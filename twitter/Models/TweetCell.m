//
//  TweetCell.m
//  twitter
//
//  Created by Nihal Riyadh Jemal on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetCell

-(void)configureCell:(Tweet *)tweet {
 
    self.TweetLabel.text = tweet.text;
    self.UsernameLabel.text = tweet.user.name;
    self.ScreenName.text =tweet.user.screenName;
    self.CreatedAt.text =tweet.createdAtString;
    self.RetweetCount.text = [NSString stringWithFormat:@"%d", tweet.retweetCount ];
    self.FavoriteCount.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    
    NSString *fullPicURLString = tweet.user.url;
    NSURL *picURL = [NSURL URLWithString:fullPicURLString];
    self.ProfilePic.image = nil;
    [self.ProfilePic setImageWithURL:picURL];
}

-(void) refeshData{
   self.FavoriteCount.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
   self.RetweetCount.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
}

- (IBAction)didTypeLike:(id)sender {
    self.tweet.favorited = YES;
    self.tweet.favoriteCount += 1;
    [self refeshData];
    
}

@end
