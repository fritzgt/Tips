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
@property (nonatomic) double tip;
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
@property (nonatomic) IBOutlet UIStepper *splitStepper;
@property (nonatomic) IBOutlet UISlider *percentageSlider;
@property (nonatomic) IBOutlet UITableView *tableView;


//Private Methods
- (void)calculateTip;
- (void)updateViews;
- (void)saveTipName: (NSString *)name;

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
    [self calculateTip];
}

-(IBAction)updatePercentage:(id)sender
{
    self.percentage = round(self.percentageSlider.value);
    [self calculateTip];
}

-(IBAction)saveTip:(id)sender
{
//    [self showSaveTipAlert];
}


#pragma mark -Methods

- (void)calculateTip
{
    self.percentage = round(self.percentageSlider.value);
    self.total = self.totalTextField.text.doubleValue;
    self.split = self.splitStepper.value;
    
    self.tip = self.total * (self.percentage/100.) / self.split;
    
    [self updateViews];
};

- (void)updateViews
{
    self.splitStepper.value = self.split;
    self.percentageSlider.value = self.percentage;
    self.totalTextField.text = [NSString localizedStringWithFormat:@"$%.f", self.tip];
    self.splitLabel.text = [NSString localizedStringWithFormat:@"%ld", (long)self.split];
    
    self.percentageLabel.text = [NSString localizedStringWithFormat:@"%0.0f%%", self.percentage];
    
    
};

- (void)saveTipName: (NSString *)name
{
    [self.tipController addTip:[[FGTTip alloc] initWithName: name
                                                      total:self.total
                                                 splitCount:self.split
                                              tipPercentage:self.percentage]];
    [self.tableView reloadData];
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
