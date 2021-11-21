import { Component, OnInit } from '@angular/core';
import { Product } from 'src/app/shared/models/product';
import { NzNotificationService } from 'ng-zorro-antd/notification';
import { ProductSelectionService } from '../product-selection.service';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.less'],
})
export class ProductListComponent implements OnInit {
  products: Product[] = [
    { id: 'maca', name: 'Macarrão', price: 10 },
    { id: 'arro', name: 'Arroz', price: 20 },
    { id: 'feij', name: 'Feijão', price: 30 },
    { id: 'prin', name: 'Pringles', price: 31 },
    { id: 'dete', name: 'Detergente', price: 6 },
  ];
  constructor(
    private productServ: ProductSelectionService,
    private notification: NzNotificationService
  ) {}

  ngOnInit(): void {}

  addProduct(p: Product) {
    this.productServ.addProduct(p);
    this.notificateProductAdded(p);
  }
  private notificateProductAdded(p: Product) {
    this.notification.create(
      'success',
      'Produto adicionado',
      'Uma unidade do produto ' + p.name + ' foi adicionado'
    );
  }
}
