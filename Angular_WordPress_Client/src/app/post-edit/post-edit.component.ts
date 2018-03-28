import { Component, OnInit, Input, EventEmitter, Output } from '@angular/core';
import { WpApiPosts } from 'wp-api-angular';
import { Headers } from '@angular/http';

@Component({
  selector: 'post-edit',
  templateUrl: './post-edit.component.html',
  styleUrls: ['./post-edit.component.css']
})
export class PostEditComponent implements OnInit {
  @Input() token;
  @Input() post;
  @Output() finish = new EventEmitter<void>();
  post_edit = {
    title: '',
    content: ''
  }

  constructor(private wpApiPosts: WpApiPosts) { 
  }

  ngOnInit() {
    this.post_edit['title'] = this.post.title.rendered;
    this.post_edit['content'] = this.post.content.rendered;
  }

  updatePost() {
    let headers: Headers = new Headers({
      'Authorization': 'Bearer ' + this.token
    });

    this.wpApiPosts.update(this.post.id, this.post_edit, { headers: headers })
    .toPromise()
    .then( response => {
      this.finish.emit(null);      
    })
  }
}
