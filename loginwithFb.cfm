<!---

Login with Google
<script src="https://apis.google.com/js/platform.js" async defer></script>


<meta name="google-signin-client_id" content="25699041701-avho13aoed1pbt2ervalomamu1krr979.apps.googleusercontent.com">

<div class="g-signin2" data-onsuccess="onSignIn" id="iduser"></div>
<a href="#" onclick="signOut();">Sign out</a>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
       $('#iduser').show();
    });
  }
</script>

<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
  $('#iduser').hide();
}</script>
--->

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1505338762874721',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.8'
    });
    FB.AppEvents.logPageView();   
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>