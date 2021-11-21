import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProductInteractionRoutingModule } from './product-interaction-routing.module';
import { ProductListComponent } from './product-list/product-list.component';
import { NzGridModule } from 'ng-zorro-antd/grid';
import { NzDividerModule } from 'ng-zorro-antd/divider';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NzSpaceModule } from 'ng-zorro-antd/space';
import { NzNotificationModule } from 'ng-zorro-antd/notification';

@NgModule({
  declarations: [ProductListComponent],
  imports: [
    CommonModule,
    ProductInteractionRoutingModule,
    NzGridModule,
    NzDividerModule,
    NzCardModule,
    NzSpaceModule,
    NzNotificationModule
  ],
})
export class ProductInteractionModule {}
