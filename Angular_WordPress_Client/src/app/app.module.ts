import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { Http } from '@angular/http';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { AppComponent } from './app.component';
import { PostEditComponent } from './post-edit/post-edit.component';
import { PostListComponent } from './post-list/post-list.component';
import { UserListComponent } from './user-list/user-list.component';
import { PostNewComponent } from './post-new/post-new.component';
import { FormsModule }   from '@angular/forms';
import { AuthenticationComponent } from './authentication/authentication.component';
import {
  WpApiModule,
  WpApiLoader,
  WpApiStaticLoader
} from 'wp-api-angular';


export function WpApiLoaderFactory(http: Http) {
  return new WpApiStaticLoader(http, 'http://la-theatre.ru:82/wp-json/wp/v2/', '');
}

@NgModule({
  declarations: [
    AppComponent,
    PostEditComponent,
    PostListComponent,
    UserListComponent,
    PostNewComponent,
    AuthenticationComponent
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
