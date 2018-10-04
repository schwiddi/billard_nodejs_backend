// get nodemailer
const nodemailer = require('nodemailer');

// set smtp settings
const smtpConfig = {
  host: 'smtp.gmail.com',
  port: 587, // 465 / 587
  tls: {
    ciphers: 'SSLv3',
    rejectUnauthorized: false
  },
  debug: false,
  auth: {
    user: 'r21billard@gmail.com',
    pass: 'ibdb2015dS$'
  }
};

// create transport middleware with smtpconfig
var transporter = nodemailer.createTransport(smtpConfig);

// write mail
var mailOptions = {
  from: 'r21billard@gmail.com',
  to: 'schwiddi@me.com',
  subject: 'Sending Email using Node.js',
  text: 'That was easy!'
};

// send mail
transporter.sendMail(mailOptions, function(error, info) {
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});
