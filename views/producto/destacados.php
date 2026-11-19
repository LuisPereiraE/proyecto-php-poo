<h1>Algunos de nuestros productos</h1>

<?php while($product = $productos->fetch_object()): ?>
	<div class="product">
		<a href="<?=base_url?>producto/ver&id=<?=$product->id?>">
			<?php if($product->imagen != null): ?>
				<img src="<?=base_url?>uploads/images/<?=$product->imagen?>" />
			<?php else: ?>
				<img src="<?=base_url?>assets/img/camiseta.png" />
			<?php endif; ?>
			<h2><?=$product->nombre?></h2>
		</a>
		<p><?=$product->precio?></p>
		<a href="<?=base_url?>carrito/add&id=<?=$product->id?>" class="button">Comprar</a>
	</div>
<?php endwhile; ?>

<?php if($totalPaginas > 1): ?>
<div class="paginacion">
	<?php if($pagina > 1): ?>
		<a href="<?=base_url?>producto/index&pagina=<?=$pagina-1?>">« Anterior</a>
	<?php else: ?>
		<span class="desactivado">« Anterior</span>
	<?php endif; ?>

	<?php if($pagina < $totalPaginas): ?>
		<a href="<?=base_url?>producto/index&pagina=<?=$pagina+1?>">Siguiente</a>
	<?php else: ?>
		<span class="desactivado">Siguiente »</span>
	<?php endif; ?>

	<span class="numeros">
		<?php for($i = 1; $i <= $totalPaginas; $i++): ?>
			<?php if($i == $pagina): ?>
				<span class="actual"><?=$i?></span>
			<?php else: ?>
				<a href="<?=base_url?>producto/index&pagina=<?=$i?>"><?=$i?></a>
			<?php endif; ?>
		<?php endfor; ?>
	</span>
</div>
<?php endif; ?>
