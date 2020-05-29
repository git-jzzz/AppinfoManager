package cn.appinfo;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import  cn.appinfo.pojo.audio;
import com.alibaba.fastjson.JSONArray;

public class Test {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Boolean is_exit = true;
        String song_id = null;
        List audioList = new ArrayList();
        do {
            audio audio=new audio();
            System.out.print("输入歌曲id:");
            song_id = scanner.next();
            audio.setUrl("https://music.163.com/song/media/outer/url?id=" + song_id);
            audio.setLrc("http://music.163.com/api/song/media?id=" + song_id);
            System.out.print("输入歌曲名:");
            audio.setName(scanner.next());
            System.out.print("输入作者:");
            audio.setArtist(scanner.next());
            System.out.print("输入图片路径:");
            audio.setCover(audio.getCover()+scanner.next());
            audioList.add(audio);
            System.out.println("继续？y/任意操作");
            song_id = scanner.next();
            is_exit = song_id.toLowerCase().equals("y") ? true : false;
        } while (is_exit);
        System.out.println(JSONArray.toJSONString(audioList));
    }
}
