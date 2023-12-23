class PalindromeModel {
  bool isPalindrome(String input) {
    String cleanInput = input.replaceAll(RegExp(r'[^\w\s]'), '').toLowerCase();
    String reversedInput = cleanInput.split('').reversed.join('');

    return cleanInput == reversedInput;
  }
}
