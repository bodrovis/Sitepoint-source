import { Injectable } from '@angular/core';
import { User } from './user.model';

@Injectable()
export class UserService {

  constructor() { }

  getUsers(): User[] {
    return [
      {
        id: 1,
        first: 'John',
        last: 'Doe'
      },
      {
        id: 2,
        first: 'Margaret',
        last: 'Brown'
      }
    ]
  }
}
