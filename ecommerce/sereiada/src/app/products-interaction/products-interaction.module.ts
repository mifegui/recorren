import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProductsInteractionRoutingModule } from './products-interaction-routing.module';
import { ListOfProductsComponent } from './list-of-products/list-of-products.component';


@NgModule({
  declarations: [
    ListOfProductsComponent
  ],
  imports: [
    CommonModule,
    ProductsInteractionRoutingModule
  ]
})
export class ProductsInteractionModule { }
