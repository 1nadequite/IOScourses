#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:210/255.f green:210/255.f blue:210/255.f alpha:1]];
    
    self.fullNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(50, 50, 275, 60)] autorelease];
    [self.fullNameLabel setTextColor:[UIColor blackColor]];
    [self.fullNameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.fullNameLabel setFont:[UIFont fontWithName:@"Arial" size:18]];
    [self.view addSubview:self.fullNameLabel];
    
    self.firstNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(15, 175, 105, 30)] autorelease];
    [self.firstNameLabel setText:@"First name" ];
    [self.firstNameLabel setTextColor:[UIColor blackColor]];
    [self.firstNameLabel setTextAlignment:NSTextAlignmentLeft];
    [self.firstNameLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
    [self.view addSubview:self.firstNameLabel];
    
    self.lastNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(15, 215, 105, 30)] autorelease];
    [self.lastNameLabel setText:@"Last name" ];
    [self.lastNameLabel setTextColor:[UIColor blackColor]];
    [self.lastNameLabel setTextAlignment:NSTextAlignmentLeft];
    [self.lastNameLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
    [self.view addSubview:self.lastNameLabel];
    
    self.firstNameTextField = [[[UITextField alloc] initWithFrame:CGRectMake(140, 175, 220, 30)] autorelease];
    [self.firstNameTextField setBorderStyle:UITextBorderStyleNone];
    [self.firstNameTextField setTextAlignment:NSTextAlignmentLeft];
    [self.firstNameTextField setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.firstNameTextField];
    
    self.lastNameTextField = [[[UITextField alloc] initWithFrame:CGRectMake(140, 215, 220, 30)] autorelease];
    [self.lastNameTextField setBorderStyle:UITextBorderStyleNone];
    [self.lastNameTextField setTextAlignment:NSTextAlignmentLeft];
    [self.lastNameTextField setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.lastNameTextField];
    
    self.helloButton = [[[UIButton alloc] initWithFrame:CGRectMake(80, 300, 215, 30)] autorelease];
    [self.helloButton setTitle:@"hello" forState:UIControlStateNormal];
    [self.helloButton setBackgroundColor:[UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1]];
    [self.helloButton addTarget:self action:@selector(helloButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.helloButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.helloButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.helloButton];
}

- (IBAction)helloButtonTapped:(id)sender {
    NSString *fullName = [[[NSString alloc] initWithFormat:@"Hello %@ %@", self.firstNameTextField.text, self.lastNameTextField.text] autorelease];
    if ([self.firstNameTextField.text length] == 0 && [self.lastNameTextField.text length] == 0) {
        [self.fullNameLabel setText:@"You have to input your name!"];
    } else {
        [self.fullNameLabel setText:fullName];
    }
    NSLog(@"%@", self.fullNameLabel.text);
}

- (void)dealloc {
    [_firstNameLabel release];
    [_lastNameLabel release];
    [_fullNameLabel release];
    [_firstNameTextField release];
    [_lastNameTextField release];
    [_helloButton release];
    [super dealloc];
}

@end
