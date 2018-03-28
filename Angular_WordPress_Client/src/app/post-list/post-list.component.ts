import { Component, OnInit, Input } from '@angular/core';
import { WpApiPosts } from 'wp-api-angular';
import { Headers } from '@angular/http';

@Component({
  selector: 'post-list',
  templateUrl: './post-list.component.html',
  styleUrls: ['./post-list.component.css']
})
export class PostListComponent implements OnInit {
  @Input() token;
  posts = [];
  editingPost = null;

  constructor(private wpApiPosts: WpApiPosts) { 
    this.getPosts();
  }

  ngOnInit() {
  }

  getPosts() {
    this.wpApiPosts.getList()
    .toPromise()
    .then( response => {
      let json: any = response.json();
      this.posts = json;
    });
  }

  deletePost(id: number, index: number) {
    let headers: Headers = new Headers({
      'Authorization': 'Bearer ' + this.token
    });

    this.wpApiPosts.delete(id, { headers: headers })
    .toPromise()
    .then( response => {
      if (response['ok'] == true) {
        this.posts.splice(index,1);
      }       
    })
  }

  updatePost(post) {
    this.editingPost = post;
  }
}
