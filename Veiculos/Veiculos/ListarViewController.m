//
//  ListarViewController.m
//  Veiculos
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Faculdade Alfa. All rights reserved.
//

#import "ListarViewController.h"

@interface ListarViewController ()

@end

@implementation ListarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/dados.plist"];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        self.dados = [NSMutableArray arrayWithContentsOfFile:filePath];
    }
    
    [self.tabela reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dados.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:@"Celula"];
    
    if(celula == nil){
        celula =[[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"Celula"];
    }
    
    @try {
        //verifica se existe no array a linha atual da tabela
        if([self.dados objectAtIndex:indexPath.row] != nil) {
            //NSDictionary *item = [self.dados objectAtIndex:indexPath.row];
            NSDictionary *item = [self.dados objectAtIndex:(self.dados.count - indexPath.row - 1)];
            //carregando o resultado no Titulo da Coluna
            celula.textLabel.text = [NSString stringWithFormat:@"Marca: %@ => Modelo: %@", [ item objectForKey:@"marca"], [ item objectForKey:@"modelo"]];
            celula.detailTextLabel.text = [NSString stringWithFormat:@"Ano: %@ => Valor: %@", [ item objectForKey:@"ano"], [ item objectForKey:@"valor"]];
        }
    }
    @catch(NSException *exception) { }
    @finally { }
    
    return celula;
}

-(IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
