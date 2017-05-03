<?php
/**
 * Created by IntelliJ IDEA.
 * User: vishalkulkarni
 * Date: 4/29/17
 * Time: 11:15 PM
 */

$this->load->view('header');

?>
<hr>

<form class="form-horizontal" method="post" action="<?= base_url()?>login">
    <fieldset>

        <!-- Form Name -->
        <legend>Login</legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Username</label>
            <div class="col-md-4">
                <input id="username" name="username" type="text" placeholder="username" class="form-control input-md" required="">

            </div>
        </div>

        <!-- Password input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="password">Password</label>
            <div class="col-md-4">
                <input id="password" name="password" type="password" placeholder="password" class="form-control input-md">
                <?php
                if ($error)
                {
                    echo("<help>Invalid username and password</help>");
                }
                ?>
            </div>
        </div>

        <!-- Button -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="submit"></label>
            <div class="col-md-4">
                <button id="submit" name="submit" class="btn btn-primary">Login</button>
                <a href="<?= base_url()?>register" class="btn btn-success">Register</a>
            </div>
        </div>

    </fieldset>
</form>


<?php
$this->load->view('footer');
?>