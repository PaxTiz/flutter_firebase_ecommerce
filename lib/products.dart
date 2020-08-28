import 'models/product.dart';

final products = [
    Product(
        name: "Chapeau de paille",
        price: 59,
        description: "Ce super chapeau de paille vaut vraiment le coup, vous devriez tester avant qu'il ne soit plus disponible !",
        washable: true,
        washableTemp: 50,
        materials: [
            ProductMaterial(name: "Paille", percentage: 80),
            ProductMaterial(name: "Coton", percentage: 20),
        ],
        images: [
            "https://cdn.shopify.com/s/files/1/0247/2719/1642/products/photo-chapeau-de-paille-pirate_2000x.png?v=1571860951",
            "https://lh3.googleusercontent.com/proxy/Ed6Ghp44hJtVMV_mXkUv1Z7F558te7ASAHXAUjkoI9F_QnZWo7x5m9I16gftfM1kSGbqtHJRDfYWU-B82HGPjAM-VL4YXg-lYDmQKR68C-k"
        ]
    ),
    Product(
        name: "Haut de forme",
        price: 29.99,
        description: "Quoi de mieux qu'un haut de forme pour un rendez-vous chez les riches pour faire vintage ? Hein ? Rien ! Donc profiez-en vite !",
        washable: true,
        washableTemp: 30,
        materials: [
            ProductMaterial(name: "Paille", percentage: 80),
            ProductMaterial(name: "Coton", percentage: 20),
        ],
        images: [
            "https://www.le-geant-de-la-fete.com/2187-large_default/haut-de-forme-paillette.jpg",
            "https://www.equistore.fr/Files/129761/Img/12/3169501-HAUT-DE-FORME-DRESSAGE-NOIR-ELT-big.png"
        ]
    ),
    Product(
        name: "Casquette",
        price: 14.29,
        description: "Une super casquettee pour l'été !",
        washable: false,
        washableTemp: 0,
        materials: [
            ProductMaterial(name: "Paille", percentage: 80),
            ProductMaterial(name: "Coton", percentage: 20),
        ],
        images: [
            "https://www.le-geant-de-la-fete.com/2187-large_default/haut-de-forme-paillette.jpg",
            "https://www.equistore.fr/Files/129761/Img/12/3169501-HAUT-DE-FORME-DRESSAGE-NOIR-ELT-big.png"
        ]
    ),
];
