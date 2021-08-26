class Clock {
  constructor() {
    let date = new Date();   

    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

    this.printTime();

    setInterval(this._tick.bind(this),1000);

  };

  printTime() {
    console.log(this);
    let time = `${this.hours}:${this.minutes}:${this.seconds}`;
    console.log(time);
    
  };

  _tick() {
    console.log("this is inside the tick function", this);
    this.seconds += 1;
    if (this.seconds === 60) {
      this.seconds = 0;
      this.minutes += 1;
      if (this.minutes === 60) {
        this.hours += 1;
        this.minutes = 0;
        if (this.hours === 24) {
          this.hours = 0;
        }
      }
    }
    this.printTime();
  };

}

let myClock = new Clock();
console.log(myClock);