import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { Http } from '@angular/http';
import { HttpClientModule, HttpClient } from '@angular/common/http';

import {
  WpApiModule,
  WpApiLoader,
  WpApiStaticLoader
} from 'wp-api-angular';
import { FormsModule }   from '@angular/forms';

export function WpApiLoaderFactory(http: Http) {
  return new WpApiStaticLoader(http, 'http://la-theatre.ru:82/wp-json/wp/v2/', '');
}

import { AppComponent } from './app.component';


@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    WpApiModule.forRoot({
      provide: WpApiLoader,
      useFactory: (WpApiLoaderFactory),
      deps: [Http]
    })

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
