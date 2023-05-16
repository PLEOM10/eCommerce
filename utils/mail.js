
const nodemailer = require("nodemailer");


sendMail= async (email,product,quantity) =>{

  // create reusable transporter object using the default SMTP transport
  let transporter = nodemailer.createTransport({
    service:"Gmail", // true for 465, false for other ports
    auth: {
      user: "pranavcollege36", // generated ethereal user
      pass: "bneyntwecjtnpdvf", // generated ethereal password
    },
  });
  // send mail with defined transport object
  
  
  const mailOptions = {
    from: '"E-Commerce Site" <pranavcollege36@gmail.com>', // sender address
    to:email, // list of receivers
    subject: "Order Confirmation", // Subject line
    text: "Order Confirmed", // plain text body
    html: `<h1>Order Confirmation Mail</h1>
           <div><b> Your order : ${product} x ${quantity}</b></div>`,
  };
  
  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.log('Error occurred:', error.message);
    } else {
      console.log('Email sent:', info.response);
    }
  });

}



module.exports = {
    sendMail
}
