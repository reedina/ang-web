import { Component } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app';

  constructor(private http: Http) {

  }

  sendToAPI(value: any) {
    console.log(value);
    var options = new RequestOptions({
      headers: new Headers({
        'Content-Type': 'application/json'
      })
    });

    // http://jsonplaceholder.typicode.com/users
    // http://localhost:4040/api/teams

    this.http.get("http://localhost:4040/api/teams",options)
    .subscribe(
      data =>console.log("success!", data),
      error => console.log("could NOT post because", error)
    )
  }
}
