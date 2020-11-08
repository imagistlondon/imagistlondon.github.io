# Imagist Website

This is the code for the imagistlondon.github.io website.

This works as a github page (https://pages.github.com).

It is coded against the flutter platform (Flutter Docs: https://flutter.dev/docs)

### GitHub Pages

The github account is `@imagistlondon`, thus we have defined a repository with the form `<username>.github.io` or specifically `imagistlondon.github.io`.

By simply creating a repo with this specific name, GitHub automatically picks this code up and hosts at the domain https://imagistlondon.github.io. It is a free service, as long as the repositry remains public (i.e the code is available to the public to see).

We can also set a custom domain for this GitHub Page, for e.g https://imagistlondon.com or https://www.imagistlondon.com.

See [Setting up a custom domain for Github Pages](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/configuring-a-custom-domain-for-your-github-pages-site).

The site pages are served from the `docs` folder.

This `docs` folder (and its files) is generated from the githb action process (See GitHub Actions below).

### App code

The app code is all in the `app` folder.

In here, the main folder is the `app/lib` folder where the main code lives.


### GitHub Actions

Every time a commit is made the `master` branch, a github action runs build a release version of the code and copies the output files to the `/docs` folder.

To see the the definition of this process, you can see `.github/workflows/publish.yml`.

### Development

- Install Flutter (https://flutter.dev/docs/get-started/install)

- Checkout this repository (via git)

- Open terminal and go to the app folder: `cd app`

- Setup flutter:

```
flutter channel master
flutter upgrade
flutter config --enable-web
flutter doctor
```

- Run the app:

In Visual Studio Code, select `main.dart` and select the Play button in top right. This will open Chrome.

or 

```
flutter run -d chrome
```