# imagistlondon.github.io

This is the code for the imagistlondon.github.io website.

This works as a github page (https://pages.github.com).

It is coded against the flutter platform (Flutter Docs: https://flutter.dev/docs)

### GitHub Pages

The github account is `@imagistlondon`, thus we have defined a repository with the form `<username>.github.io` or specifically `imagistlondon.github.io`.

By simply creating a repo with this specific name, GitHub automatically picks this code up and hosts at the domain https://imagistlondon.github.io. It is a free service, as long as the repositry remains public (i.e the code is available to the public to see).

We can also set a custom domain for this GitHub Page, for e.g https://imagistlondon.com or https://www.imagistlondon.com.

See (Setting up a custom domain for Github Pages)[https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/configuring-a-custom-domain-for-your-github-pages-site].




## Run App

In Visual Studio Code, select `main.dart` and select the Play button in top right. This will open Chrome.

or 

```
flutter run -d chrome
```


## Upgrade flutter

```
flutter channel master
flutter upgrade
flutter config --enable-web
flutter doctor
```