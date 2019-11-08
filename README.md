

# Catalyst-With-Apple-Sign-In
This "Mac Catalyst With Apple Sign In" Demo is very simple &amp; easy to understand about How to developer Catalyst app and sign with Apple. This demo includes Login screen, sign with apple and home screen.

![image](/Media/0.png)

**Create a version of your iPad app that users can run on a Mac device.**

With Mac Catalyst, you can make a Mac version of your iPad app. Click the Mac checkbox in your iPad app’s project settings to configure the project to build both Mac and iPad versions of your app.
 
![image](/Media/1.png)

The two apps share the same project and source code, making it easy to change your code in one place.

When you use Mac Catalyst to create a Mac version of your iPad app, you make your app available to a new audience while giving existing users the opportunity to enjoy it in a new environment.

# How to use Sign in with Apple

Sign in with Apple is the fast, easy, and more private way to sign into apps and websites using the Apple ID that you already have.

# About Sign in with Apple

When you see a Sign in with Apple button on a participating app or website, it means you can set up an account and sign in with your Apple ID. Instead of using a social media account, or filling out forms and choosing another new password, just tap the Sign in with Apple button, review your information, and sign in quickly and securely with Face ID, Touch ID, or your device passcode.
 
 
Sign in with Apple is built from the ground up to respect your privacy and keep you in control of your personal information. At your first sign in, apps and websites can ask only for your name and email address to set up an account for you. You can use Hide My Email—Apple's private email relay service—to create and share a unique, random email address that forwards to your personal email. That way you can receive useful messages from the app without sharing your personal email address. Only the registered app or site developer can communicate with you using this email, and you can turn it off at any time.
Sign in with Apple won’t track or profile you as you use your favorite apps and websites, and Apple retains only the information that’s needed to make sure you can sign in and manage your account.

# What you need

To sign into an app or website that offers Sign in with Apple, you need: 

- An Apple ID that uses two-factor authentication.
- To be signed in to iCloud with this Apple ID on your Apple device.

Sign in with Apple is available with participating apps on Apple devices with the latest software—iOS 13 or later, iPadOS 13 or later, watchOS 6 or later, macOS Catalina 10.15 or later, and tvOS 13 or later—and with participating websites in Safari. You can also use Sign in with Apple with other web browsers and on other platforms, like Android or Windows.

 
# Use Sign in with Apple on your Apple device

Using Sign in with Apple is quick and easy on any Apple device with the latest software. Make sure you're signed in with your Apple ID on your device. 

1. Tap the Sign in with Apple button on the participating app or website. 
2. If the app or site has not requested any information to set up your account, check that your Apple ID is correct and go to Step 4.
3. If you're asked to provide your name and email address, Sign in with Apple automatically fills in the information from your Apple ID. You can edit your name if you like and choose Share My Email or Hide My Email. 
4. Tap Continue and confirm with a quick Face ID, Touch ID, or device passcode to sign in. If you don't have Face ID, Touch ID, or a passcode set up, enter your Apple ID password. 

As long as you remain signed in on your device, you will automatically stay signed in to most apps. 

If you need to sign in again, just tap the Sign in with Apple button again and complete a simple Face ID, Touch ID, or passcode confirmation. It works the same way on your other Apple devices that you're signed into with the same Apple ID.


![image](/Media/2.png)

# Use Sign in with Apple on other platforms


![image](/Media/3.png)

Many apps are available across Apple devices, the web, and other platforms like Android or Windows. Developers can add Sign in with Apple anywhere they offer their app or service, so you can sign in quickly and easily.

1. Tap the Sign in with Apple button on the participating app or website.  
2. When you see a secure, Apple-hosted webpage, enter your Apple ID and password. 
3. The first time you sign in, you're prompted for a verification code from your trusted Apple device or phone number. Check your device and enter the code. On the web, you can skip this step for 30 days after your initial sign in by choosing to trust the browser you are currently using.
4. If the app or site has not requested any information to set up your account, check that your Apple ID is correct and go to Step 6. 
5. If you're asked to provide your name and email address, Sign in with Apple automatically fills in the information from your Apple ID. You can edit your name if you like and choose Share My Email or Hide My Email.
6. Tap Continue to complete the sign-in process.

# iOS 13 - How to Integrate Sign In with Apple in your Application?

In iOS 13 at WWDC 2019, Apple introduces a fast, easy way to sign in to apps and websites i.e. Sign In with Apple. Sign In with Apple allows you to set up a user account in your application with name, verified email address, and unique stable identifiers that allow the user to sign in to your app with their Apple ID.
Sign In with Apple works on iOS, macOS, tvOS, and watchOS. You can also add Sign In with Apple to your website or versions of your app running on other platforms. Once a user sets up their account, they can sign in anywhere you deploy your app.
 
1. Configure Project

![image](/Media/4.png)


- Add the Sign In with Apple capability in your project. This will add an entitlement that lets your app use Sign In with Apple.

![image](/Media/5.png)


2. Add Apple Login Button

AuthenticationServices framework provides ASAuthorizationAppleIDButton to enables users to initiate the Sign In with Apple flow. Adding this button is very simple you just need to create an instance of ASAuthorizationAppleIDButton and add a target for touchUpInside action. After that you can add this button in your view.

3. Handle Login Button Press

Now on the press of Sign In with Apple Button, we need to use a provider (ASAuthorizationAppleIDProvider) to create a request (ASAuthorizationAppleIDRequest), which we then use to initialize a controller (ASAuthorizationController) that performs the request.
We can use one or more of ASAuthorization.Scope values in the requestedScopes array to request certain contact information from the user. Here the complete implementation of handleLogInWithAppleIDButtonPress action which we used in last step -

4. Existing Account Setup Flow

There are huge possibility of user meight already logged in with your application. For that, we need to use both ASAuthorizationAppleIDProvider and ASAuthorizationPasswordProvider provider to create the request, which we then use to initialize a controller (ASAuthorizationController) that performs the request.

- ASAuthorizationPasswordProvider is a mechanism for generating requests to authenticate users based on their Apple ID
- ASAuthorizationPasswordProvider is a mechanism for generating requests to perform keychain credential sharing.

5. Handle ASAuthorizationController Delegate and Presentation Context

On success, the ASAuthorizationController delegate receives an authorization (ASAuthorization) containing a credential (ASAuthorizationAppleIDCredential) that has an opaque user identifier.
 
5.1 ASAuthorizationController Delegate
     
authorizationController(controller: didCompleteWithError:) tells the delegate that authorization failed, and provides an error to explain why.

authorizationController(controller: didCompleteWithAuthorization:) tells the delegate that authorization completed successfully.

5.2 ASAuthorizationController Presentation Context Providing

presentationAnchor(controller:) Tells the delegate from which window it should present content to the user. Required.

6. Configuring your Apple Developer Account

When you try to sign in, you'll see an AUTH_ALERT_SIGN_UP_NOT_COMPLETED error message. Signing in won't work in your application until you create a key with Sign in with Apple enabled in your developer account.

To enable Sign In with Apple in your developer account you need to create an Auth Key with Sign In with Apple.

![image](/Media/6.png)

If you don’t see the Sign in with Apple listed when you create a key the you're probably in an Enterprise team. Just creating the key should sufficient for now, you will only need to download it when you want to support Sign in with Apple from somewhere other than your application.

If you're creating a key for grouped app then create a key for your primary App ID in order to implement Sign In with Apple. This key will also be used for any App IDs grouped with the primary. The user will see your primary app's icon at sign in and in their Apple ID account settings.


**Here the complete flow of LogIn with Apple.**

7. Reset an Existing Account

If you need to reset an existing account to test the first Sign In experience again then open the Settings app on your iOS device, tap your account in the Apple ID header, proceed to Password & security. Find your application under Applications using your Apple ID and swipe to delete it.

8. Check Credential State

We can use that userIdentifier which we got from ASAuthorizationAppleIDCredential object in last step to check the user credential state. We can get credential state for an userIdentifier by calling the getCredentialState(forUserID: completion:) method

9. Register Domains and Emails for communication

In order to contact users that use Apple's private email relay service, you need to register domains and email addresses that your organization will use for communication. To config this, open your Apple Developer Account. Now, click on More side menu on the Certificates, Identifiers & Profiles page. If you More menu item not available then you're probably in an Enterprise Team. Here the direct link to configuration page - https://developer.apple.com/account/resources/services/configure.

![image](/Media/7.png)


#By Apple

- vXcode 11.1
- iOS 13.1
- macOS 10.15.1

#Documentation

- https://developerinsider.co/ios-13-how-to-integrate-sign-in-with-apple-in-your-application/
- https://developer.apple.com/design/human-interface-guidelines/ios/overview/mac-catalyst/
- https://support.apple.com/en-us/HT210318


# LICENSE!

Catalyst-With-Apple-Sign-In is [MIT-licensed](/LICENSE).

#References

- Human Interface Guidelines for Sign in with Apple
- AuthenticationService Docs

# Conclusion

While there’s still a ton of information left to be discovered about Mac Catalyst / sign in with Apple. I hope this article has cleared up some of the major question marks. I’ll keep digging, and will report all of my new findings as soon as possible.


