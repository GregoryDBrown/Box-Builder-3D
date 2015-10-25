// Created by Gregory Brown
// Create/send boxes to earn money!

color grey = color(128, 128, 128);
color green = color(0, 153, 0);
color blue = color(0, 0, 204);
color purple = color(76, 0 , 153);
color orange = color(255, 128, 0);
color red = color(255, 10, 10);

// Start screen

int selection = 0;

button start_button = new button("START", 20, 350, 300, 100, 50, red);
button exit_button = new button("EXIT", 20, 350, 370, 100, 50, red);

// Game settings

// Box Tracking
int grey_box, green_box, blue_box, purple_box, orange_box;

float money = 0;
float new_money;
float money_counter;
float money_add;

int white = 210;

int timer = 0;
boolean timer_start;

int box_select;

float mouse_y_grab;
float mouse_x_grab;

float falling;

int box_size = 50;

box b1 = new box(50, 675, 0, grey);
box b2 = new box(50, 675, 0, green);
box b3 = new box(50, 675, 0, blue);
box b4 = new box(50, 675, 0, purple);
box b5 = new box(50, 675, 0, orange);

master_box mb1 = new master_box(100, 25, 250, grey);
master_box mb2 = new master_box(100, 150, 250, green);
master_box mb3 = new master_box(100, 275, 250, blue);
master_box mb4 = new master_box(100, 400, 250, purple);
master_box mb5 = new master_box(100, 525, 250, orange);

button button1 = new button("SEND", 12, 35, 200, 80, 40, grey);
button button2 = new button("SEND", 12, 160, 200, 80, 40, green);
button button3 = new button("SEND", 12, 285, 200, 80, 40, blue);
button button4 = new button("SEND", 12, 410, 200, 80, 40, purple);
button button5 = new button("SEND", 12, 535, 200, 80, 40, orange);

button create_box = new button("CREATE BOX", 25, 300, 50, 170, 60, white);
button return_to_start = new button("RETURN TO START", 12, 0, 0, 140, 30, white);
button stats = new button("SHOW / HIDE STATS", 12, 0, 30, 140, 31, white);

boolean show_stats = true;

void setup()
  {
  background(white);
  size(800, 600);
  
  // Spawn location
  mouse_y_grab = 0;
  mouse_x_grab = width - 125;
  }
  
void draw()
  {
  
  if (selection == 0)
    {
    background(153, 153, 255);
    fill(0);
    textSize(70);
    textAlign(CENTER, CENTER);
    text("BOX BUILDER 3D", 400, 140);
    
    start_button.interaction();
    exit_button.interaction();
    
    if (start_button.box_extract2 == true)
      {
      selection = 1;
      }
    if (exit_button.box_extract2 == true)
      {
      exit();
      }
      
    } 
  
  if (selection == 1)
    {
    background(249, 233, 189);
    
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text("$ " + int(new_money), 5, 550);
      
    mb1.interaction();
    mb2.interaction();
    mb3.interaction();
    mb4.interaction();
    mb5.interaction();
    
    b1.interaction();
    b2.interaction();
    b3.interaction();
    b4.interaction();
    b5.interaction();
    
    button1.interaction();
    button2.interaction();
    button3.interaction();
    button4.interaction();
    button5.interaction();
    
    create_box.interaction();
    return_to_start.interaction();
    stats.interaction();
    
    if (return_to_start.box_extract2 == true) 
      {
      selection = 0;
      }
    
    if (stats.box_extract2 == true)
      {
      if (show_stats == true)
        {
        show_stats = false;
        }
      else
        {
        show_stats = true;
        }
      }
      
    if (show_stats == true)
      {
      textAlign(LEFT);
      textSize(12);
      fill(0);
      text("Total Boxes: " + (grey_box+green_box+blue_box+purple_box+orange_box), 5, 380);
      text("Grey Boxes: " + grey_box, 5, 400);
      text("Green Boxes: " + green_box, 5, 420);
      text("Blue Boxes: " + blue_box, 5, 440);
      text("Purple Boxes: " + purple_box, 5, 460);
      text("Orange Boxes: " + orange_box, 5, 480);
      }
    
    if ((create_box.box_extract2 == true) && ((b1.box_spawn == true) || (b2.box_spawn == true) || (b3.box_spawn == true) || (b4.box_spawn == true) || (b5.box_spawn == true)))
      {
      timer_start = true;    
      }
    
    if ((create_box.box_extract2 == true) && (b1.box_spawn == false) && (b2.box_spawn == false) && (b3.box_spawn == false) && (b4.box_spawn == false) && (b5.box_spawn == false))
      {
      box_select = int(random(1, 6));
      println(box_select);
      if (box_select == 1)
        {
        b1.box_spawn = true;
        }
      if (box_select == 2)
        {
        b2.box_spawn = true;
        }
      if (box_select == 3)
        {
        b3.box_spawn = true;
        }
      if (box_select == 4)
        {
        b4.box_spawn = true;
        }
      if (box_select == 5)
        {
        b5.box_spawn = true;
        }
      }
    
    if (button1.button_col == b1.col && button1.box_extract2 == true && b1.box_extract == true)
      {
      money_add = random(1, 5);
      money_counter = .1;
      money = money + money_add;
      
      grey_box++;
      b1.box_spawn = false;
      b1.box_extract = false;
      timer_start = false;
      }
      
    if (button2.button_col == b2.col && button2.box_extract2 == true && b2.box_extract == true)
      {
      money_add = random(5, 25);
      money_counter = 1;
      money = money + money_add;
      
      green_box++;
      b2.box_spawn = false;
      b2.box_extract = false;
      timer_start = false;
      }
      
    if (button3.button_col == b3.col && button3.box_extract2 == true && b3.box_extract == true)
      {
      money_add = random(25, 100);
      money_counter = 5;
      money = money + money_add;
      
      blue_box++;
      b3.box_spawn = false;
      b3.box_extract = false;
      timer_start = false;
      }
      
    if (button4.button_col == b4.col && button4.box_extract2 == true && b4.box_extract == true)
      {
      money_add = random(100, 250);
      money_counter = 10;
      money = money + money_add;
      
      purple_box++;
      b4.box_spawn = false;
      b4.box_extract = false;
      timer_start = false;
      }
      
    if (button5.button_col == b5.col && button5.box_extract2 == true && b5.box_extract == true)
      {
      money_add = random(250, 1000);
      money_counter = 100;
      money = money + money_add;
      
      orange_box++;
      b5.box_spawn = false;
      b5.box_extract = false;
      timer_start = false;
      }
    
    if (new_money + money_counter < money)
      {
      new_money = new_money + money_counter;
      }
      
    if (new_money + money_counter >= money)
      {
      new_money = money;
      }
  
    // Pipe 
    fill(0);
    stroke(0);
    strokeWeight(2);
    line(width - 136, 0, width - 136, 100);
    line(width - 65, 0, width - 65, 100);
    rect(width - 151, 100, 101, 25);
    ellipse(width - 101, 126, 101, 25);
    
    fill(247, 37, 37);
    noStroke();
    ellipse(width - 100, 125, 100, 25);
    rect(width - 150, 100, 100, 25);
    stroke(0);
    ellipse(width - 100, 100, 100, 25);
    noStroke();
    rect(width - 135, 0, 70, 100);
    
    strokeWeight(1);
    
    if (timer_start == true)
      {
      fill(0);
      timer++;
      textSize(15);
      textAlign(LEFT);
      text("Please send current box before creating another!", width - timer, 400);
      if (timer == 1200)
        {
        timer_start = false;
        }
      }
      
    if (timer_start == false)
      {
      timer = 0;
      }
    }
  }
  
  
class box
  {
  float size, location_x, location_y;
  color col;
  boolean box_check;
  boolean hand_check;
  boolean box_extract;
  boolean box_spawn = false;
  box (float a, float x, float y, color c)
    {
    size = a;
    location_y = y;
    location_x = x;
    col = c;      
    }
    
  void interaction()
    {
    if (box_spawn == false)
      {
      location_y = 0;
      location_x = 675;
      }
      
    if (mousePressed == false)
      {
      box_check = false;
      }
      
    if ((box_check == true) && (box_spawn == true))
      {
      location_y = mouseY - size/2;
      location_x = mouseX - size/2;
      falling = 0;
      }
    
    if ((location_y < height - (size + 1)) && (box_check != true) && (box_extract != true) && (box_spawn == true))
      {
      falling++;
      location_y = location_y + 2*falling;
      }
    
    // Locks box to master_box
    
    if (col == grey)
      {
      if ((location_y < 350) && (location_y > 250) && 
      (location_x > 25) && (location_x < 125))
        {
        location_y = 275;  
        location_x = 50;
        box_extract = true;
        }
      }
    
    if (col == green)
      {
      if ((location_y < 350) && (location_y > 250) && 
      (location_x > 150) && (location_x < 250))
        {
        location_y = 275;  
        location_x = 175;
        box_extract = true;
        }
      }
    
    if (col == blue)
      {
      if ((location_y < 350) && (location_y > 250) && 
      (location_x > 275) && (location_x < 375))
        {
        location_y = 275;  
        location_x = 300;
        box_extract = true;
        }
      }
    
    if (col == purple)
      {
      if ((location_y < 350) && (location_y > 250) && 
      (location_x > 400) && (location_x < 500))
        {
        location_y = 275;  
        location_x = 425;
        box_extract = true;
        }
      }
     
    if (col == orange)
      {
      if ((location_y < 350) && (location_y > 250) && 
      (location_x > 525) && (location_x < 600))
        {
        location_y = 275;  
        location_x = 550;
        box_extract = true;
        }
      }
      
    // Can't drag box out of program
    if (location_y > height - (size + 1))
      {
      location_y = height - (size + 1);
      }
    if (location_y < 0)
      {
      location_y = 0;
      }
    if (location_x > width - (size + 1))
      {
      location_x = width - (size + 1);
      }
    if (location_x < 0)
      {
      location_x = 0;
      }
    
    // BOX -------------------------------------------------------------------------------------------
    fill(col);
    strokeWeight(2);
    stroke(0);
    rect(location_x, location_y, size, size);
    // -----------------------------------------------------------------------------------------------
    
    if ((mouseY > location_y) && (mouseY < location_y + size)
    && (mouseX > location_x) && (mouseX < location_x + size))
      {
      hand_check = true;
      }
    
    else
      {
      hand_check = false;
      //cursor(ARROW);
      }
      
    if (hand_check == true)
      {
      //cursor(HAND);
      fill(255, 255, 255, 75);
      rect(location_x, location_y, size, size);
      }
      
    if ((mousePressed == true)  && (mouseY > location_y) 
      && (mouseY < location_y + size) && (mouseX > location_x) 
      && (mouseX < location_x + size))
      {
      box_check = true;
      box_extract = false;
      fill(0, 0, 0, 75);
      rect(location_x, location_y, size, size);
      }  
    }    
  }
  
class master_box
  {
  float master_size, master_location_x, master_location_y;
  color master_col;
  master_box (float a, float x, float y, color c)
    {
    master_size = a;
    master_location_y = y;
    master_location_x = x;
    master_col = c;      
    }
  void interaction()
    {
    strokeWeight(0);
    fill(master_col);
    rect(master_location_x, master_location_y, master_size, master_size);
    fill(100, 100, 100, 50);
    rect(master_location_x, master_location_y, master_size, master_size);
    }
  }
  
class button
  {
  String button_text;
  float button_x, button_y, button_size_x, button_size_y;
  int text_size;
  color button_col;
  boolean box_check2;
  boolean hand_check2;
  boolean box_extract2;
  boolean no_repeat;
  button (String t, int t2, float x, float y, float a, float b, color c)
    {
    button_text = t;
    text_size = t2;
    button_x = x;
    button_y = y;
    button_size_x = a;
    button_size_y = b;
    button_col = c;
    }
  void interaction()
    {
    strokeWeight(1);
    stroke(0);
    
    fill(button_col);
    rect(button_x, button_y, button_size_x, button_size_y);
    
    if ((mouseY > button_y) && (mouseY < button_y + button_size_y)
    && (mouseX > button_x) && (mouseX < button_x + button_size_x))
      {
      hand_check2 = true;
      box_extract2 = false;
      }
    
    else
      {
      hand_check2 = false;
      box_extract2 = false;
      //cursor(ARROW);
      }
      
    if (hand_check2 == true)
      {
      //cursor(HAND);
      fill(255, 255, 255, 75);
      rect(button_x, button_y, button_size_x, button_size_y);
      }
      
    if ((mousePressed == true)  && (mouseY > button_y) && (mouseY < button_y + button_size_y)
    && (mouseX > button_x) && (mouseX < button_x + button_size_x) && (no_repeat == true))
      {
      box_check2 = true;
      box_extract2 = true;
      fill(0, 0, 0, 75);
      rect(button_x, button_y, button_size_x, button_size_y);
      no_repeat = false;
      }
    
    if (mousePressed == false)
      {
      no_repeat = true;
      }
      
    textAlign(CENTER, CENTER);
    fill(255, 255, 255, 75);
    rect(button_x, button_y, button_size_x, button_size_y);
    fill(0);
    textSize(text_size);
    text(button_text, button_x + button_size_x/2, button_y + button_size_y/2);
    }
  }
  