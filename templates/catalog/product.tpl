{extends file=$layout}

{block name='head_seo' prepend}
    <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
    <meta property="og:type" content="product">
    <meta property="og:url" content="{$urls.current_url}">
    <meta property="og:title" content="{$page.meta.title}">
    <meta property="og:site_name" content="{$shop.name}">
    <meta property="og:description" content="{$page.meta.description}">
    <meta property="og:image" content="{$product.cover.large.url}">
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
    {if isset($product.weight) && ($product.weight != 0)}
        <meta property="product:weight:value" content="{$product.weight}">
        <meta property="product:weight:units" content="{$product.weight_unit}">
    {/if}
{/block}

{block name='content'}
    <div itemscope itemtype="https://schema.org/Product">
        <meta itemprop="url" content="{$product.url}">

        <div class="square intro dark">
            {block name='breadcrumb'}
                {include file='_partials/breadcrumb.tpl'}
            {/block}

            <h1 class="highlight" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>

            {block name='product_reference'}
                {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
                    <strong class="product-reference highlight" itemprop="sku">{$product.reference_to_display}</strong>
                {/if}
            {/block}

            {block name='product_prices'}
                {include file='catalog/_partials/product-prices.tpl'}
            {/block}

            {block name='product_quantities'}
                {if $product.show_quantities}
                    <div class="product-quantities">
                        <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}：</label>
                        <span data-stock="{$product.quantity}"
                              data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {*$product.quantity_label*}</span>
                    </div>
                {/if}
            {/block}

            <div class="product-actions">
                {block name='product_buy'}
                    <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                        <input type="hidden" name="token" value="{$static_token}">
                        <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                        <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                        {block name='product_variants'}
                            {include file='catalog/_partials/product-variants.tpl'}
                        {/block}

                        {block name='product_pack'}
                            {if $packItems}
                                <section class="product-pack">
                                    <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
                                    {foreach from=$packItems item="product_pack"}
                                        {block name='product_miniature'}
                                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                                        {/block}
                                    {/foreach}
                                </section>
                            {/if}
                        {/block}

                        {block name='product_discounts'}
                            {include file='catalog/_partials/product-discounts.tpl'}
                        {/block}

                        {block name='product_add_to_cart'}
                            {include file='catalog/_partials/product-add-to-cart.tpl'}
                        {/block}

                        {block name='product_additional_info'}
                            {include file='catalog/_partials/product-additional-info.tpl'}
                        {/block}

                        {block name='product_refresh'}
                            <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit"
                                   value="{l s='Refresh' d='Shop.Theme.Actions'}">
                        {/block}
                    </form>
                {/block}
            </div>

        </div><!-- end of square intro -->

        {block name='product_cover_thumbnails'}
            {include file='catalog/_partials/product-cover-thumbnails.tpl'}
        {/block}

        <div class="square detail dark border-top">

            <div class="spec">
                {block name='product_features'}
                    {if $product.grouped_features}
                        {foreach from=$product.grouped_features item=feature}
                            <dl>
                                <dt class="title highlight">{$feature.name}</dt>
                                <dd>{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
                            </dl>
                        {/foreach}
                    {/if}
                {/block}
            </div>

            {if $product.description}
            <div class="caption highlight">DESCRIPTION</div>
            <div class="description">
                {block name='product_description'}
                    <p>{$product.description nofilter}</p>
                {/block}
                <div>&nbsp;</div>
            </div>
            {/if}
        </div><!-- end of square detail -->

        <div class="squares product-miniature">
            {block name='product_footer'}
                {hook h='displayFooterProduct' product=$product category=$category}
            {/block}
        </div>

        <div class="clearfix"></div>
    </div>
{/block}
