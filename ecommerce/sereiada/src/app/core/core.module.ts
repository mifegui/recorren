import {  NgModule } from '@angular/core';
import { NzListModule } from 'ng-zorro-antd/list';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { NzMenuModule } from 'ng-zorro-antd/menu';
import { NzDropDownModule } from 'ng-zorro-antd/dropdown';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzModalModule } from 'ng-zorro-antd/modal';
import { NzInputModule } from 'ng-zorro-antd/input';
import { NzMessageModule } from 'ng-zorro-antd/message';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { NzRadioModule } from 'ng-zorro-antd/radio';



const core = [HeaderComponent, FooterComponent];

@NgModule({
  declarations: core,
  imports: [
    CommonModule,
    NzMenuModule,
    NzDropDownModule,
    NzIconModule,
    NzButtonModule,
    NzModalModule,
    NzListModule,
    NzInputModule,
    NzMessageModule,
    BrowserModule,
    FormsModule,
    NzRadioModule
  ],
  exports: core,
})
export class CoreModule {}
