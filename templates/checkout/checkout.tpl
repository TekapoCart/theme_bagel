{extends file='layouts/layout-left-column.tpl'}

{block name='header'}
    {include file='checkout/_partials/header.tpl'}
{/block}

{block name="content"}
    <section id="content">
        <div class="row">
            <div class="col-md-8">

                {block name='cart_summary'}
                    {render file='checkout/checkout-process.tpl' ui=$checkout_process}
                {/block}

            </div>
            <div class="col-md-4">

                {block name='cart_summary'}
                    {include file='checkout/_partials/cart-summary.tpl' cart = $cart}
                {/block}

                {hook h='displayReassurance'}
            </div>
        </div>
    </section>
{/block}

{block name="footer"}
    {include file="checkout/_partials/footer.tpl"}
{/block}