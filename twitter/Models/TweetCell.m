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
    
    
    
    NSString *fullPicURLString = tweet.user.url;
    NSURL *picURL = [NSURL URLWithString:fullPicURLString];
    self.ProfilePic.image = nil;
    [self.ProfilePic setImageWithURL:picURL];
}

@end
