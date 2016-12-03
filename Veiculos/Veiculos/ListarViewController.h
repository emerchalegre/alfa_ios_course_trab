//
//  ListarViewController.h
//  Veiculos
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Faculdade Alfa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListarViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tabela;
@property (strong, nonatomic) NSArray *dados;

-(IBAction)voltar:(id)sender;

@end
