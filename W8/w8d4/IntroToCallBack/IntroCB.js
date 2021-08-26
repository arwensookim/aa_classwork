// class Clock {
//   constructor() {
//     let date = new Date();   

//     this.hours = date.getHours();
//     this.minutes = date.getMinutes();
//     this.seconds = date.getSeconds();

//     this.printTime();
//     setInterval(this._tick.bind(this), 1000);
//   };

//   printTime() {
//     let time = `${this.hours}:${this.minutes}:${this.seconds}`;
//     console.clear();
//     console.log(time);
//   };

//   _tick() {
//     this.seconds += 1;
//     if (this.seconds === 60) {
//       this.seconds = 0;
//       this.minutes += 1;
//       if (this.minutes === 60) {
//         this.hours += 1;
//         this.minutes = 0;
//         if (this.hours === 24) {
//           this.hours = 0;
//         }
//       }
//     }
//     this.printTime();
//   };
// }

// let myClock = new Clock();

// 

const readline = require("readline");

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// function addNumbers(sum, numsLeft, completionCallback) {
//     if (numsLeft > 0) {
//         reader.question("Put a number: ", num => {
//             let currentNum = parseInt(num);
//             sum += currentNum;
//             console.log(sum);
//             addNumbers(sum, numsLeft-1, completionCallback);
//         })
//     } else {
//         completionCallback(sum);
//     }
// }

// addNumbers(0, 5, sum => console.log(`Total Sum: ${sum}`));

// 

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {

    }
}

function askIfGreaterThan(ele1, ele2, callback) {
    reader.question(`Is ${ele1} greater than ${ele2}?`, response => {
        if (response === 'Yes') {
            callback(true);
        } else {
            callback(false);
        }
    })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {

}

absurdBubbleSort([3, 2, 1], function (arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
});