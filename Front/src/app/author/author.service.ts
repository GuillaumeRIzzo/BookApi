import { Injectable } from '@angular/core';
import { Author } from './author';
import { AuthService } from '../auth/authService.service';
import axios from 'axios';

@Injectable({
  providedIn: 'root'
})
export class AuthorService {

  constructor(private authService: AuthService) { }
	
	ngOnInit(): void {
	}

	async getAuthors(): Promise<Author[]> {
    let url = `${this.authService.apiUrl}Authors`

    var results = await axios.get<Author[]>(url);

    const { data = results.data } = results;

    return data;
  }


  async getAuthor(authorId: number): Promise<Author> {
    let url = `${this.authService.apiUrl}Authors/${authorId}`
   
    var results = await axios.get<Author>(url);

    const { data = results.data } = results;

    return data;
  }
	async AddAuthor(author: Author) {
    const token = this.authService.getToken();
    if (!token) {
      throw new Error('Token not available');
    }

    try {
      const response = await axios.post(`${this.authService.apiUrl}Authors`, author, {
        headers: { Authorization: `Bearer ${token}` }
      });
      return response.data;
    } catch (error) {
      console.error('Error fetching data:', error);
      throw error;
    }
  }
}
