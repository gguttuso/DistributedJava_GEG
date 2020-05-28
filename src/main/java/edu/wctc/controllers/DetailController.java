package edu.wctc.controllers;

import edu.wctc.entity.Item;
import edu.wctc.entity.ItemDetail;
import edu.wctc.service.ItemDetailService;
import edu.wctc.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/details")
public class DetailController {

    // Inject the Item Service
    @Autowired
    private ItemService itemService;

    @Autowired
    private ItemDetailService itemDetailService;

    // this is telling what page to show, in this case start at the root
    @RequestMapping("/detailPage")
    public String showDetailPage(Model theModel) {

        List<Item> itemList = itemService.getItems();

        // Add the list of donuts to the model
        theModel.addAttribute("items", itemList);

        return "detail/detail";
    }

    @GetMapping("/user/showAddItemForm")
    public String showAddItemForm(Model theModel){
        Item theItem = new Item();
        ItemDetail theItemDetail = new ItemDetail();

        theModel.addAttribute("aItem", theItem);
        theModel.addAttribute("aItemDetail", theItemDetail);

        theModel.addAttribute("detailList", itemDetailService.getItemDetails());

        return "detail/detail";
    }

    @RequestMapping("/user/save")
    public String saveItem(@ModelAttribute("aItem") Item item) {

        itemService.saveItem(item);

        // Redirect back to the item list
        return "redirect:/list/listPage";

    }

    @GetMapping("/admin/delete")
    public String deleteItem(@ModelAttribute("itemId") int theId) {

        itemService.deleteItem(theId);

        // Redirect back to the item list
        return "redirect:/list/listPage";

    }

    @RequestMapping("/user/showUpdateForm")
    public String showUpdateItemForm(@RequestParam("itemId") int theId,
                                      Model theModel) {
        // Get item from the database
        Item theItem = itemService.getItem(theId);

        // Set item as a model attribute to pre-populate the form
        theModel.addAttribute("aItem", theItem);

        theModel.addAttribute("detailList", itemDetailService.getItemDetails());

        // Redirect back to the add form
        return "detail/detail";
    }

    @GetMapping("/search")
    public String search(@RequestParam("searchTerm") String theSearchTerm, Model theModel) {
        List<Item> matchingItems = itemService.getItemsByName(theSearchTerm);

        theModel.addAttribute("items", matchingItems);

        return "list/list";
    }


}