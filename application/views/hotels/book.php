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

<div class="row">
    <h1>Book a Room</h1>
    <h2>Name</h2>
</div>
<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
<div class="bootstrap-iso">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <form method="post" action="<?=base_url()?>hotels/payment">
                    <input type="hidden" name="hotel_id" value="<?=$hotel_id?>">

                    <!-- start date input-->
                    <div class="container">
                        <div class='col-md-4'>
                            <div class="form-group">
                                <div class="form-group"> <!-- Date input -->
                                    <label class="control-label" for="date">Start Date</label>
                                    <input class="form-control" id="start_date" name="start_date" placeholder="MM/DD/YYY" type="text"/>
                                </div>
                            </div>
                        </div>
                        <!-- end date input-->
                        <div class='col-md-4'>
                            <div class="form-group">
                                <div class="form-group"> <!-- Date input -->
                                    <label class="control-label" for="date">End Date</label>
                                    <input class="form-control" id="end_date" name="end_date" placeholder="MM/DD/YYY" type="text"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group ">
                        <label class="control-label " for="room_type">
                            Room Type
                        </label>
                        <select class="select form-control" id="room_type" name="room_type">
                            <?php

                            foreach($room_types as $rt)
                            {
                                echo("<option value=\"$rt->Rtype\">
                                $rt->Rtype
                                </option>");
                            }

                            ?>

                        </select>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="breakfast_type">
                            Breakfast Type
                        </label>
                        <select class="select form-control" id="breakfast_type" name="breakfast_type">

                            <?php
                            foreach ($breakfast_info as $b)
                            {

                                echo("<option value=\"$b->BType\">
                                $b->BType
                                </option>");
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="num_guests">
                            Number of guests
                        </label>
                        <select class="select form-control" id="num_guests" name="num_guests">
                            <option value="1">
                                1
                            </option>
                            <option value="2">
                                2
                            </option>
                        </select>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="num_breakfast">
                            Number of breakfast orders
                        </label>
                        <select class="select form-control" id="num_breakfast" name="num_breakfast">
                            <option value="1">
                                1
                            </option>
                            <option value="2">
                                2
                            </option>
                        </select>
                    </div>
                    <div class="form-group">
                        <div>
                            <button class="btn btn-primary " name="submit" type="submit">
                                Next
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

    <hr>

<?
$this->load->view('footer');

?>

<script>
    $(document).ready(function(){
        var start_date_input=$('input[name="start_date"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        var options={
            format: 'mm/dd/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        };
        start_date_input.datepicker(options);

        var end_date_input=$('input[name="end_date"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        var options={
            format: 'mm/dd/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        };
        end_date_input.datepicker(options);
    })
</script>