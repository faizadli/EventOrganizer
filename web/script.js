$(document).ready(function () {
    var currentLocation = window.location.pathname.split("/").pop();
    $('.nav__link').each(function () {
        var linkPage = $(this).attr('href').split("/").pop();
        if (linkPage === currentLocation) {
            $(this).addClass('active');
        }
    });
});

// SHOW MENU
const showMenu = (toggleId, navId) => {
    const toggle = document.getElementById(toggleId),
        nav = document.getElementById(navId);

    if (toggle && nav) {
        toggle.addEventListener('click', () => {
            nav.classList.toggle('show');
        });
    }

    // REMOVE MENU
    const navLink = document.querySelectorAll('.nav__link');

    function linkAction() {
        nav.classList.remove('show');
    }

    navLink.forEach(n => n.addEventListener('click', linkAction));
};

showMenu('nav-toggle', 'nav-menu');



window.addEventListener("scroll", function() {
    var header = document.querySelector(".l-header");
    var scrollPos = window.scrollY;

    if (scrollPos > 100) {
        header.classList.add("l-header-black");
    } else {
        header.classList.remove("l-header-black");
    }
});

// Slider Initialization
document.addEventListener('DOMContentLoaded', function () {
    var TrandingSlider = new Swiper('.tranding-slider', {
        effect: 'coverflow',
        grabCursor: true,
        centeredSlides: true,
        loop: true,
        slidesPerView: 'auto',
        coverflowEffect: {
            rotate: -5,
            stretch: 10,
            depth: 110,
            modifier: 2.5,
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        }
    });
});

// Popup Initialization
document.addEventListener("DOMContentLoaded", function () {
    const buttons = document.querySelectorAll("button[id^='openPopup']");
    const popups = document.querySelectorAll(".popup");
    const overlays = document.querySelectorAll(".overlay");
    const closes = document.querySelectorAll(".close");

    buttons.forEach((button, index) => {
        button.addEventListener("click", function (event) {
            event.preventDefault();
            popups[index].style.display = "block";
            overlays[index].style.display = "block";
            document.body.style.overflow = "hidden"; // Menghilangkan scroll pada latar belakang
        });
    });

    closes.forEach((close, index) => {
        close.addEventListener("click", function () {
            popups[index].style.display = "none";
            overlays[index].style.display = "none";
            document.body.style.overflow = ""; // Mengembalikan scroll pada latar belakang
        });
    });

    overlays.forEach((overlay, index) => {
        overlay.addEventListener("click", function () {
            popups[index].style.display = "none";
            overlays[index].style.display = "none";
            document.body.style.overflow = ""; // Mengembalikan scroll pada latar belakang
        });
    });
});

// SCROLLER ANIMATION
const scrollers = document.querySelectorAll('.scroller');

if (!window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
    addAnimation();
}

function addAnimation() {
    scrollers.forEach(scroller => {
        scroller.setAttribute("data-animated", true);

        const scrollerInner = scroller.querySelector(".scroller-inner");
        const scrollerContent = Array.from(scrollerInner.children);

        scrollerContent.forEach(item => {
            const duplicatedItem = item.cloneNode(true);
            duplicatedItem.setAttribute("aria-hidden", true);
            scrollerInner.appendChild(duplicatedItem);
        });
    });
}

// Form Validation and Submission
document.getElementById('contactForm').addEventListener('submit', function (event) {
    event.preventDefault();

    let isValid = true;
    const fields = ['full-name', 'email', 'phone', 'date', 'location', 'service', 'message'];
    let formData = {};

    fields.forEach(field => {
        const input = document.getElementById(field);
        if (!input.value.trim() ||
            (field === 'email' && !validateEmail(input.value)) ||
            (field === 'phone' && !validatePhoneNumber(input.value))) {
            isValid = false;
            input.style.border = '2px solid red';
        } else {
            input.style.border = 'none';
            formData[field] = input.value.trim();
        }
    });

    if (isValid) {
        const whatsappNumber = '+6281282103395';
        const whatsappMessage = `Full Name: ${formData['full-name']}\nEmail: ${formData['email']}\nPhone: ${formData['phone']}\nDate: ${formData['date']}\nLocation: ${formData['location']}\nService: ${formData['service']}\nMessage: ${formData['message']}`;
        const whatsappURL = `https://wa.me/${whatsappNumber}?text=${encodeURIComponent(whatsappMessage)}`;

        window.open(whatsappURL, '_blank');
        alert('Form submitted successfully!');
    } else {
        alert('Please fill out all required fields correctly.');
    }
});

// Set current date in date field
document.addEventListener('DOMContentLoaded', function () {
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');
    const currentDate = `${year}-${month}-${day}`;
    document.getElementById('date').value = currentDate;
});

// Validation functions
function validateEmail(email) {
    const re = /^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/;
    return re.test(email);
}

function validatePhoneNumber(phone) {
    const re = /^[0-9]{10,13}$/;
    return re.test(phone);
}