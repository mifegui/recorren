import { Component, OnInit } from '@angular/core';
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
  constructor(private productServ: ProductSelectionService) {}

  ngOnInit(): void {
    this.prods = this.productServ.selectedProducts;
  }

  removeProduct(index: number) {
    this.productServ.removeProduct(index);
  }
  buy() {

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
