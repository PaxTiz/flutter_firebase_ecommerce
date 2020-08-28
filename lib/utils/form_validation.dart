class FormValidation {

    static String validateEmail(String value) {
        if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)) {
            return "Veuillez entrer une adresse email valide.";
        }
        return null;
    }

    static String validatePassword(String value) {
        value = value.trim();
        if(value.length < 8) {
            return "Le mot de passe doit faire au moins 8 caractères.";
        }
        if(!value.contains(RegExp(r"[!#$%&'()*+,-./:;<=>?@[\]^_`{|}~]"))) {
            return r"Un des caractères !#$%&'()*+,-./:;<=>?@[\]^_{|}~ est requis.";
        }
        if(!value.contains(RegExp(r"[0-9]"))) {
            return "Le mot de passe doit contenir au moins un chiffre.";
        }

        return null;
    }

}
