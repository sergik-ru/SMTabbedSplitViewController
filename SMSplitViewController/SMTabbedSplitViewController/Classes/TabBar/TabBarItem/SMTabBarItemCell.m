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
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        
        _selectedColor = [[UIColor colorWithWhite:0.85f alpha:1.0f] retain];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _iconView.frame = CGRectMake(self.bounds.size.width / 2 - 54 / 2, - 6, 54, 54);
    _titleLabel.frame = CGRectMake(0, self.bounds.size.height - 20, self.bounds.size.width, 12);
    
    if (_separator)
        _separator.frame = CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width, 1);
}

#pragma mark -
#pragma mark - Properties

- (void)setImage:(UIImage *)image {
    
    _image = [image retain];
}

- (void)setIsFirstCell:(BOOL)isFirstCell {
    
    _isFirstCell = isFirstCell;
    
    if (isFirstCell) {
        
        _topSeparator = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 1)] autorelease];
        _topSeparator.backgroundColor = [UIColor blackColor];
        [self addSubview:_topSeparator];
    }
}

- (void)setCellType:(SMTabBarItemCellType)cellType {
    
    _cellType = cellType;
    
    if (_cellType == SMTabBarItemCellTab) {
        
        _separator = [[[UIView alloc] init] autorelease];
        _separator.backgroundColor = [UIColor blackColor];
        [self addSubview:_separator];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    _titleLabel.textColor = highlighted ? [UIColor whiteColor] : [UIColor blackColor];
    
    if (_cellType == SMTabBarItemCellTab) {
        
        _viewBackground = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 1)] autorelease];
        _viewBackground.backgroundColor = highlighted ? _selectedColor : [UIColor clearColor];
        self.backgroundView = _viewBackground;
        
        if (_isFirstCell) {
            
            _topSeparator.hidden = highlighted ? YES : NO;
        }
    }
    
    _iconView.image = highlighted ? _selectedImage : _image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    _titleLabel.textColor = selected ? [UIColor whiteColor] : [UIColor blackColor];
    
    if (_cellType == SMTabBarItemCellTab) {
        
        _viewBackground.backgroundColor = selected ? _selectedColor : [UIColor clearColor];
    }
    
    if (_isFirstCell) {
        
        _topSeparator.hidden = selected ? YES : NO;
    }
    
    _iconView.image = selected ? _selectedImage : _image;
}

- (void)dealloc {
    
    [_image release];
    [_selectedImage release];
    [_selectedColor release];
    [_actionBlock release];
    
    [super dealloc];
}

@end