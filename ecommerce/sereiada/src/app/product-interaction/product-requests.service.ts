import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { from } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Product } from '../shared/models/product';

@Injectable({
  providedIn: 'root',
})
export class ProductRequestsService {
  constructor() {}

  buyProducts(data: {
    customerEmail: string;
    products: Product[];
    recurr: string;
  }) {
    let url = '';
    if (data.recurr) url = environment.erecorrenUrl + '/recorra';
    else url = environment.eentregasUrl + '/buy';
    return from(
      fetch('http://' + url, {
        body: JSON.stringify(data),
        headers: {
          'Content-Type': 'application/json',
        },
        method: 'POST',
        mode: 'no-cors',
      })
    );
  }
}
