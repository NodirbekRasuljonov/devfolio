const {onRequest} = require("firebase-functions/v2/https");
const {defineSecret} = require("firebase-functions/params");
const nodemailer = require("nodemailer");

const gmailUser = defineSecret("GMAIL_USER");
const gmailAppPassword = defineSecret("GMAIL_APP_PASSWORD");

const RECIPIENT = "nodirbekmaqsudjonovich@gmail.com";
const EMAIL_REGEX = /^[\w.-]+@([\w-]+\.)+[\w-]{2,}$/;

exports.sendContactEmail = onRequest(
  {secrets: [gmailUser, gmailAppPassword], cors: true, region: "us-central1"},
  async (req, res) => {
    if (req.method !== "POST") {
      res.status(405).json({error: "Method not allowed"});
      return;
    }

    const {name, email, message} = req.body || {};

    if (
      typeof name !== "string" || !name.trim() ||
      typeof email !== "string" || !EMAIL_REGEX.test(email.trim()) ||
      typeof message !== "string" || !message.trim()
    ) {
      res.status(400).json({error: "Invalid or missing fields"});
      return;
    }

    const transporter = nodemailer.createTransport({
      service: "gmail",
      auth: {
        user: gmailUser.value(),
        pass: gmailAppPassword.value(),
      },
    });

    try {
      await transporter.sendMail({
        from: `"DevFolio Contact" <${gmailUser.value()}>`,
        to: RECIPIENT,
        replyTo: email.trim(),
        subject: `Portfolio contact from ${name.trim()}`,
        text: `Name: ${name.trim()}\nEmail: ${email.trim()}\n\n${message.trim()}`,
      });
      res.status(200).json({success: true});
    } catch (err) {
      console.error("Failed to send contact email", err);
      res.status(500).json({error: "Failed to send email"});
    }
  },
);
