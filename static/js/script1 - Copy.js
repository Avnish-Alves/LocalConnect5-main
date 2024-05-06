// // Import Firebase services using the modular SDK
// import { initializeApp } from 'firebase/app';
// import { getDatabase, ref } from 'firebase/database'; // Note the use of 'ref' for Realtime Database
// import { getFirestore } from 'firebase/firestore';

// const firebaseConfig = {
//     apiKey: "AIzaSyBaxbFLp7ffn3aH6ASHf5OAyyQIKeXUxVo",
//     authDomain: "local-connect-6350a.firebaseapp.com",
//     projectId: "local-connect-6350a",
//     storageBucket: "local-connect-6350a.appspot.com",
//     messagingSenderId: "212689090695",
//     appId: "1:212689090695:web:be11757e50b53e963ca022",
//     measurementId: "G-JJZJ0YC5Y5"
//   };

// // Initialize Firebase
// const firebaseApp = initializeApp(firebaseConfig);

// // Access Realtime Database
// const database = getDatabase(firebaseApp);
// const registrationFormDB = ref(database, 'registerationForm');

// // Access Firestore
// const firestore = getFirestore(firebaseApp);

// // Event listener for the form submission
// document.getElementById('Registerationform').addEventListener('submit', submitForm);

// function submitForm(e) {
//   e.preventDefault();
//   var Firstname = getElementVal('Fn');
//   var Lastname = getElementVal('Ln');
//   var Email = getElementVal('ml');
//   var Phno = getElementVal('Ph');
//   var GST = getElementVal('GST');
//   var Aboutsp = getElementVal('sd');
//   var Shopadd = getElementVal('sa');
//   var Username = getElementVal('un');
//   var Password = getElementVal('ps');

//   // You can use the retrieved form values as needed
//   console.log(Firstname, Lastname, Email, Phno, GST, Aboutsp, Shopadd, Username, Password);
// }

// const getElementVal = (id) => {
//   return document.getElementById(id).value;
// }
