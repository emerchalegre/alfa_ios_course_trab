//
//  CadastrarViewController.h
//  Veiculos
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Faculdade Alfa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CadastrarViewController : UIViewController<UITextFieldDelegate, UIActionSheetDelegate> {
    NSString *filePath;
    NSMutableArray *dados;
}

@property (strong, nonatomic) IBOutlet UITextField *txtMarca;
@property (strong, nonatomic) IBOutlet UITextField *txtModelo;
@property (strong, nonatomic) IBOutlet UITextField *txtAno;
@property (strong, nonatomic) IBOutlet UITextField *txtValor;

-(IBAction)voltar:(id)sender;

@end
