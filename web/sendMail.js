const nodemailer = require("nodemailer");
require("dotenv").config();
// const express = require("express");
// const bodyParser = require("body-parser");

// const app = express();
// app.use(bodyParser.json());

const transporter = nodemailer.createTransport({
  service: "gmail",
  host: "smtp.gmail.com",
  port: 587,
  secure: false, 
  auth: {
    user: process.env.USER,
    pass: process.env.APP_PASSWORD,
  },
});

const mailOptions = {
  from: {
    name: "Ruby",
    address: "process.env.USER",
  }, // sender address
  to: ["nayakapoorva2003@gmail.com", "4nm21is024@nmamit.in"], // list of receivers
  subject: "Alert: Accident Occured", // Subject line
  text: "", // plain text body
  html: "<b>Accident occured. Please Report soon</b>", // html body
};

// app.post("/sendLocation", (req, res) => {
//   const { latitude, longitude } = req.body;
//   mailOptions.text = `Accident occured at coordinates: (${latitude}, ${longitude})`;
//   sendMail(transporter, mailOptions);
//   res.send("Email sent successfully"); // Send response to the client
// });

const sendMail = async (transporter, mailOptions) => {
  try {
    await transporter.sendMail(mailOptions);
    console.log("Email has been sent succesfully");
  } catch (error) {
    console.error(error);
  }
};

sendMail(transporter, mailOptions);
// app.listen(4000, () => {
//   console.log("Server is running on port 4000");
// });
