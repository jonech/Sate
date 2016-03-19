semantic_icon('add')
# => <i class="add icon"></i>
semantic_icon(:add)
# => <i class="add icon"></i>
semantic_icon('add sign')
# => <i class="add sign icon"></i>
semantic_icon('add', 'sign')
# => <i class="add sign icon"></i>
semantic_icon(:add, :sign)
# => <i class="add sign icon"></i>
semantic_icon('add', id: 'id')
# => <i class="add icon" id="id"></i>