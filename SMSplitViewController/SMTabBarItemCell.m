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
        //self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _iconView = [[[UIImageView alloc] init] autorelease];
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
    
    _iconView.frame = CGRectMake(0, 0, 70, 70);
    _titleLabel.frame = CGRectMake(0, CGRectGetMaxY(_iconView.frame), self.bounds.size.height, 11);
}

@end
