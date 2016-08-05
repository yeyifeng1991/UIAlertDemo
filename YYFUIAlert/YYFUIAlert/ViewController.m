//
//  ViewController.m
//  YYFUIAlert
//
//  Created by YeYiFeng on 16/8/5.
//  Copyright © 2016年 YeYiFeng. All rights reserved.
//

#import "ViewController.h"
#import "AlertManager.h"
@interface ViewController ()<AlertManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController
{
    AlertManager *manager;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    manager=[[AlertManager alloc]init];

}
- (IBAction)singleAlterView_M:(id)sender {
    [manager showSingleAlertWithTitle:@"OK" message:@"Hello World!" dismissAfterDelay:2.0];
}
- (IBAction)singleAlterView_B:(id)sender {
    [manager showSingleActionSheetWithTitle:@"OK" message:@"Hello World!" dismissAfterDelay:2.0];
}
- (IBAction)oneAlterView_M:(id)sender {
    [manager showOneAlertWithTitle:@"Tip" message:@"Hello World!" tag:1 delegate:self textFieldNumber:1 actionTitle:@"OK" actionStyle:Default alertAction:^(UIAlertAction *action) {
        self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", manager.alertController.textFields.firstObject.text]];
    }];
    
}
- (IBAction)oneAlterView_B:(id)sender {
    [manager showOneActionSheetWithTitle:@"Tip" message:@"Hello World!" actionTitle:@"OK" actionStyle:Default alertAction:^(UIAlertAction *action) {
        self.view.backgroundColor = [UIColor purpleColor];
    }];
    
}
- (IBAction)twoAlterView_M:(id)sender {
    [manager showTwoAlertWithTitle:@"Tip" message:@"Hello World!" tag:2 delegate:self textFieldNumber:2 actionTitle:@"OK" actionStyle:Default alertAction:^(UIAlertAction *action) {
        self.label.text = [manager.alertController.textFields.firstObject.text stringByAppendingString:manager.alertController.textFields.lastObject.text];
    } otherActionTitle:@"NO" otherActionStyle:Default otherAlertAction:^(UIAlertAction *action) {
        self.view.backgroundColor = [UIColor redColor];
    }];
}
- (IBAction)twoAlterView_B:(id)sender {
    [manager showTwoActionSheetWithTitle:@"Tip" message:@"Hello World!" actionTitle:@"OK" actionStyle:UIAlertActionStyleDefault alertAction:^(UIAlertAction *action) {
        self.view.backgroundColor = [UIColor yellowColor];
    } otherActionTitle:@"NO" otherActionStyle:Default otherAlertAction:^(UIAlertAction *action) {
        self.view.backgroundColor = [UIColor grayColor];
    }];
}
- (IBAction)moreAlterView_M:(id)sender {
    [manager showAlertWithTitle:@"Tip" message:@"Hello World!" tag:3 delegate:self textFieldNumber:3 actionNumber:3 actionTitle:@[@"0", @"1", @"2"] actionStyle:@[@0,@2,@1]];
}
- (IBAction)moreAlterView_B:(id)sender {
    [manager showActionSheetWithTitle:@"Tip" message:@"Hello World!" tag:4 delegate:self actionNumber:3 actionTitle:@[@"0", @"1", @"2"] actionStyle:@[@0,@2,@1]];
}



- (void)textField:(UITextField *)textField textFieldAtIndex:(NSInteger)index tag:(NSInteger)tag {
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    if (tag == 1) {
        textField.placeholder = @"输入数字1";
    }
    if (tag == 2) {
        switch (index) {
            case 0:
                textField.placeholder = @"字母";
                break;
            case 1:
                textField.placeholder = @"数字";
                break;
            default:
                break;
        }
    }
    if (tag == 3) {
        switch (index) {
            case 0:
                textField.placeholder = @"用户名";
                break;
            case 1:
                textField.placeholder = @"密码";
                break;
            case 2:
                textField.placeholder = @"邮箱";
                break;
            default:
                break;
        }
        
    }
    
}
- (void)action:(UIAlertAction *)action handlerForActionAtIndex:(NSInteger)index tag:(NSInteger)tag {
    if (tag == 3) {
        switch (index) {
            case 0:
                self.label.text = manager.alertController.textFields[0].text;
                break;
            case 1:
                self.label.text = manager.alertController.textFields[1].text;
                break;
            case 2:
                self.label.text = manager.alertController.textFields[2].text;
                break;
            default:
                break;
        }
    }
    if (tag == 4) {
        switch (index) {
            case 0:
                self.view.backgroundColor = [UIColor greenColor];
                break;
            case 1:
                self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
                break;
            case 2:
                self.imageView.image = [UIImage imageNamed:@"1.png"];
                break;
            default:
                break;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
