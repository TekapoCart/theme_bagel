<section id="home-featuredproducts">
    <a href="javascript:void(0)" rel="nofollow" class="chevron left"><img src="{$urls.theme_assets}img/chevron.svg"></a>
    <div class="listing" class="product-miniature">
        {foreach from=$products.items item="product"}
            {include file="catalog/_partials/miniatures/product.tpl" product=$product}
        {/foreach}
    </div>
    <a href="javascript:void(0)" rel="nofollow" class="chevron right"><img src="{$urls.theme_assets}img/chevron.svg"></a>
</section>