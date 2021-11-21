import { Component, OnInit } from '@angular/core';
import { NzMessageService } from 'ng-zorro-antd/message';
import { Observable, of } from 'rxjs';
import { ProductRequestsService } from 'src/app/product-interaction/product-requests.service';
import { ProductSelectionService } from 'src/app/product-interaction/product-selection.service';
import { Product } from 'src/app/shared/models/product';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.less'],
})
export class HeaderComponent implements OnInit {
  email: string = '';
  prods: Observable<Product[]> = of([]);
  recurrence: string = '';
  constructor(
    private productServ: ProductSelectionService,
    private msgServ: NzMessageService,
    private orderServ: ProductRequestsService
  ) {}

  ngOnInit(): void {
    this.prods = this.productServ.selectedProducts;
  }

  removeProduct(index: number) {
    this.productServ.removeProduct(index);
  }
  async buy() {
    const id = this.msgServ.loading('Fazendo compra', {
      nzDuration: 0,
    }).messageId;

    let err = null;
    await this.orderServ
      .buyProducts({
        customerEmail: this.email,
        products: this.productServ.currentlySelectedProducts,
        recurr: this.recurrence
      })
      .toPromise()
      .catch((e) => {
        err = e;
      });

    this.msgServ.remove(id);
    if (err) this.msgServ.create('error', JSON.stringify(err));
    else this.msgServ.create('success', 'Compra realizada com sucesso');
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
