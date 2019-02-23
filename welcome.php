<?php
/**
 * Fuel is a fast, lightweight, community driven PHP 5.4+ framework.
 *
 * @package    Fuel
 * @version    1.8.1
 * @author     Fuel Development Team
 * @license    MIT License
 * @copyright  2010 - 2018 Fuel Development Team
 * @link       http://fuelphp.com
 */

/**
 * The Welcome Controller.
 *
 * A basic controller example.  Has examples of how to set the
 * response body and status.
 *
 * @package  app
 * @extends  Controller
 */
class Controller_Welcome extends Controller
{
	/**
	 * The basic welcome message
	 *
	 * @access  public
	 * @return  Response
	 */
	public function action_index()
	{
		$coupon_code = 'ABCDEF';
		$member_id = 1;

		$query = "
			SELECT
					coupon.coupon_id,
					coupon.coupon_name,
					count(DISTINCT coupon_used.coupon_used_id) as coupon_used_count,
					count(DISTINCT coupon_relation_product.coupon_relation_product_id) as coupon_product_count
			FROM
					coupon_code



				INNER JOIN
					coupon
				ON
					coupon.coupon_id = coupon_code.coupon_id



				LEFT JOIN
					coupon_used
				ON
					coupon_used.coupon_id = coupon.coupon_id

				LEFT JOIN
					coupon_relation_product
				ON
					coupon_relation_product.coupon_id = coupon.coupon_id

				LEFT JOIN
					cart
				ON
					cart.product_id = coupon_relation_product.product_id
				AND
					cart.member_id = :member_id



			WHERE
					coupon_code.coupon_code = :coupon_code
			AND
					coupon_code.coupon_code_used = 0

					
			GROUP BY
					coupon.coupon_id
		";
		$result = DB::query($query)->bind('coupon_code', $coupon_code)->bind('member_id', $member_id)->execute();

		// print_r($result->as_array());

		header("Content-Type: application/json; charset=utf-8");
		return json_encode($result->as_array());

		// return Response::forge(View::forge('welcome/index'));
	}

	/**
	 * A typical "Hello, Bob!" type example.  This uses a Presenter to
	 * show how to use them.
	 *
	 * @access  public
	 * @return  Response
	 */
	public function action_hello()
	{
		return Response::forge(Presenter::forge('welcome/hello'));
	}

	/**
	 * The 404 action for the application.
	 *
	 * @access  public
	 * @return  Response
	 */
	public function action_404()
	{
		return Response::forge(Presenter::forge('welcome/404'), 404);
	}
}
