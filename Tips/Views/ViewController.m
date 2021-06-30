//
//  ViewController.m
//  Tips
//
//  Created by FGT MAC on 6/30/21.
//

#import "ViewController.h"
#import "FGTModelController.h"

//Declare any private methods or outlets in the private interface
@interface ViewController ()

//Private properties
@property (nonatomic) double total;
@property (nonatomic) int split;
@property (nonatomic) double percentage;
@property (nonatomic) double calculatedTip;
@property (nonatomic) FGTModelController *tipController;

//Outlets
@property (nonatomic) IBOutlet UITextField *totalTextField;
@property (nonatomic) IBOutlet UILabel *splitLabel;
@property (nonatomic) IBOutlet UILabel *tipLabel;
@property (nonatomic) IBOutlet UILabel *percentageLabel;
@property (nonatomic) IBOutlet UISlider *percentageSlider;
@property (nonatomic) IBOutlet UITableView *tableView;


//Private Methods

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark -IBActions

-(IBAction)updateSplit:(UIStepper *)sender
{
    self.split = round(sender.value);
    [self calculatedTip];
}

-(IBAction)updatePercentage:(id)sender
{
    self.percentage = round(self.percentageSlider.value);
    
    [self calculatedTip];
}

-(IBAction)saveTip:(id)sender
{
    
}

#pragma mark -TableViewDataSource



@end
