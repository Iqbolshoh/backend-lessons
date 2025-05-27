<?php
$data = [
    [
        "name" => "Frontend",
        "description" => "Veb-saytlarning ko'rinishi va foydalanuvchi bilan o'zaro aloqasi uchun HTML, CSS, JavaScript, TypeScript, React, Vue.js va Angular texnologiyalari ishlatiladi."
    ],
    [
        "name" => "Backend",
        "description" => "Server tomoni mantiqi va ma'lumotlarni qayta ishlash Node.js, PHP, Python, Java, Ruby, C# va Go kabi texnologiyalar yordamida amalga oshiriladi."
    ],
    [
        "name" => "Database",
        "description" => "MySQL, PostgreSQL, MongoDB, SQLite, Redis va Oracle kabi tizimlar yordamida ma'lumotlarni saqlash va ularga murojaat qilish boshqariladi."
    ],
    [
        "name" => "Mobile Development",
        "description" => "Swift, Kotlin, Flutter, React Native va Xamarin yordamida telefon va planshetlar uchun ilovalar yaratiladi."
    ],
    [
        "name" => "Artificial Intelligence",
        "description" => "AI va ML sohalarida Python, TensorFlow, PyTorch, Keras, OpenAI API va boshqa vositalar yordamida mashina o‘rganish tizimlari yaratiladi."
    ],
    [
        "name" => "Cybersecurity",
        "description" => "Tizimlarni himoya qilish, zaifliklarni aniqlash va hujumlarga qarshi chora ko‘rish uchun Ethical Hacking, Kali Linux, Burp Suite, Metasploit va boshqa vositalar ishlatiladi."
    ],
    [
        "name" => "Game Development",
        "description" => "Video o‘yinlar yaratish uchun Unity, Unreal Engine, C#, C++, Blender va boshqa vositalardan foydalaniladi."
    ],
    [
        "name" => "Cloud Technologies",
        "description" => "Ma'lumotlarni saqlash, serverlarni boshqarish va xizmatlarni internet orqali taqdim etish uchun AWS, Azure, Google Cloud, Firebase ishlatiladi."
    ]
];

header('Content-Type: application/json');
echo json_encode($data);
?>