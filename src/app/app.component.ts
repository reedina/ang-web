import { Component } from '@angular/core';
import { Http } from '@angular/http';

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
    this.http.post("http://spm:4040/api/team",value)
    .subscribe(
      data =>console.log("success!", data),
      error => console.log("could NOT pots because", error)
    )
  }
}
