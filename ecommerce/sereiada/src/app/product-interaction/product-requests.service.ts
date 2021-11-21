import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Product } from '../shared/models/product';

@Injectable({
  providedIn: 'root',
})
export class ProductRequestsService {
  constructor(private http: HttpClient) {}

  buyProducts(data: { customerEmail: string; products: Product[] }) {
    return this.http.post(environment.eentregasUrl + '/buy', {
      customer: data.customerEmail,
      products: data.products,
    });
  }
}
