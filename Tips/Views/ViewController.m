//
//  ViewController.m
//  Tips
//
//  Created by FGT MAC on 6/30/21.
//

#import "ViewController.h"
#import "FGTModelController.h"
#import "FGTTip.h"

//Declare any private methods or outlets in the private interface
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

//Private properties
@property (nonatomic) double total;
@property (nonatomic) NSInteger split;
@property (nonatomic) double percentage;
@property (nonatomic) double calculatedTip;
@property (nonatomic) FGTModelController *tipController;

//Outlets
@property (nonatomic) IBOutlet UITextField *totalTextField;
@property (nonatomic) IBOutlet UILabel *splitLabel;
@property (nonatomic) IBOutlet UILabel *tipLabel;
@property (nonatomic) IBOutlet UILabel *percentageLabel;
@property (nonatomic) IBOutlet UIStepper *splutStepper;
@property (nonatomic) IBOutlet UISlider *percentageSlider;
@property (nonatomic) IBOutlet UITableView *tableView;


//Private Methods
- (void)calculateTip;
- (void)updateViews;
- (void)daveTipName: (NSString *)name;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tipController = [[FGTModelController alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;//[self.tableView setDataSource: self];
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
//    [self showSaveTipAlert];
}


#pragma mark -Methods

- (void)calculateTip
{
    
};

- (void)updateViews
{
    
};

- (void)daveTipName: (NSString *)name
{
    
};



#pragma mark -TableViewDataSource

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: @"TipCell" forIndexPath: indexPath];
    
    FGTTip *tip = [self.tipController tipAtIndex: indexPath.row];
    
    cell.textLabel.text = tip.name;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    
    return  self.tipController.tipCount;
}

#pragma mark -TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FGTTip *tip = [self.tipController tipAtIndex:indexPath.row];
    
    self.total = tip.total;
    self.split = tip.splitCount;
    self.percentage = tip.tipPercentage;
    
    [self updateViews];
    [self calculatedTip];
}

#pragma mark -Alert helper

-(void)showSaveTipalert
{
    
}


@end
