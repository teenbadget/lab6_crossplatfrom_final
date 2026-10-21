# Лабораторна робота №6 - IPZ-31, Нехін Арсен

## Файли
- `lib/main.dart` - точка входу, відкриває екран авторизації.
- `lib/widgets/sign_in_screen.dart` - авторизація.
- `lib/widgets/signup_screen.dart` - реєстрація.
- `lib/widgets/reset_password_screen.dart` - відновлення пароля.
- `assets/flutter_logo.png` - локальний логотип, використаний через `Image.asset`.

## Як додати до наявного Flutter-проєкту
1. Скопіювати папки `lib/widgets` та `assets` у корінь Flutter-проєкту, а `lib/main.dart` замінити на файл із цього архіву.
2. У вже наявному `pubspec.yaml` у секції `flutter:` додати рядки:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/flutter_logo.png
```

Не дублюйте секцію `flutter:` якщо вона вже є - додайте тільки рядок `assets:` та шлях до картинки всередину неї.
3. У терміналі кореня проєкту виконати:

```powershell
flutter pub get
flutter run
```

## Примітка
Це навчальний макет інтерфейсу. Перевірки полів і діалогові вікна працюють локально; серверна авторизація, створення облікового запису та фактичне надсилання листа для відновлення пароля не підключені.
