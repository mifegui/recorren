import { Component, OnInit } from '@angular/core';
import { NzMessageService } from 'ng-zorro-antd/message';
import { Observable, of } from 'rxjs';
import { ProductSelectionService } from 'src/app/product-interaction/product-selection.service';
import { Product } from 'src/app/shared/models/product';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.less'],
})
export class HeaderComponent implements OnInit {
  prods: Observable<Product[]> = of([]);
  constructor(
    private productServ: ProductSelectionService,
    private msgServ: NzMessageService
  ) {}

  ngOnInit(): void {
    this.prods = this.productServ.selectedProducts;
  }

  removeProduct(index: number) {
    this.productServ.removeProduct(index);
  }
  buy() {
    const id = this.msgServ.loading('Fazendo compra', {
      nzDuration: 0,
    }).messageId;

    setTimeout(() => {
      this.msgServ.remove(id);
      this.msgServ.create('success', 'Compra realizada com sucesso');
    }, 2500);
  }
  getTotal() {
    return this.productServ.currentlySelectedProducts.reduce(
      (acc, val) => {
        return { price: acc.price + val.price };
      },
      { price: 0 }
    );
  }
}
