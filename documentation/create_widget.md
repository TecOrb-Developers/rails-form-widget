## Create Embeddable JavaScript Widgets using Ruby on Rails

We are creating a JavaScript countdown timer for the users so they can embed it into any websites via script tag

### Step 1: Setup rails project for the widget

```
rails new embeddable_js_widget -d mysql
```

We are using mysql above

### Step 2: Generate scaffold to create CURD for any entity

Here we are generating scaffold for the counter.

```
rails generate scaffold Counter end_date:datetime text:string

```

### Step 3: Create and Migrate the databse

```
rails db:create

rails db:migrate
```

### Step 4: Edit routes.rb and set root to counters#index:

```
# config/routes.rb
Rails.application.routes.draw do
 resources :counters
 root “counters#index”
end
```

### Step 5: Create a new partial file for the widget:

```
app/views/counters/_counterwidget.html.erb
```

Copy and paste below code to run js counter for the end_date created by the new counter section

```
<h1>Counter</h1>
<!-- Display the countdown timer in an element -->
  <p id="demo"></p>
</div>

<script>
 // Set the date we're counting down to
var countDownDate = new Date("<%= counter.end_date %>").getTime();
// Update the count down every 1 second
var x = setInterval(function() {234

// Get todays date and time
  var now = new Date().getTime();
    
  // Find the distance between now and the count down date
  var distance = countDownDate - now;
    
  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
  // Output the result in an element with id="demo"
  if (days > 0) {
  document.getElementById("demo").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";
  }
  else {
  document.getElementById("demo").innerHTML = hours + "h "
  + minutes + "m " + seconds + "s ";
  }
    
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "<%= counter.text %>";
  }
}, 1000);
</script>
```

For CSS/Js we want in widget: We need to add internal css/Js on same render partial so these can load on other sites when this render partial will be called.

```
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<div class="container">
  <h1>Counter</h1>
<!-- Display the countdown timer in an element -->
  <p id="demo"></p>
  <button class="btn btn-success btn-sm">We are ready</button>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
 // Set the date we're counting down to
var countDownDate = new Date("<%= counter.end_date %>").getTime();
// Update the count down every 1 second
var x = setInterval(function() {234

// Get todays date and time
  var now = new Date().getTime();
    
  // Find the distance between now and the count down date
  var distance = countDownDate - now;
    
  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
  // Output the result in an element with id="demo"
  if (days > 0) {
  document.getElementById("demo").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";
  }
  else {
  document.getElementById("demo").innerHTML = hours + "h "
  + minutes + "m " + seconds + "s ";
  }
    
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "<%= counter.text %>";
  }
}, 1000);
</script>

```

### Step 6: Next, we need a file that will render our counter via JavaScript. 

Create a new file in app/views/counters/show.js.erb and paste the following code:

```
document.write("<%= j(render(:partial => 'counterwidget', :locals => {:counter => @counter}).html_safe) %>");
```

### Step 7: Lastly, we need to add protect_from_forgery except: [:show] in our counters_controller.rb to permit cross-origin JavaScript embedding for our show action.


#### Now you can embed the countdown timer widget on any site using the following script:

```
<script type=”text/javascript” src=”http://localhost:3000/counters/1.js"></script>
```