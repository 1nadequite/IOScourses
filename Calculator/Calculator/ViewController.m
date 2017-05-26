#import "ViewController.h"
#import "AboutViewController.h"
#import "LicenseViewController.h"
#import "CalculatorModel.h"
#import "Constants.h"

@interface ViewController () <CalculatorModelDelegate>

@property (retain, nonatomic) CalculatorModel *model;

@property (retain, nonatomic) IBOutlet UILabel *displayLabel;

@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *digitButtons;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *unaryOperationButtons;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *binaryOperationButtons;

@property (retain, nonatomic) IBOutlet UIButton *dotButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *aboutBarButtonItem;
@property (retain, nonatomic) IBOutlet UIButton *licenseButton;

@property (assign, nonatomic, getter=isFloatNumber) BOOL floatNumber;
@property (assign, nonatomic, getter=isNewNumber) BOOL newNumber;
@property (assign, nonatomic, getter=isPrevAction) BOOL prevAction;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [[CalculatorModel alloc] init];
    self.model.delegate = self;
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    [swipeRight release];
}

#pragma mark - digit buttons

- (IBAction)digitButtonTapped:(id)sender {
    if (self.isNewNumber) {
        self.displayLabel.text = ZERO_VALUE;
        self.floatNumber = NO;
        self.newNumber = NO;
        self.model.expression = YES;
    }
    self.prevAction = NO;
    NSString *newDigit = [sender currentTitle];
    self.displayLabel.text = [self.displayLabel.text isEqualToString:ZERO_VALUE] ? newDigit : [NSString stringWithFormat:@"%@%@", self.displayLabel.text, newDigit];
}

#pragma mark - operation button

- (IBAction)operationButtonTapped:(id)sender {
    NSString *operation = [sender currentTitle];
    if (!self.isPrevAction) self.model.rightOperand = [self.displayLabel.text floatValue];
    [self.model executeUnaryOperation:operation];
    [self.model executeBinaryOperation:operation];
    self.floatNumber = NO;
    self.newNumber = YES;
    self.prevAction = YES;
}

#pragma mark - dot button

- (IBAction)dotButtonTapped:(id)sender {
    if (!self.isFloatNumber || self.isNewNumber) {
        if (self.isNewNumber) {
            self.displayLabel.text = ZERO_VALUE;
            self.newNumber = NO;
        }
        self.floatNumber = YES;
        NSString *newDigit = [sender currentTitle];
        self.displayLabel.text = [NSString stringWithFormat:@"%@%@", self.displayLabel.text, newDigit];
    }
}

#pragma mark - update display value

- (void)calculatorModelDidUpdatedValue:(double)value {
    NSNumberFormatter *formatter = [[[NSNumberFormatter alloc] init] autorelease];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMinimumFractionDigits:0];
    [formatter setMaximumFractionDigits:6];
    [formatter setAlwaysShowsDecimalSeparator:NO];
    NSString *numberFromString = [formatter stringFromNumber:[NSNumber numberWithFloat:value]];
    self.displayLabel.text = [NSString stringWithFormat:@"%@", numberFromString];
}

- (void)calculatorModelDidWrongOperation:(NSString *)error {
    self.displayLabel.text = [NSString stringWithFormat:@"%@", error];
}

#pragma mark - swipe label to right

- (void)swipeRight:(UISwipeGestureRecognizer *)gestureRecognizer {
    NSString *prevElement = [self.displayLabel.text substringWithRange:NSMakeRange(self.displayLabel.text.length - 1, 1)];
    if ([prevElement isEqualToString:DOT_VALUE]) self.floatNumber = NO;
    self.displayLabel.text = self.displayLabel.text.length > 1 ? [self.displayLabel.text substringToIndex:self.displayLabel.text.length - 1] : ZERO_VALUE;
}

#pragma mark - information buttons

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
    [_model release];
    [_displayLabel release];
    [_digitButtons release];
    [_unaryOperationButtons release];
    [_binaryOperationButtons release];
    [_dotButton release];
    [_aboutBarButtonItem release];
    [_licenseButton release];
    [super dealloc];
}

@end
