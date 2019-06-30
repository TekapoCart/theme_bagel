
<div id="_desktop_product_figure">
<div class="figures js-swipeable" data-swipe-threshold="50">
{foreach from=$product.images item=image name=images}
<div class="figure" style="background-image: url({$image.bySize.large_default.url}); opacity:{if $smarty.foreach.images.first}1{else}0{/if}">
    {if count($product.images) > 1}
    <a href="javascript:void(0)" rel="nofollow" class="chevron left bgcolor"><img src="{$urls.theme_assets}img/chevron.svg"></a>
    <a href="javascript:void(0)" rel="nofollow" class="chevron right bgcolor"><img src="{$urls.theme_assets}img/chevron.svg"></a>
    <div class="pager">{$smarty.foreach.images.iteration}/{$product.images|count}</div>
    {/if}
</div>
{/foreach}
</div>
</div>

<div id="_mobile_product_figure"></div>