package dto;

import dto.Plant;
import java.util.HashMap;
import java.util.Map;


public class Cart {

    private Map<Integer, Plant> cart;

    public Cart() {
    }

    public Cart(Map<Integer, Plant> cart) {
        this.cart = cart;
    }

    public Map<Integer, Plant> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, Plant> cart) {
        this.cart = cart;
    }

    public boolean add(Plant tree) {
        boolean result = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(tree.getId())) {
            int currentQuantity = this.cart.get(tree.getId()).getQuantity();
            tree.setQuantity(currentQuantity + tree.getQuantity());
        }
        this.cart.put(tree.getId(), tree);
        result = true;
        return result;
    }

    public boolean update(Integer id, Plant tree) {
        boolean result = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, tree);
                result = true;
            }
        }

        return result;
    }

    public boolean remove(Integer id) {
        boolean result = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                result = true;
            }
        }

        return result;
    }
}
