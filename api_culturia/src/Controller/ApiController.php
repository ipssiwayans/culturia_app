<?php

namespace App\Controller;

use App\Manager\ApiManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/api', name: 'api.')]
class ApiController extends AbstractController
{

    // ITEM ROUTES
    #[Route('/item/get-all', name: 'get_all_items')]
    public function getAllItems(ApiManager $apiManager): JsonResponse
    {

        $items = $apiManager->getAllItems();

        return new JsonResponse([
            'route' => 'get_all_items',
            'items' => $items,
        ], status: 200);

    }

    #[Route('/item/get-by-category/{categoryId}', name: 'get_items_by_category')]
    public function getItemsByCategory(int $categoryId, ApiManager $apiManager): JsonResponse
    {

        $items = $apiManager->getItemsByCategory($categoryId);

        return new JsonResponse([
            'route' => 'get_items_by_category',
            'items' => $items,
        ], status: 200);

    }

    #[Route('/item/add-new', name: 'add_item', methods: ['POST'])]
    public function addNewItem(ApiManager $apiManager, Request $request): JsonResponse
    {
        $data = json_decode($request->getContent(), true);
        $apiManager->addNewItem($data);

        return new JsonResponse("Item added successfully", status: 201);
    }

    #[Route('/item/get-top-rated/{categoryId}', name: 'get_top_rated_items')]
    public function getTopRatedItems(ApiManager $apiManager, int $categoryId): JsonResponse
    {

        $items = $apiManager->getTopRatedItems($categoryId);
        return new JsonResponse([
            'route' => 'get_top_rated_items',
            'items' => $items,
        ], status: 200);

    }

    // CATEGORY ROUTES
    #[Route('/category/get-all', name: 'get_all_categories')]
    public function getAllCategories(ApiManager $apiManager): JsonResponse
    {

        $categories = $apiManager->getAllCategories();

        return new JsonResponse([
            'route' => 'get_all_categories',
            'categories' => $categories,
        ], status: 200);

    }

    // USER ROUTES
    #[Route('/user/get-all', name: 'get_all_users')]
    public function getAllUsers(ApiManager $apiManager): JsonResponse
    {

        $users = $apiManager->getAllUsers();

        return new JsonResponse([
            'route' => 'get_all_users',
            'users' => $users,
        ], status: 200);

    }

    // REVIEW ROUTES
    #[Route('/review/get-all', name: 'get_all_reviews')]
    public function getAllReviews(ApiManager $apiManager): JsonResponse
    {

        $reviews = $apiManager->getAllReviews();

        return new JsonResponse([
            'route' => 'get_all_reviews',
            'reviews' => $reviews,
        ], status: 200);

    }

    #[Route('/review/add-review', name: 'add_review')]
    public function addReview(ApiManager $apiManager, Request $request): jsonResponse
    {

        $data = json_decode($request->getContent(), true);
        $apiManager->addReview($data['item_id'], $data['user_id'] ?? null, $data['note']);

        return new JsonResponse("Review added successfully", status: 200);

    }


}