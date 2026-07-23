import 'dart:convert';

import 'package:devfolio/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart'
    show FlutterPhoneDirectCaller;
import 'package:http/http.dart' as http;
import 'package:on_click/extensions/click_extension.dart';
import 'package:url_launcher/url_launcher.dart';

const String _contactFunctionUrl =
    'https://us-central1-devfolio-a136c.cloudfunctions.net/sendContactEmail';

class ContactPage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  const ContactPage({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.messageController,
  });

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String? emailError;
  String? messageError;
  bool isSending = false;

  bool validateEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}");
    return emailRegex.hasMatch(email);
  }

  void onSend() {
    if (isSending) return;

    final name = widget.nameController.text.trim();
    final email = widget.emailController.text.trim();
    final message = widget.messageController.text.trim();
    bool valid = true;

    setState(() {
      emailError = null;
      messageError = null;
      if (email.isEmpty || !validateEmail(email)) {
        emailError = "Please enter a valid email address";
        valid = false;
      }
      if (message.isEmpty) {
        messageError = "Message cannot be empty";
        valid = false;
      }
    });

    if (valid) {
      _sendContactEmail(name: name, email: email, message: message);
    }
  }

  Future<void> _sendContactEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    setState(() => isSending = true);

    try {
      final response = await http
          .post(
            Uri.parse(_contactFunctionUrl),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({"name": name, "email": email, "message": message}),
          )
          .timeout(const Duration(seconds: 15));

      if (!mounted) return;

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Message sent!")));
        widget.messageController.clear();
        widget.emailController.clear();
        widget.nameController.clear();
      } else {
        debugPrint("Contact function returned ${response.statusCode}: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to send message. Please try again.")),
        );
      }
    } catch (e) {
      debugPrint("Failed to send contact email: $e");
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send message. Please try again.")),
      );
    } finally {
      if (mounted) setState(() => isSending = false);
    }
  }

  Future<void> _shareOnTelegram() async {
    final Uri telegramUri = Uri.parse('https://t.me/+48517338792');
    if (await canLaunchUrl(telegramUri)) {
      await launchUrl(telegramUri);
      debugPrint("Telegram opened");
    } else {
      debugPrint("Could not launch Telegram");
    }
  }

  Future<void> _shareOnWhatsApp() async {
    final Uri whatsappUri = Uri.parse('https://wa.me/48517338792');
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
      debugPrint("WhatsApp opened");
    } else {
      debugPrint("Could not launch WhatsApp");
    }
  }

  Future<void> _shareOnX() async {
    final Uri xUri = Uri.parse(
      'https://twitter.com/intent/tweet?text=Check%20out%20this%20portfolio!',
    );
    if (await canLaunchUrl(xUri)) {
      await launchUrl(xUri);
      debugPrint("X opened");
    } else {
      debugPrint("Could not launch X");
    }
  }

  Future<void> _copyToClipboard() async {
    // compute layout values before any await to avoid using BuildContext
    final double snackWidth = 300.0;
    final double horizontalMargin =
        (MediaQuery.of(context).size.width - snackWidth) / 2;

    await Clipboard.setData(
      const ClipboardData(text: 'nodirbekmaqsudjonovich@gmail.com'),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.fromLTRB(horizontalMargin, 0, horizontalMargin, 20.0),
        content: SizedBox(
          width: snackWidth,
          child: Text(
            "Email copied to clipboard!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
            width: 1.0,
          ),
        ),
        backgroundColor: ColorsConst.kMainColor.withValues(alpha: 0.9),
      ),
    );

    debugPrint("Email copied to clipboard");
  }

  void _showSharingOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorsConst.kMainColor.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Share Contact",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _sharingOption(
                      icon: Icons.message_outlined,
                      label: "Telegram",
                      onTap: _shareOnTelegram,
                    ),
                    const SizedBox(width: 12.0),
                    _sharingOption(
                      icon: Icons.chat_bubble_outline,
                      label: "WhatsApp",
                      onTap: _shareOnWhatsApp,
                    ),
                    const SizedBox(width: 12.0),
                    _sharingOption(
                      icon: Icons.share_outlined,
                      label: "X (Twitter)",
                      onTap: _shareOnX,
                    ),
                    const SizedBox(width: 12.0),
                    _sharingOption(
                      icon: Icons.copy_outlined,
                      label: "Copy Email",
                      onTap: _copyToClipboard,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        );
      },
    );
  }

  Widget _sharingOption({
    required IconData icon,
    required String label,
    required Future<void> Function() onTap,
  }) {
    return GestureDetector(
      onTap: () async {
        Navigator.pop(context);
        await onTap();
      },
      child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
                  size: 28.0,
                ),
                const SizedBox(height: 8.0),
                Text(
                  label,
                  style: TextStyle(
                    color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        actionsPadding: EdgeInsets.only(right: 16.0),

        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "CON",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: "TACT",
                    style: TextStyle(
                      color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: ColorsConst.kCircleColor,

            child: Icon(Icons.share_outlined, color: Colors.white, size: 28.0),
          ).onClick(() {
            _showSharingOptions(context);
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              contactCard(
                title: "EMAIL ME",
                subtitle: "nodirbekmaqsudjonovich@gmail.com",
                icon: Icons.email_outlined,
                onTab: () async {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'nodirbekmaqsudjonovich@gmail.com',
                  );
                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri);
                    debugPrint("Email app opened");
                  } else {
                    debugPrint("Could not launch email");
                  }
                },
              ),
              SizedBox(height: 20.0),
              contactCard(
                title: "CALL ME",
                subtitle: "+48 51 733 87 92",
                icon: Icons.phone_outlined,
                onTab: () async {
                  await FlutterPhoneDirectCaller.callNumber("+48 51 733 87 92");
                  debugPrint("Phone Pressed");
                },
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Send a Message",
                          style: TextStyle(
                            color: ColorsConst.kWhiteColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          "I typically respond within 24 hours",
                          style: TextStyle(
                            color: ColorsConst.kTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    inputs(
                      inputController: widget.nameController,
                      label: "FULL NAME",
                      hint: "John Doe",
                    ),
                    SizedBox(height: 20.0),
                    inputs(
                      inputController: widget.emailController,
                      label: "EMAIL ADDRESS ",
                      hint: "john@example.com",
                      errorText: emailError,
                    ),
                    SizedBox(height: 20.0),
                    inputs(
                      inputController: widget.messageController,
                      label: "MESSAGE",
                      hint: "Tell me about your project",
                      errorText: messageError,
                    ),
                    SizedBox(height: 20.0),
                    sendBtn(isSending ? null : onSend),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton sendBtn(void Function()? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(500, 75.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: ColorsConst.kCircleColor.withValues(alpha: 0.9),
        foregroundColor: ColorsConst.kWhiteColor,
        textStyle: TextStyle(
          color: ColorsConst.kWhiteColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      child: isSending
          ? SizedBox(
              width: 24.0,
              height: 24.0,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: ColorsConst.kWhiteColor,
              ),
            )
          : Text("SEND"),
    );
  }

  SizedBox inputs({
    required TextEditingController inputController,
    required String label,
    required String hint,
    String? errorText,
  }) {
    return SizedBox(
      width: double.infinity,
      height: label == "MESSAGE" ? 265.0 : 95,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: ColorsConst.kTextColor,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextFormField(
            controller: inputController,
            cursorColor: ColorsConst.kCircleColor.withValues(alpha: 0.9),
            textAlign: TextAlign.left,
            maxLines: label == "MESSAGE" ? 8 : 1,
            style: TextStyle(color: ColorsConst.kWhiteColor),
            decoration: InputDecoration(
              hintText: hint,

              hintStyle: TextStyle(color: ColorsConst.kTextColor),
              errorText: errorText,
              errorStyle: TextStyle(
                color: Colors.redAccent,
                fontSize: 12.0,
                height: 1.2,
              ),
              errorMaxLines: 2,
              contentPadding: EdgeInsets.symmetric(vertical: 18.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
                ),
              ),
              fillColor: ColorsConst.kTextColor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contactCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Future<void> Function() onTab,
  }) {
    return Container(
      height: 90.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorsConst.kCircleColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        titleTextStyle: TextStyle(
          color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
        ),
        subtitleTextStyle: TextStyle(
          color: ColorsConst.kWhiteColor,
          fontWeight: FontWeight.w400,
        ),
        iconColor: ColorsConst.kWhiteColor,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            icon,
            color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_outward_outlined),
      ),
    ).onClick(onTab);
  }
}
