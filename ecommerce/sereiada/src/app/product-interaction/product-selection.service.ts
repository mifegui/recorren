import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Product } from '../shared/models/product';

@Injectable({
  providedIn: 'root',
})
export class ProductSelectionService {
  _products: BehaviorSubject<Product[]> = new BehaviorSubject<Product[]>([]);

  selectedProducts = this._products.asObservable();

  get currentlySelectedProducts(): Product[] {
    return this._products.getValue();
  }
  constructor() {}

  removeProduct(index: number) {
    let ps = this.currentlySelectedProducts;
    ps.splice(index, 1);
    this._products.next(ps);
  }
  addProduct(p: Product) {
    let ps = this.currentlySelectedProducts;
    ps.push(p);
    this._products.next(ps);
  }

}
