import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProductInteractionRoutingModule } from './product-interaction-routing.module';
import { ProductListComponent } from './product-list/product-list.component';
import { NzGridModule } from 'ng-zorro-antd/grid';
import { NzDividerModule } from 'ng-zorro-antd/divider';
import { NzCardModule } from 'ng-zorro-antd/card';

    


@NgModule({
  declarations: [
    ProductListComponent
  ],
  imports: [
    CommonModule,
    ProductInteractionRoutingModule,
    NzGridModule,
    NzDividerModule,
    NzCardModule
  ]
})
export class ProductInteractionModule { }
