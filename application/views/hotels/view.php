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
        <div class="col-sm-8">
            <h2><?=$hotel_name?></h2>

            <p><strong>Services Available:</strong><br/>
            <ul>
                <?php
                foreach ($hotel_services as $s)
                {

                    echo("<li>" . $s->SType . " (Price: " . "$s->SPrice" . "$)" . "</li>");
                }
                ?>
            </ul>
            </p>


            <p><strong>Breakfast Available:</strong><br/>
            <ul>
                <?php
                foreach ($breakfast_info as $b)
                {

                    echo("<li>" . $b->BType . " - " . $b->Description . " (Price: " . "$b->BPrice" . "$)". "</li>");
                }
                ?>
            </ul>
            </p>

            <p>
                <a class="btn btn-success" href="<?=base_url()?>hotels/book/<?=$hotel->HotelID?>">BOOK NOW</a>
            </p>
        </div>
        <div class="col-sm-4">
            <h2>Contact Us</h2>
            <address>
                <br><?=$hotel_street?>
                <br><?=$hotel_state?> <?=$hotel_zip?>
                <br>
            </address>
            <address>
                <abbr title="Phone">P:</abbr>(123) 456-7890
                <br>
                <abbr title="Email">E:</abbr> <a href="mailto:#">name@example.com</a>
            </address>
        </div>
    </div>
    <!-- /.row -->

    <hr>

<h1>Room Types</h1>
<?php
$cnt = 0;

foreach($room_types as $rt)
{
    $cnt++;
    if ($cnt % 3 == 0)
    {
        echo('<div class="row">');

    }
    ?>
    <div class="col-sm-4">
        <h2><?=$rt->Rtype?></h2>
        <p><?=$rt->Description?></p>
    </div>
    <?
    if ($cnt % 3 == 0)
    {
        echo('</div>');
    }
}

?>


    <hr>

<?
$this->load->view('footer');

?>