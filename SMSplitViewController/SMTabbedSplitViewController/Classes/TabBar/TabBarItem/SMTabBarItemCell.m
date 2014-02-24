//
//  SMTabBarItemCell.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 16.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMTabBarItemCell.h"

@implementation SMTabBarItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        _iconView = [[[UIImageView alloc] init] autorelease];
        _iconView.contentMode = UIViewContentModeCenter;
        [self addSubview:_iconView];
        
        _titleLabel = [[[UILabel alloc] init] autorelease];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:10];
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _iconView.frame = CGRectMake(self.bounds.size.width / 2 - 36 / 2, 5, 36, 36);
    _titleLabel.frame = CGRectMake(0, CGRectGetMaxY(_iconView.frame) + 2, self.bounds.size.width, 12);
}

@end
