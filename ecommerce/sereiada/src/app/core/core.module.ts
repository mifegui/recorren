import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { NzMenuModule } from 'ng-zorro-antd/menu';

const core = [HeaderComponent, FooterComponent];

@NgModule({
  declarations: core,
  imports: [CommonModule, NzMenuModule],
  exports: core,
})
export class CoreModule {}
