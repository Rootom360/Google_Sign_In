# finalgooglesignin

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Google sign in implementing with firebase :

Detailed overview : 

First i add my app to flutter firebase for getting free server,
Then I created my app project and deleted boiler codes and made a new app.
Then i add google dependencies which helps us to google sign in and sign out from our app.

Google_sign_in => This package is used for authentication and sign in with a google account. 

Package Link : https://pub.dev/packages/google_sign_in

After making that I made my main.dart file and in the main.dart file I made a runApp function which does what and which page the user sees first. The syntax is like This : 

void main() => runApp(MaterialApp(
     home: login_page(),
   ));
     
     5)  Then i made a login.dart file. In the login.dart file I used a stateful widget                                                because when we want to catch the Number of pressed buttons and Data of the user    then we use this widget. The syntax is Like : 


class login_page extends StatefulWidget {
 @override
 _login_pageState createState() => _login_pageState();
}
 
class _login_pageState extends State<login_page> {
 @override
 Widget build(BuildContext context) {
   return Container(
    
   );
 }
}

6)  In stateful widget i made instance of GoogleSignIn like this :

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

7)  Then i made Two Methods one for Sign In and Other for Sign Out, and i add async and await on that, Like this : 

 _Login() async {
   try {
     await _googleSignIn.signIn();
     setState(() {
       _isLoggedIn = true;
     });
   } catch (err) {
     print(err);
   }
 }
 
 _Logout() async {
   _googleSignIn.signOut();
   setState(() {
     _isLoggedIn = false;
   });
 }
 
 

Here in _login method i used async function which make promise to catch the data from server and Then i set try and catch function for catching error, i set the await in _googlesignIn which blocks the execution of code when async doing it’s work, then i set setstate Method for making my boolean variable true(I set this bool value after making my stateful widget). And same I did with _logout button.

Boolean variable : 
bool _isLoggedIn = false;


8) After that whole setup i worked on my UI and i made one button for Logging In with the help of OutlineButton widget :

OutlineButton(
                 color: Colors.red,
                 child: Text('Login with Google'),
                 onPressed: () {
                   _Login();
                 },

9) And same i did with Logout Button :

OutlineButton(
                 color: Colors.blue,
                 child: Text('Logout'),
                 onPressed: () {
                    _Logout();
                 }),

10) Finally all work is done as you can see in my Logging In button i add onPressed Method and in onPressed Method i passed my _Login method(This method mentioned in No. 7 of the list),  and same i did with My Logout Button.
