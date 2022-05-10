<?php

namespace App\Http\Controllers;
use App\Models\Product;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(): JsonResponse
    {
        $products = Product::orderBy('name', 'asc')->get()->toArray();

        return response()->json([
            'status' => true,
            'message' => 'Productos obtenidos exitosamente V3',
            'data' => ['products' => $products]
        ]);
    }
}
