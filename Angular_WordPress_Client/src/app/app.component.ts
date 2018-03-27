import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { NgForm } from '@angular/forms';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 

import 'rxjs/add/operator/map';
import {
  WpApiPosts,
  WpApiPages,
  WpApiComments,
  WpApiTypes,
  WpApiMedia,
  WpApiUsers,
  WpApiTaxonomies,
  WpApiStatuses,
  WpApiTerms,
  WpApiCustom
} from 'wp-api-angular';

import { Headers } from '@angular/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  posts = [];
  users = [];
  
  new_post = {
    title: '',
    content: '',
    status: 'publish'
  }

  user = {
    login: '',
    password: ''
  }

  api_key: String = ''

  constructor(
    private wpApiPosts: WpApiPosts,
    private wpApiPages: WpApiPages,
    private wpApiComments: WpApiComments,
    private wpApiTypes: WpApiTypes,
    private wpApiMedia: WpApiMedia,
    private wpApiUsers: WpApiUsers,
    private wpApiTaxonomies: WpApiTaxonomies,
    private wpApiStatuses: WpApiStatuses,
    private wpApiTerms: WpApiTerms,
    private wpApiCustom: WpApiCustom,
    private http: HttpClient
  ) {
     wpApiPosts.getList()
       .toPromise()
       .then( response => {
         let json: any = response.json();
         this.posts = json;
      });

   wpApiUsers.getList()
     .toPromise()
     .then( response => {
       let json: any = response.json();
       this.users = json;
     })
    }

    getApiKey(): Observable<any> {
      return this.http.post('http://la-theatre.ru:82/wp-json/jwt-auth/v1/token', {
        username: this.user.login,
        password: this.user.password
      })
    }


    deletePost(id: number) {
      this.getApiKey().subscribe( data => {
      let headers: Headers = new Headers({
        'Authorization': 'Bearer ' + data.token
       });

      this.wpApiPosts.delete(id, { headers: headers })
         .toPromise()
         .then( response => {
          console.log(response);         
        })
      });
    }

    createPost() {

     this.getApiKey().subscribe(data => {
       
       let headers: Headers = new Headers({
        'Authorization': 'Bearer ' + data.token
       });

       this.wpApiPosts.create(this.new_post, { headers: headers })
         .toPromise()
         .then( response => {
          console.log(response);         
        })
      }
}