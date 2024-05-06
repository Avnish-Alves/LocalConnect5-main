const slider = document.querySelector('.slider');
const slides = document.querySelectorAll('.slide');

let currentIndex = 0;
const slideWidth = slides[currentIndex].clientWidth;

function goToSlide(index) {
    slider.style.transform = `translateX(-${slideWidth * index}px)`;
    currentIndex = index;
}

function nextSlide() {
    if (currentIndex === slides.length - 1) {
        goToSlide(0);
    } else {
        goToSlide(currentIndex + 1);
    }
}

function prevSlide() {
    if (currentIndex === 0) {
        goToSlide(slides.length - 1);
    } else {
        goToSlide(currentIndex - 1);
    }
}

// Optional: Previous and Next buttons
document.querySelector('.prev').addEventListener('click', prevSlide);
document.querySelector('.next').addEventListener('click', nextSlide);

// Optional: Automatic slideshow
// setInterval(nextSlide, 3000);
