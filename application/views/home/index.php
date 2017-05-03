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
            <h2>What We Do</h2>
            <p>We provide the best in class hotel booking services.</p>
            <p>
                <a class="btn btn-success" href="#">Contact Us</a>
            </p>
        </div>
    </div>
    <!-- /.row -->

    <hr>

<?php
$cnt = 0;
foreach ($hotels as $hotel) {
    $cnt++;
    if ($cnt % 3 == 0) {
        echo('<div class="row">');

    }
    ?>
    <div class="col-sm-4">
        <img class="img-circle img-responsive img-center" src="../../../assets/img/<?=$cnt?>.png" alt="">
        <h2><a href="<?= base_url() ?>hotels/view/<?= $hotel->HotelID ?>"><?= $hotel->Street ?>
                , <?= $hotel->Zip ?> <?= $hotel->Country ?></a></h2>
        <a href="<?= base_url() ?>hotels/book/<?= $hotel->HotelID ?>" class="btn btn-success"> Book </a>
        <p>These marketing boxes are a great place to put some information. These can contain summaries of what the
            company does, promotional information, or anything else that is relevant to the company. These will usually
            be below-the-fold.</p>
    </div>
    <?
    if ($cnt % 3 == 0) {
        echo('</div>');
    }
}
?>


    <hr>

<?
$this->load->view('footer');

?>