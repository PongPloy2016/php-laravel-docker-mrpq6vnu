<?php

namespace App\Http\Controllers;

use App\Gallery;
use Illuminate\Http\Request;

class VideoApiController extends Controller
{
    /**
     * GET /api/videolist
     *
     * Query Parameters:
     *   - page      (int)    : page number, default 1
     *   - count     (int)    : items per page, default 10
     *   - search    (string) : search in title / description
     *   - type      (string) : filter by video_type (youtube, Url, …)
     *   - cat_id    (int)    : filter by category id
     *
     * Response format matches the spec the user requested.
     */
    public function index(Request $request)
    {
        $page    = max(1, (int) $request->input('page', 1));
        $count   = max(1, min(50, (int) $request->input('count', 10)));
        $search  = $request->input('search', '');
        $type    = $request->input('type', '');
        $catId   = $request->input('cat_id', '');

        $query = Gallery::where('video_status', 1)
            ->orderBy('total_views', 'desc')
            ->orderBy('date_time', 'desc');

        // --- optional filters ---
        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('video_title', 'like', "%{$search}%")
                  ->orWhere('video_description', 'like', "%{$search}%");
            });
        }

        if ($type) {
            $query->where('video_type', $type);
        }

        if ($catId) {
            $query->where('cat_id', (int) $catId);
        }

        // --- pagination ---
        $countTotal = $query->count();
        $pages      = (int) ceil($countTotal / $count);

        $videos = $query
            ->skip(($page - 1) * $count)
            ->take($count)
            ->get();

        // --- transform each row into the "posts" format ---
        $posts = $videos->map(function ($v) {
            return [
                'vid'               => $v->id,
                'cat_id'            => $v->cat_id,
                'video_title'       => $v->video_title,
                'video_url'         => $v->video_url,
                'video_id'          => $v->video_id,
                'video_thumbnail'   => $v->video_thumbnail,
                'video_duration'    => $v->video_duration,
                'video_description' => $v->video_description,
                'video_type'        => $v->video_type,
                'video_status'      => (string) $v->video_status,
                'size'              => $v->size,
                'total_views'       => (string) $v->total_views,
                'date_time'         => $v->date_time,
            ];
        });

        return response()->json([
            'status'      => 'ok',
            'count'       => $videos->count(),
            'count_total' => $countTotal,
            'pages'       => $pages,
            'posts'       => $posts,
        ]);
    }

    /**
     * GET /api/videolist/{id}
     *
     * Return a single video by id.
     */
    public function show($id)
    {
        $v = Gallery::where('video_status', 1)->find($id);

        if (!$v) {
            return response()->json([
                'status' => 'error',
                'msg'    => 'Video not found',
            ], 404);
        }

        return response()->json([
            'status' => 'ok',
            'post'   => [
                'vid'               => $v->id,
                'cat_id'            => $v->cat_id,
                'video_title'       => $v->video_title,
                'video_url'         => $v->video_url,
                'video_id'          => $v->video_id,
                'video_thumbnail'   => $v->video_thumbnail,
                'video_duration'    => $v->video_duration,
                'video_description' => $v->video_description,
                'video_type'        => $v->video_type,
                'video_status'      => (string) $v->video_status,
                'size'              => $v->size,
                'total_views'       => (string) $v->total_views,
                'date_time'         => $v->date_time,
            ],
        ]);
    }

    /**
     * GET /api/category_list
     *
     * Return distinct categories present in the gallery.
     */
    public function categories()
    {
        $cats = Gallery::where('video_status', 1)
            ->select('cat_id')
            ->distinct()
            ->orderBy('cat_id')
            ->pluck('cat_id');

        return response()->json([
            'status'     => 'ok',
            'categories' => $cats,
        ]);
    }
}
