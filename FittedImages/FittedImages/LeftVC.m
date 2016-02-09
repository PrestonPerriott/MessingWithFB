//
//  LeftVC.m
//  FittedImages
//
//  Created by Preston Perriott on 12/12/15.
//  Copyright © 2015 Preston Perriott. All rights reserved.
//

#import "LeftVC.h"
#import "ViewController.h"


@interface LeftVC () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) UITableViewCell *customCell;
@property (strong, nonatomic) ViewController *BaseVC;
@end

@implementation LeftVC
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Configuration", nil);
    //Creating, initializing and sizing the Table View for use
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //Trying to style tableview
    self.tableView.separatorColor = [UIColor whiteColor];
    [self.tableView.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.tableView.layer setBorderWidth:7.0];
    CALayer *vtv = [_tableView layer];
    [vtv setMasksToBounds:YES];
    //rounds the edges of the feild
    [vtv setCornerRadius:10.0];
    
    
    //Not working as it should for some reason
    self.navigationController.navigationBar.backgroundColor = [UIColor lightTextColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    self.navigationController.navigationBar.alpha = .07f;
    self.navigationController.navigationBar.translucent = YES;
    //Addds a cooler more smoth translucent effect
    [(UIView*)[self.navigationController.navigationBar.subviews objectAtIndex:0] setAlpha:0.7f];

    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];

    UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:blur];
    
    // add blur to an effect view
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:blur];
    effectView.frame = self.view.frame;
    
    // add vibrancy to yet another effect view
    UIVisualEffectView *vibrantView = [[UIVisualEffectView alloc]initWithEffect:vibrancy];
    vibrantView.frame = self.view.frame;
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"OverGrowth.jpeg"]];
    // add both effect views to the image view
   // [self.tableView addSubview:effectView];
   // [self.tableView addSubview:vibrantView];

    
    [self.view addSubview:self.tableView];
    
    //Populating the DataArray for use
    self.dataArray = [@[@"Settings", @"Contact Us", @"Find A Friend" , @"Post to FaceBook"] mutableCopy];

   /* CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame            = self.view.bounds;
    gradient.colors           = [NSArray arrayWithObjects:(id)[[UIColor grayColor] CGColor], (id)[[UIColor orangeColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
    
    [self.view.layer insertSublayer:gradient atIndex:0]; */
    
    // Do any additional setup after loading the view, typically from a nib.

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Function for putting an image for the cell background
 -(void)  tableView:(UITableView*)tableView
   willDisplayCell:(UITableViewCell*)cell
 forRowAtIndexPath:(NSIndexPath*)indexPath;
{
  //Makes cell transparent so tableview can be seen as well
 cell.backgroundColor = [UIColor clearColor];
 cell.backgroundView.backgroundColor = [UIColor clearColor];
 }



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
    //((NSArray*) _dataArray[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CustomCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //cell.backgroundColor = [UIColor colorWithRed:249.0/255 green:237.0/255 blue:224.0/255 alpha:1.0];
    
    

    
    int dataIndex = (int) indexPath.row % [self.dataArray count];
    cell.textLabel.text = self.dataArray[dataIndex];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.textColor = [UIColor lightTextColor];
    cell.textLabel.font = [UIFont fontWithName:@"Georgia-Italic" size:15];
    
    
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    //cell.textLabel.textAlignment = NSTextAlignmentRight;
  
   /* NSDictionary *views = @{@"label":cell.textLabel};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[label]|" options:0 metrics:nil views:views];
    
    [cell.contentView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|" options:0 metrics:nil views:views];
    
    [cell.contentView addConstraints:constraints];
    */
    return cell;
}



- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.fillMode = kCAFillModeForwards;
    transition.duration = 0.6;
    transition.subtype = kCATransitionFromTop;
    
    /* int dataIndex = (int) indexPath.row % [self.dataArray count];
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"NewMapController" bundle:[NSBundle mainBundle]];
     UIViewController *rvc = [[RearViewController alloc] initWithNibName:@"NewMapController" bundle:nil];
     [storyboard instantiateViewControllerWithIdentifier:@"NewMapController"];
     
     switch (indexPath.row) {
     case 0:
     {
     if (indexPath.row == 0) {
     
     [self.navigationController pushViewController:rvc animated:YES];
     GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.7427
     longitude:74.0059
     zoom:13];
     rvc.view = [GMSMapView mapWithFrame:CGRectZero camera:camera];
     }
     if (indexPath.row == 1) {
     [self.navigationController pushViewController:rvc animated:YES];
     GMSCameraPosition *camera2 = [GMSCameraPosition cameraWithLatitude:42.3601
     longitude:71.0589
     zoom:13];
     rvc.view = [GMSMapView mapWithFrame:CGRectZero camera:camera2];
     }
     if (indexPath.row == 2) {
     [self.navigationController pushViewController:rvc animated:YES];
     GMSCameraPosition *camera3 = [GMSCameraPosition cameraWithLatitude:25.7753 longitude:80.2089 zoom:13];
     rvc.view = [GMSMapView mapWithFrame:CGRectZero camera:camera3];
     }
     break;
     
     default:
     break;
     }
     }
     */
    [self.tableView.layer addAnimation:transition forKey:@"UITableViewReloadDataAnimationKey"];
    
    /*
     //Start a new core animation transaction
     [CATransaction begin];
     
     //Set a completion block for the animation
     [CATransaction setCompletionBlock:^{
     
     //Updates the data model to add a new section
     [_dataArray addObject:[NSMutableArray arrayWithObjects:@"Black", nil]];
     
     //Animates the new section Appearance
     [tableView beginUpdates];
     [tableView insertSections:[NSIndexSet indexSetWithIndex:indexPath.section + 1] withRowAnimation:UITableViewRowAnimationFade];
     [tableView endUpdates];
     }];
     
     //Updates the model and removes the selected row
     [(NSMutableArray*)_dataArray[indexPath.section]removeObjectAtIndex:indexPath.row];
     
     
     // Animates the removal of the selected row
     
     [tableView beginUpdates];
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
     [tableView endUpdates];
     
     
     [CATransaction commit];  */
    
    
}
 /*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
