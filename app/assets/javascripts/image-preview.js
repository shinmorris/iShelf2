
// <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
// <script>
// $(function(){
//     $('#file').change(function(){
//         $('img').remove();
//         var file = $(this).prop('files')[0];
//         if(!file.type.match('image.*')){
//             return;
//         }
//         var fileReader = new FileReader();
//         fileReader.onloadend = function() {
//             $('#result').html('<img src="' + fileReader.result + '"/>');
//         }
//         fileReader.readAsDataURL(file);
//     });
// });

// </script>

// $(function() {
//  function readURL(input) {
//    if (input.files && input.files[0]) {
//      var reader = new FileReader();
//      reader.onload = function (e) {
//        $('#img_prev').attr('src', e.target.result);
//      }
//      reader.readAsDataURL(input.files[0]);
//    }
//  }
//  $("#book_img").change(function(){
//    readURL(this);
//  });
// });
// pt>

// $(function() {
//  function readURL(input) {
//    if (input.files && input.files[0]) {
//      var reader = new FileReader();
//      reader.onload = function (e) {
//        $('#img_prev').attr('src', e.target.result);
//      }
//      reader.readAsDataURL(input.files[0]);
//    }
//  }
//  $("#book_img").change(function(){
//    readURL(this);
//  });
// });
