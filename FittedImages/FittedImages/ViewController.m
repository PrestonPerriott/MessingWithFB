//
//  ViewController.m
//  FittedImages
//
//  Created by Preston Perriott on 5/14/15.
//  Copyright (c) 2015 Preston Perriott. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "Validation.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#define commonY 117

@interface ViewController ()

@property (nonatomic, strong) UIAlertController *alert;

@end



@implementation ViewController

@synthesize alert;

//Gloabalizes textField
//@synthesize textField;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view.layer addSublayer:self.playerLayer];
    
    // loop movie
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(replayMovie:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    //Shdapes and things
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //Note, Origin is at top left corner so thats 0,0 
    CGPoint point1 = CGPointMake(20, 317);  //Remember x & y is right and down respectively
    CGPoint point2 = CGPointMake(100, commonY);
    CGPoint point3 = CGPointMake(200, 50);
    CGPoint controlPoint1 = CGPointMake(50, 260);
    CGPoint controlPoint2 = CGPointMake(20, commonY);
    CGPoint controlPoint3 = CGPointMake(200, commonY);
    CGPoint controlPoint4 = CGPointMake(250, 75);
  
   // CGPoint point4 = CGPointMake(<#CGFloat x#>, <#CGFloat y#>)
    
    [path setLineWidth:3.0];
    [path moveToPoint:point1];
    [path addCurveToPoint:point2 controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    [[UIColor blueColor] set];
    [path stroke];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
    shapeLayer.lineWidth = 3.0;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    shapeLayer.shadowRadius = 10;
    shapeLayer.shadowColor = [[UIColor blackColor] CGColor];
    shapeLayer.shadowOffset = CGSizeMake(3, 7);
    shapeLayer.shadowOpacity = 7;
    shapeLayer.borderColor = [[UIColor purpleColor] CGColor];
    shapeLayer.cornerRadius = 40;
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.5f;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:3.0f];
    pathAnimation.repeatCount = 10;
    pathAnimation.autoreverses = YES;
    [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    //Animate colorFill
   /* CABasicAnimation *fillColorAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    fillColorAnimation.duration = 1.5f;
    fillColorAnimation.fromValue = (id)[[UIColor clearColor] CGColor];
    fillColorAnimation.toValue = (id)[[UIColor blackColor] CGColor];
    fillColorAnimation.repeatCount = 15;
    fillColorAnimation.autoreverses = YES;
    [shapeLayer addAnimation:fillColorAnimation forKey:@"fillColor"];
    */
    
    //UIBezierPath *path1 = [UIBezierPath bezierPath];
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    
    [path2 setLineWidth:3.0];
    [path2 moveToPoint:point2];
    [path2 addCurveToPoint:point3 controlPoint1:controlPoint3 controlPoint2:controlPoint4];
    [[UIColor orangeColor] set];
    [path2 stroke];
    
    
    CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.path = [path2 CGPath];
    shapeLayer2.strokeColor = [[UIColor orangeColor] CGColor];
    shapeLayer2.lineWidth = 3.0;
    shapeLayer2.fillColor = [[UIColor clearColor] CGColor];
    shapeLayer2.shadowRadius = 10;
    shapeLayer2.shadowColor = [[UIColor blackColor] CGColor];
    shapeLayer2.shadowOffset = CGSizeMake(3, 7);
    shapeLayer2.shadowOpacity = 7;
    shapeLayer2.borderColor = [[UIColor purpleColor] CGColor];
    shapeLayer2.cornerRadius = 40;
    
    CABasicAnimation *pathAnimation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation2.duration = 1.5f;
    pathAnimation2.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation2.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation2.repeatCount = 10;
    pathAnimation2.autoreverses = YES;
    [shapeLayer2 addAnimation:pathAnimation2 forKey:@"strokeEnd"];
    
  /*  CABasicAnimation *fillColorAnimation2 = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    fillColorAnimation2.duration = 1.5f;
    fillColorAnimation2.fromValue = (id)[[UIColor clearColor] CGColor];
    fillColorAnimation2.toValue = (id)[[UIColor blackColor] CGColor];
    fillColorAnimation2.repeatCount = 15;
    fillColorAnimation2.autoreverses = YES;
    [shapeLayer2 addAnimation:fillColorAnimation forKey:@"fillColor"];
   */
    
    
    [self.view.layer addSublayer:shapeLayer2];
    
    
    [self.view.layer addSublayer:shapeLayer];
    
    //Refresh code for profile
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //Create an image pointer, initializes itself to fit the frame of the screen
    /*UIImageView *picView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    picView.image = [UIImage imageNamed:@"god_and_devil_playing_cards-wallpaper-1366x768.jpg"];
    [self.view addSubview:picView];
    [self.view sendSubviewToBack:picView];*/
    
    //*******Instead of the devil and god playing cards we will try to use a gradient view
    /*CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor grayColor] CGColor], (id)[[UIColor blackColor] CGColor], nil ];
    [self.view.layer insertSublayer:gradient atIndex:0];
    */
    
    
    self.title = NSLocalizedString(@"Login Page", nil);
    
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    //I believe the SWreveal view controller also works with the menu tabbar button
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStyleDone target:revealController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    
    //problem initiating, will have to fix to make blur effect work proper
    if (leftItem.tag == 1) {
        
        self.view.backgroundColor = [UIColor clearColor];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = self.view.bounds;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self.view addSubview:blurEffectView];
    }
    
   
    //Must create : IF lefttoggle is pressed -> then we show blur effect for other VC
    //***********
    //***********************************         *******************
    //********************* ********** 8*************
    //
    /***********************
    
    //Not going to use the right side item
   
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Right" style:UIBarButtonItemStyleDone target:revealController action:@selector(rightRevealToggle:)];
    self.navigationItem.rightBarButtonItem =  rightItem;
    */
    
    //Not working as it should for some reason
    self.navigationController.navigationBar.backgroundColor = [UIColor lightTextColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    self.navigationController.navigationBar.alpha = .07f;
    self.navigationController.navigationBar.translucent = YES;
    //Addds a cooler more smoth translucent effect
    [(UIView*)[self.navigationController.navigationBar.subviews objectAtIndex:0] setAlpha:0.7f];
    
    /*
    //Is the filter necessary if were using such dark colors?
    UIView * filter = [[UIView alloc] initWithFrame:self.view.frame];
    filter.backgroundColor = [UIColor clearColor];
    filter.alpha = 0.5;
    [self.view addSubview:filter];
     */
    
    //Many steps to create a pulsating button
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(50, 175, 25, 25);  //left/right, up/down, height, width
    //btn1.center = self.view.center;
    [btn1 setTitle:@"" forState:UIControlStateNormal];
    
    //Adds a sub view to the button, the size of the button
    UIView *c = [[UIView alloc] initWithFrame:btn1.bounds];
    c.backgroundColor = [UIColor blackColor];
    c.layer.cornerRadius = 12.5;
    [btn1 addSubview:c];
    [btn1 sendSubviewToBack:c];
    
    
    UIView *f = [[UIView alloc] initWithFrame:btn1.bounds];
    f.backgroundColor = [UIColor grayColor];
    f.layer.cornerRadius = 12.5;
    [btn1 addSubview:f];
    [btn1 sendSubviewToBack:f];
    //Sets the subviews interaction to No, so that the buttons can be pressed, automatically set to yes
    f.userInteractionEnabled = NO;
    c.userInteractionEnabled = NO;
   // filter.userInteractionEnabled = NO;
    
    
    
    //Creating the functionality of the pulsing movement
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = .5;
    pulseAnimation.toValue = [NSNumber numberWithFloat:1.1];
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulseAnimation.autoreverses = YES;
    pulseAnimation.repeatCount = MAXFLOAT;
    [c.layer addAnimation:pulseAnimation forKey:@"a"];
    [btn1.titleLabel.layer addAnimation:pulseAnimation forKey:@"a"];
    
    CABasicAnimation *fade = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fade.toValue = @0;
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.toValue =@2;
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[fade,pulse];
    group.duration = 2.0;
    group.repeatCount = MAXFLOAT;
    [f.layer addAnimation:group forKey:@"g"];
    
    [btn1 addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    btn1.userInteractionEnabled = YES;
    
    
    
    //****LOGIN LABEL FOR BUTTON 1
    UILabel *Login = [[UILabel alloc] initWithFrame:(CGRectMake(btn1.frame.origin.x  - 10, btn1.frame.origin.y - 50, 50, 50))];
    //Login.backgroundColor  = [UIColor whiteColor];
    Login.textColor = [UIColor grayColor];
    Login.textAlignment = NSTextAlignmentLeft;
    Login.text = @"Login ";
    [Login bringSubviewToFront:Login];
    //alpha affects everyhting drawn on the view, changes intensity of transparency
    Login.alpha = .08;
    Login.shadowColor = [UIColor whiteColor];
    //Login.shadowOffset = CGSizeMake(10, 10);
    Login.layer.masksToBounds = NO;
    [self.view addSubview:Login];
    
    
    //Second pulsating button over the devils head
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(300, 175, 25, 25);
    // Centers button to middle of screen btn1.center = self.view.center;
    [btn2 setTitle:@"" forState:UIControlStateNormal];
    
    UIView *q = [[UIView alloc] initWithFrame:btn2.bounds];
    q.backgroundColor = [UIColor grayColor];
    q.layer.cornerRadius = 12.5;
    [btn2 addSubview:q];
    [btn2 sendSubviewToBack:q];
    
    UIView *z = [[UIView alloc] initWithFrame:btn2.bounds];
    z.backgroundColor = [UIColor blackColor];
    z.layer.cornerRadius = 12.5;
    [btn2 addSubview:z];
    [btn2 sendSubviewToBack:z];
    
    [q.layer addAnimation:pulseAnimation forKey:@"a"];
    [btn2.titleLabel.layer addAnimation:pulseAnimation forKey:@"a"];
    
    [z.layer addAnimation:group forKey:@"a"];
    
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(action2:) forControlEvents:UIControlEventTouchUpInside];
    //[btn2 addTarget:self action:@selector(action2a:) forControlEvents:UIControlEventTouchUpInside];
    
    //Sets the subviews interaction to No, so that the buttons can be pressed, automatically set to yes
    q.userInteractionEnabled = NO;
    z.userInteractionEnabled = NO;
    
    UILabel *Register = [[UILabel alloc] initWithFrame:(CGRectMake(btn2.frame.origin.x  - 10, btn2.frame.origin.y - 50, 150, 50))];
    //Login.backgroundColor  = [UIColor whiteColor];
    Register.textColor = [UIColor grayColor];
    Register.textAlignment = NSTextAlignmentLeft;
    Register.text = @"Register";
    [Register bringSubviewToFront:Register];
    //alpha affects everyhting drawn on the view, changes intensity of transparency
    Register.alpha = .08;
    Register.shadowColor = [UIColor whiteColor];
    //Login.shadowOffset = CGSizeMake(10, 10);
    Register.layer.masksToBounds = NO;
    [self.view addSubview:Register];

    
    
  //  [btn2 addTarget:self action:@selector(action2:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    // Add a custom login button to your app
    UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    myLoginButton.backgroundColor=[UIColor darkGrayColor];
    myLoginButton.frame=CGRectMake(0,0,180,40);
    myLoginButton.center = self.view.center;
   [myLoginButton setTitle: @"FB Login" forState: UIControlStateNormal];
    
    
    myLoginButton.layer.shadowColor = [UIColor blackColor].CGColor;
    myLoginButton.layer.shadowOpacity = 1.0;
    myLoginButton.layer.shadowRadius = 5;
    myLoginButton.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    myLoginButton.layer.borderColor = [UIColor grayColor].CGColor;
    myLoginButton.layer.borderWidth = 3.0;
    myLoginButton.layer.cornerRadius = 2.0;
    
    
    // Handle clicks on the button
    [myLoginButton
     addTarget:self
     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // Add the button to the view
    [self.view addSubview:myLoginButton];
    
    UIButton *myLogOutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myLogOutButton.backgroundColor = [ UIColor darkGrayColor];
    myLogOutButton.frame = CGRectMake(myLoginButton.frame.origin.x, myLoginButton.frame.origin.y - 50, 180, 40);
    
    myLogOutButton.layer.shadowColor = [UIColor blackColor].CGColor;
    myLogOutButton.layer.shadowOpacity = 1.0;
    myLogOutButton.layer.shadowRadius = 5;
    myLogOutButton.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    myLogOutButton.layer.borderColor = [UIColor grayColor].CGColor;
    myLogOutButton.layer.borderWidth = 3.0;
    myLogOutButton.layer.cornerRadius = 3.0;
    
    
    //myLogOutButton.center = self.view.center;
    [myLogOutButton setTitle:@"Log Out" forState:UIControlStateNormal];
    [myLogOutButton addTarget:self action:@selector(logOutClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myLogOutButton];
    
    
    //Third button to exit the application, simulates the home button press
    UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.layer.cornerRadius = 2;
    btn3.opaque = NO;
    btn3.layer.masksToBounds = YES;
    btn3.frame = CGRectMake(myLoginButton.frame.origin.x + 10, 550, 150, 25);
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setTitle:@"Exit" forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(AppClose:) forControlEvents:UIControlEventTouchUpInside];
    btn1.opaque = YES;
    btn2.opaque = YES;
    }
-(AVPlayerLayer*)playerLayer{
    if(!_playerLayer){
        //Full path of video and size creation/manipulation
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:[[AVPlayer alloc]initWithURL:[NSURL fileURLWithPath:@"/Users/Perriott/Desktop/marianthaharris/Desktop/Objective C - Assorted Projects/FittedImages/FittedImages/City.mp4"]]];
                                                             
                                                             //videoURL]];
        _playerLayer.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
        //fullscreens it
        _playerLayer.videoGravity = AVLayerVideoGravityResize;
        
        [_playerLayer.player play];
        
    }
    return _playerLayer;
}

-(void)replayMovie:(NSNotification *)notification
{
    //Rewinds time of video and plays w/o crash
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
    [self.playerLayer.player play];
}
-(void)logOutClicked {
    
    //[FBSession.activeSession closeAndClearTokenInformation];
    
   

    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    if ( [FBSDKAccessToken currentAccessToken] ){
        [login logOut];
        NSLog(@"Logged out");
        }
    //Forcing a manual logout by calling open fb in safari so user can logout
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com"]];

   /* [FBSDKAccessToken setCurrentAccessToken:nil];
    [FBSDKProfile setCurrentProfile:nil];
    
    
    
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me/permissions/public_profile"
                                       parameters:nil
                                       HTTPMethod:@"DELETE"]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         NSLog(@"DELETE-public_profile == %@",result);
     }];
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me/permissions/email"
                                       parameters:nil
                                       HTTPMethod:@"DELETE"]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         NSLog(@"DELETE-Email == %@",result);
     }];     */
   }






// Once the button is clicked, show the login dialog
-(void)loginButtonClicked
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}

-(void)action:(UIButton *) btn1{
    UIAlertController * _alert = [UIAlertController alertControllerWithTitle:@"Please Enter Your Email Address" message:@"Please Enter a Valid Email for Access" preferredStyle:UIAlertControllerStyleAlert];
    
    //Creates the action button within the alert
    UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        NSLog(@"User Chose OK");
        NSLog(@"User Input was %@", [self accessAlertTextField ]);
    }];
    UIAlertAction * anotherAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action){
        NSLog(@"User Chose Cancel");
    }];
    
    
    //Adds action button "OK" to the alert popup
    [_alert addAction:defaultAction];
    //Adds destructive button exit to alert popup
    [_alert addAction:anotherAction];
    
    [_alert addTextFieldWithConfigurationHandler: ^(UITextField *textFeild)
     {
         textFeild.text = @" John15@exmaple.com";
         textFeild.keyboardType = UIKeyboardTypeEmailAddress;
         textFeild.keyboardAppearance = UIKeyboardAppearanceDark;
     }];

    //Adds alert to the view controller making it an actual thing
    [self presentViewController:_alert animated:YES completion:nil];

}
- (NSString *)accessAlertTextField {
    UITextField *emailEntry =(UITextField *)[alert textFields];
    
    //init validation class
    Validation *validate = [[Validation alloc] init];
    //Validating email
    BOOL emailValid = [validate emailRegEx:emailEntry.text];
    if (emailValid == FALSE) {
        
        UIAlertView *alert2 = [[UIAlertView alloc]
                              initWithTitle:@"Invalid Email"
                              message:@"Your email address is not valid. Please try again."
                              delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"Okay",
                              nil];
        [alert2 show];
//      [alert2 autorelease];
//      [alert.textFields becomeFirstResponder];
    }
    
    
    return [self.alert.textFields lastObject].text;
    
    
}

-(void)action2:(UIButton *) btn2{
    
    //Code for getting fb email, name etc
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    [parameters setValue:@"id,name,email" forKey:@"fields"];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                              }
         }];
        //Gets profile pic from facebook places it on screen
        FBSDKProfilePictureView *profilePictureview = [[FBSDKProfilePictureView alloc]initWithFrame:CGRectMake(75,300,100,100)];
        [profilePictureview setProfileID:@"me"];
        [self.view addSubview:profilePictureview];
        [self.view bringSubviewToFront:profilePictureview];
            }

    
   /* CGRect frame = CGRectMake(75, 25, 200, 25);
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = [UIColor blackColor];
    textField.font = [UIFont systemFontOfSize:17.0];
    textField.backgroundColor = [UIColor whiteColor];
    textField.autocorrectionType = UITextAutocorrectionTypeYes;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textField setPlaceholder:@"Enter your name friend"];
    //textField.delegate = self;
    if(textField.hidden == YES){
    [self.view addSubview:textField];
    [textField setTag:101];
        textField.userInteractionEnabled = YES;
    textField.returnKeyType = UIReturnKeyGo;
      textField.hidden = NO;
    }
    else{
        textField.hidden = YES; }*/
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    UIAlertController * alert2 = [UIAlertController alertControllerWithTitle:@"Bad Idea!!" message:textField.text preferredStyle:UIAlertControllerStyleAlert];
    //Creates the action button within the alert
    UIAlertAction * defaultAction2 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    UIAlertAction * anotherAction2 = [UIAlertAction actionWithTitle:@"Exit" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action){}];
        
    //Adds action button "OK" to the alert popup
    [alert2 addAction:defaultAction2];
    //Adds destructive button exit to alert popup
    [alert2 addAction:anotherAction2];
    //Adds alert to the view controller making it an actual thing
    [self presentViewController:alert2 animated:YES completion:nil];
    
    return YES;
}


-(void)AppClose: (UIButton *) btn3{
   /*  UIImageView* imageSlideshow = [[UIImageView alloc] initWithFrame:self.view.frame];
    
    // load all the frames of our animation
     imageSlideshow.animationImages = [NSArray arrayWithObjects:
     [UIImage imageNamed:@"Huey.png"],
     [UIImage imageNamed:@"truth_is_just_a_matter_of_perspective_-wallpaper-1366x768.jpg"], nil];
     
     // all frames will execute in 1.75 seconds
     imageSlideshow.animationDuration = 3.75;
     // repeat the animation forever
     imageSlideshow.animationRepeatCount = 0;
     // start animating
     [imageSlideshow startAnimating];
     // add the animation view to the main window
     [self.view addSubview:imageSlideshow];
    

    [NSThread sleepForTimeInterval:5.0];
    */
    
    //home button press programmatically
    UIApplication *app = [UIApplication sharedApplication];
    [app performSelector:@selector(suspend)];
    
    //wait 2 seconds while app is going background
    [NSThread sleepForTimeInterval:2.0];
    
    //exit app when app is in background
    exit(0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end








