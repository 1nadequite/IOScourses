#import "ViewController.h"
#import "AboutViewController.h"
#import "LicenseViewController.h"
#import "CalculatorModel.h"

static NSString *const ZERO_VALUE = @"0";
static NSString *const DOT_VALUE = @".";
static NSString *const EQUAL_OPERATION = @"=";
static NSString *const ADD_OPERATION = @"+";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self clearButtonTapped:nil];
    
    self.model = [[CalculatorModel alloc] init];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    [swipeRight release];
}

#pragma mark - buttons 

- (IBAction)digitCollectionButtonTapped:(id)sender {
    if (self.isNewNumber) {
        self.leftOperand = [self.displayLabel.text doubleValue];
        self.displayLabel.text = ZERO_VALUE;
        self.floatNumber = NO;
        self.newNumber = NO;
    }
    NSString *newDigit = [sender currentTitle];
    self.displayLabel.text = [self.displayLabel.text isEqualToString:ZERO_VALUE] ? newDigit : [NSString stringWithFormat:@"%@%@", self.displayLabel.text, newDigit];
}

- (IBAction)unaryOperationCollectionButtonTapped:(id)sender {
    NSString *unaryOperation = [sender currentTitle];
    self.leftOperand = [self.model executeUnaryOperand:[self.displayLabel.text doubleValue]
                                             Operation:unaryOperation];
    self.displayLabel.text = [NSString stringWithFormat:@"%.3f", self.leftOperand];
    self.floatNumber = YES;
    self.newNumber = YES;
    self.rightOperand = 0;
    self.operation = nil;
}

- (IBAction)binaryOperationCollectionButtonTapped:(id)sender {
    NSString *binaryOperation = [sender currentTitle];
    if ([self.operation length] == 0) {
        self.leftOperand = 0;
        self.operation = ADD_OPERATION;
    }
    if (!self.isNewNumber) self.rightOperand = [self.displayLabel.text doubleValue];
    if ([binaryOperation isEqualToString:EQUAL_OPERATION] || !self.isNewNumber) {
        self.leftOperand = [self.model executeBinaryLeftOperand:self.leftOperand
                                                      Operation:self.operation
                                                   RightOperand:self.rightOperand];
        self.displayLabel.text = [NSString stringWithFormat:@"%.3f", self.leftOperand];
    }
    if (![binaryOperation isEqualToString:EQUAL_OPERATION]) self.operation = binaryOperation;
    self.floatNumber = YES;
    self.newNumber = YES;
}

- (IBAction)clearButtonTapped:(id)sender {
    self.displayLabel.text = ZERO_VALUE;
    self.floatNumber = NO;
    self.newNumber = YES;
    self.leftOperand = 0;
    self.rightOperand = 0;
    self.operation = nil;
}

- (IBAction)dotButtonTapped:(id)sender {
    if (!self.isFloatNumber) {
        self.floatNumber = YES;
        NSString *newDigit = [sender titleForState:UIControlStateNormal];
        self.displayLabel.text = [NSString stringWithFormat:@"%@%@", self.displayLabel.text, newDigit];
    }
}

# pragma mark - swipe label to right

- (void)swipeRight:(UISwipeGestureRecognizer*)gestureRecognizer {
    NSString *prevElement = [self.displayLabel.text substringWithRange:NSMakeRange(self.displayLabel.text.length - 1, 1)];
    if ([prevElement isEqualToString:DOT_VALUE]) self.floatNumber = NO;
    self.displayLabel.text = self.displayLabel.text.length > 1 ? [self.displayLabel.text substringToIndex:self.displayLabel.text.length - 1] : ZERO_VALUE ;
}

# pragma mark - information buttons

- (IBAction)aboutButtonTapped:(id)sender {
    AboutViewController *aboutController = [[AboutViewController alloc] init];
    [self.navigationController pushViewController:aboutController animated:YES];
    [aboutController release];
}

- (IBAction)licenseButtonTapped:(id)sender {
    LicenseViewController *licenseController = [[LicenseViewController alloc] init];
    [self presentViewController:licenseController animated:YES completion:nil];
    [licenseController release];
}

- (void)dealloc {
    [_displayLabel release];
    [_digitCollectionButtons release];
    [_unaryOperationCollectionButtons release];
    [_binaryOperationCollectionButtons release];
    [_clearButton release];
    [_dotButton release];
    [_aboutBarButtonItem release];
    [_licenseButton release];
    [_operation release];
    [super dealloc];
}

@end
