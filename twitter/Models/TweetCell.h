//
//  TweetCell.h
//  twitter
//
//  Created by Nihal Riyadh Jemal on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *UsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *TweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *ScreenName;
@property (weak, nonatomic) IBOutlet UILabel *CreatedAt;

@property (weak, nonatomic) IBOutlet UILabel *RetweetCount;
@property (weak, nonatomic) IBOutlet UILabel *FavoriteCount;
@property (weak, nonatomic) IBOutlet UIButton *LikeButton;
@property (weak, nonatomic) IBOutlet UIButton *RetweetButton;

@property (strong, nonatomic) Tweet *tweet;

-(void)configureCell:(Tweet *)tweet;

-(void) refeshData;

@end
