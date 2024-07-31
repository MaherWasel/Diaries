import Utils from "../../utils/Utils";

export default class LocalStorage {
  static initApp() {
    let lang = localStorage.getItem("lang");
    if (lang) {
      Utils.lang = lang;
    }
    let userId = localStorage.getItem("userId");
    if (userId) {
      Utils.userId = userId;
    }
    let userName = localStorage.getItem("userName");
    if (userName) {
      Utils.userName = userName;
    }
  }
  static storeLanguage(newLanguage) {
    localStorage.setItem("lang", newLanguage);

    Utils.lang = newLanguage;
  }
  static storeUserId(userId) {
    localStorage.setItem("userId", userId);
    Utils.userId = userId;
  }
  static storeUserName(userName) {
    localStorage.setItem("userName", userName);
    Utils.userName = userName;
  }
}
