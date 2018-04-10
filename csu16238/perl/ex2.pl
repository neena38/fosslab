#!/usr/bin/perl

#Perl-sending mail
 
$to = 'neenamathew98@gmail.com';
$from = 'neenamathew98@gmail.com';
$subject = 'Test Email';
$message = 'This is test email sent by Perl Script';
 
open(MAIL, "|/usr/sbin/sendmail -t");
 
# Email Header
print MAIL "To: $to\n";
print MAIL "From: $from\n";
print MAIL "Subject: $subject\n\n";
# Email Body
print MAIL $message;

close(MAIL);
print "Email Sent Successfully\n";
