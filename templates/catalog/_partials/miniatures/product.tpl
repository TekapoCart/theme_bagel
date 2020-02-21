{block name='product_miniature_item'}
    <article data-sticker="{$product.sticker}" class="product-miniature js-product-miniature {if isset($cssClass)}{$cssClass}{/if}" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
        {if strlen($product.sticker) > 0}<div class="sticker" style="background-image: url('{$urls.img_ps_url}img/cms/sticker/{$product.sticker}');"></div>{/if}
        {if isset($product_id) && $product_id == $product.id}
            <h3>{$product.name|truncate:70:'...'}</h3>
            <img src="{$product.cover.bySize.home_default.url}" alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:70:'...'}{/if}" style="padding: 25px;">
            <div class="overlay on"><span>more</span></div>
        {else}
            <a href="{$product.url}">
                <h3>{$product.name|truncate:70:'...'}</h3>
                <img src="{$product.cover.bySize.home_default.url}" alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:70:'...'}{/if}" style="padding: 25px;">
                <div class="overlay"><span>more</span></div>
            </a>
        {/if}
    </article>
{/block}
