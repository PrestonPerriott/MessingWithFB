//
//  ViewController.h
//  FittedImages
//
//  Created by Preston Perriott on 5/14/15.
//  Copyright (c) 2015 Preston Perriott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>    //Used for audi and video I believe - needed for AVPlayer
#import <MediaPlayer/MediaPlayer.h>




@interface ViewController : UIViewController
@property (strong, nonatomic) AVPlayerLayer *playerLayer;

//@ property (nonatomic, strong) UITextField *textField;



@end

