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

### Making Design Modifications

The main folder you'll be interested in is the `app/lib/config` folder.

In here you will find the following:

- `Break.dart`

This defines the breakpoints of the site, in otherwords how to determine the cutoff points between the different type of devices such as iPhone vs iPad.

- `Content.dart`

In here you will find all the content text. For e.g all the projects etc that appear in the site is here.

- `Design.dart`

This defines various design options for the site. For e.g duration times for animations as well as colors and fonts.

--

In github you can edit these files directly and commit them. Then they will automatically be deployed and published to https//imagistlondon.github.io so just refresh the page to see your changes (you may have to clear the browser cache).

### Adding Images

Add any images to the `app/assets` folder. You can just upload them via the GitHub UI.

Then in the `Content.dart` you reference any of the images via `assets/my_image.png`.

Please note that only `PNG`, `JPG` or `GIF` are supported (`SVG` images are NOT supported).

### Development

- Install Flutter (https://flutter.dev/docs/get-started/install)

- Checkout this repository (via git)

- Open terminal and go to the app folder: `cd app`

- Setup flutter:

```
cd app
flutter channel beta
flutter upgrade
flutter config --enable-web
flutter doctor
```

or

```
cd app
flutter channel beta
flutter downgrade
# choose v1.22.5
flutter config --enable-web
flutter doctor
```

- Run the app:

In Visual Studio Code, select `main.dart` and select the Play button in top right. This will open Chrome.

or 

```
flutter run -d chrome
```