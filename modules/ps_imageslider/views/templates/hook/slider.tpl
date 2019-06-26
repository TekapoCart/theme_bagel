{if $homeslider.slides}
    <div id="imagesliders">
    {foreach from=$homeslider.slides item=slide key=key name='homeslider'}
        <section id="imageslider-{$key + 1}">
            <a href="{$slide.url}"><div class="bg" style="background-image: url('{$slide.image_url}'); height: 423px;"></div></a>
        </section>
    {/foreach}
    </div>
{/if}