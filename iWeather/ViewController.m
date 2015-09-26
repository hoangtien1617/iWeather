//
//  ViewController.m
//  iWeather
//
//  Created by Hoàng Tiến on 9/25/15.
//  Copyright (c) 2015 Hoàng Tiến. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UILabel *CF;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;

@end

@implementation ViewController
{
    NSArray *quotes;
    NSArray *locations;
    NSArray *photo;
    NSArray *temper;
    NSString *string;
    float c,f;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    locations = @[@"Hà Nội, Việt Nam",@"Đà Nẵng, Việt Nam",@"TP Hồ Chí Minh, Việt Nam",@"Hải Phòng, Việt Nam"];
    photo = @[@"rain",@"sunny",@"cloudy",@"thunder"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updateWeather:(id)sender {
    
    c = 10 + arc4random_uniform(18) + (float)arc4random() / (float) INT32_MAX;
    f = (c*1.8)+32;
    int temp = arc4random_uniform((u_int32_t) (quotes.count));
    self.quote.text = quotes[temp];

    
    int locationTemp = arc4random_uniform((u_int32_t)(quotes.count-1));
    self.location.text = locations[locationTemp];
    NSLog(@"%d",locationTemp);

    
    int photoTemp = arc4random_uniform((u_int32_t)(quotes.count -1));
    self.weatherIcon.image = [UIImage imageNamed:photo[photoTemp]];
    
    if ([self.CF.text isEqualToString:@"C"]) {

    string = [NSString stringWithFormat:@"%2.1f",c];
        [self.temperature setTitle:string forState:UIControlStateNormal];
    } else if ([self.CF.text isEqualToString:@"F"]) {
        string = [NSString stringWithFormat:@"%2.1f",f];
        [self.temperature setTitle:string forState:UIControlStateNormal];
    }
    
}
- (IBAction)convertF:(id)sender {
    if ([self.CF.text isEqualToString:@"C"]) {
        self.CF.text = @"F";
        
        NSString *temp = [NSString stringWithFormat:(@"%2.1f"),f];
        [self.temperature setTitle:temp forState:UIControlStateNormal];
    }else if ([self.CF.text isEqualToString:@"F"])
    {

        NSString *temp = [NSString stringWithFormat:(@"%2.1f"),c];
        [self.temperature setTitle:temp forState:UIControlStateNormal];
        self.CF.text = @"C";
        


    }
    
    
}
/*- (float)getTemperature
{
    return 10 + arc4random_uniform(20) + (float)arc4random() / (float) INT32_MAX;
}
*/
@end
