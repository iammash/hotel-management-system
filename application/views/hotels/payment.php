<?php
/**
 * Created by IntelliJ IDEA.
 * User: vishalkulkarni
 * Date: 4/29/17
 * Time: 9:48 PM
 */

$this->load->view('header');

?>

<hr>

<form class="form-horizontal" method="post" action="<?= base_url()?>hotels/payment_checkout">
    <fieldset>

        <!-- Form Name -->
        <legend>Bill Payment</legend>

        <? if (!$valid)
        {
            echo ("Invalid Registration details");
        }?>

        <div class="form-group ">
            <label class="col-md-4 control-label" for="number">Card Type</label>
            <div class="col-md-4">
                <select class="select form-control" id="card_type" name="card_type">
                    <option value="Visa">
                        Visa
                    </option>
                    <option value="MasterCard">
                        MasterCard
                    </option>
                </select>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="number">Card Number</label>
            <div class="col-md-4">
                <input id="username" name="cardnumber" type="text" placeholder="card number" class="form-control input-md" required="">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="number">Security Code</label>
            <div class="col-md-4">
                <input id="username" name="security_code" type="text" placeholder="cvv" class="form-control input-md" required="">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="number">Billing Address</label>
            <div class="col-md-4">
                <input id="username" name="address" type="text" placeholder="Billing Address" class="form-control input-md" required="">

            </div>
        </div>



        <!-- Button -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="submit"></label>
            <div class="col-md-4">
                <button id="submit" name="submit" class="btn btn-primary">Make Payment</button>
            </div>
        </div>

    </fieldset>
</form>



<hr>

<?
$this->load->view('footer');

?>

