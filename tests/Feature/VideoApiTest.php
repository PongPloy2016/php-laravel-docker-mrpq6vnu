<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Gallery;

class VideoApiTest extends TestCase
{
    /**
     * Test videolist API returns valid, viewable thumbnail URLs.
     */
    public function testVideoListApiThumbnailsAreAccessible()
    {
        $response = $this->json('GET', '/api/videolist', [
            'page' => 1,
            'count' => 10,
        ]);

        $response->assertStatus(200);
        $data = $response->json();

        $this->assertArrayHasKey('posts', $data);

        foreach ($data['posts'] as $post) {
            if ($post['video_type'] === 'Upload' && !empty($post['video_thumbnail'])) {
                // The thumbnail URL will be something like https://php-laravel-app-hslg.onrender.com/video_image/filename.jpg
                $thumbnailUrl = $post['video_thumbnail'];
                
                // Get the filename directly from the URL using basename
                $filename = basename($thumbnailUrl);
                
                // The actual file should exist in storage/upload/video_image/
                $realFilePath = storage_path('upload/video_image/' . $filename);
                $this->assertFileExists($realFilePath, "Thumbnail file does not exist: {$realFilePath}");
                
                // The public symlinked path should also exist and point to the correct file
                $publicFilePath = public_path('video_image/' . $filename);
                $this->assertFileExists($publicFilePath, "Symlinked public thumbnail file does not exist: {$publicFilePath}");
            }
        }
    }
}
