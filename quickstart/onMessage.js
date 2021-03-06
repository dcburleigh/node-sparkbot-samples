//
// Copyright (c) 2016 Cisco Systems
// Licensed under the MIT License 
//


/* 
 * a Webex Teams webhook that leverages the node-sparkbot webhook.onMessage() function.
 * note : this example requires that you've set an ACCESS_TOKEN env variable
 */

var SparkBot = require("node-sparkbot");

// Starts your Webhook with default configuration where the Webex Teams API access token is read from the ACCESS_TOKEN env variable 
var bot = new SparkBot();
 
bot.onMessage(function(trigger, message) {
 
  //
  // ADD YOUR CUSTOM CODE HERE
  //
  console.log("new message from: " + trigger.data.personEmail + ", text: " + message.text);

});

