<?php

class coupon {

    /**
     * @return string
     * @throws Exception
     */
    static public function generate() {
        $length = 5;
        $uppercase = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        $numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        $characters = [];
        $coupon = '';
        $characters = array_merge($characters, $uppercase, $numbers);
        for ($i = 0; $i < $length; $i++) {
            $coupon .= $characters[mt_rand(0, count($characters) - 1)];
        }
        // $coupon = "AAAAA";
        return $coupon;
    }
    /**
     * @param int $maxNumberOfCoupons
     * @return array
     */
    static public function generate_coupons($maxNumberOfCoupons = 1) {
        $coupons = [];
        for ($i = 0; $i < $maxNumberOfCoupons; $i++) {
            $temp = self::generate();

            while (array_search($temp, $coupons) !== FALSE) {
            // while (array_search(strtoupper($temp), array_map('strtoupper', $coupons)) !== FALSE) {
                // $temp = "BBBBB";
                $temp = self::generate();
            }

            $coupons[] = $temp;
        }
        return $coupons;
    }
}

// // echo(coupon::generate());
// print_r(coupon::generate_coupons(2));
print_r(coupon::generate_coupons(5));



// $code = array("AAAAA", "BBBBB", "CCCCC");
// // while (($key = array_search("bbbbb", $code)) !== FALSE) {
// // while (($key = array_search(strtoupper('bbbbb'), array_map('strtoupper', $code))) !== FALSE) {
// while (($key = array_search(strtoupper('bbbbb'), $code)) !== FALSE) {
//     // loop will terminate 
//     unset($code[$key]); 
// } 
// print_r($code);



// UPPER
// LOWER

// SELECT first_name, last_name, phone_number
//   FROM employees
//  WHERE UPPER(last_name) = UPPER('winand')



// Str::upper('User Data'); // 返り値: 'USER DATA'
// Str::lower('User Data'); // 返り値: 'user data'











// $num= mt_rand();
// $con = mysql_connect("localhost","uname","password");
// mysql_select_db("dbname",$con);
// $sel_query  = "SELECT *  FROM  my_table WHERE rand_num =%d"; // query to select value 
// $ins_query = "INSERT INTO my_table(rand_num) VALUES(%d)";    // query to insert value
// $result =  mysql_query(sprintf($sel_query,$num),$con);
// while( mysql_num_rows($result) != 0 ) {                      // loops till an unique value is found 
//     $num = mt_rand();
//     $result = mysql_query(sprintf($sel_query,$num),$con);
// }
// mysql_query(sprintf($ins_query,$num),$con); // inserts value 






