//
//  CadastrarViewController.m
//  Veiculos
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Faculdade Alfa. All rights reserved.
//

#import "CadastrarViewController.h"

@interface CadastrarViewController ()

@end

@implementation CadastrarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/dados.plist"];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        dados = [NSMutableArray arrayWithContentsOfFile:filePath];
    } else {
        dados = [[NSMutableArray alloc] init];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)save:(id)sender {
    NSDictionary *item = [NSDictionary dictionaryWithObjectsAndKeys: self.txtAno.text, @"ano", self.txtMarca.text, @"marca", self.txtModelo.text, @"modelo", self.txtValor.text, @"valor", nil];
    [dados addObject:item];
    [dados writeToFile:filePath atomically:YES];
    [self mostrarMensagem:@"Aviso" msg:@"Gravado com sucesso"];
    [self limparCampos];
    
}

-(void)mostrarMensagem:(NSString *)titulo msg:(NSString *)mensagem {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: titulo
                                                   message: mensagem
                                                  delegate: self
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles:nil];
    
    [alert show];
    alert = nil;
}

-(void)limparCampos {
    self.txtAno.text = @"";
    self.txtMarca.text = @"";
    self.txtModelo.text = @"";
    self.txtValor.text = @"";
}

-(void)listarDados {
    for(NSDictionary *item in dados) {
        NSLog(@"Marca: %@. Modelo: %@",
              [item objectForKey:@"marca"],
              [item objectForKey:@"modelo"]
              );
    }
    NSLog(@"***********************************");
}

@end
