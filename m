Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56EFE77197
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jan 2025 08:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNsGZHqQusVlUQhKAc9g0mywWUh0AOaoGZcoTLiORDs=; b=z71+wLbpLOkAOQ
	hPWLaAeTEmEEcl/MrWHqtlciWwfrwxbZM9HOI+5s0PN5/GcTLLTyzr3SlWlvW34yGsh0UNtSUD43k
	AFLZyRer/Fs+cG5insMBEeLsw+dEfjXD+/GIg1gVv+9taLpxqQlXHWrWSqNpNZ4UCRI3Gq3IA/UWg
	5tQIU75HAvVO3i/YQxdy1wTl16cyXRVJQipd4nBTg4zQoLZAu/Whcgmjb93pME5mChxneo/TNFpJe
	WFPMsCQpweD3fMGv6CRayv4BLmKlxb34HsdxiVAGnIuajH4Hf2XqLdBUVa6QkI4sy027UBLzdwYCE
	xm+ldJBWxGFuBmf4Gh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVo4H-0000000BCfR-1sa5;
	Thu, 09 Jan 2025 08:39:05 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVo4B-0000000BCeh-3C1A
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jan 2025 08:39:03 +0000
X-UUID: 24c1dc22ce6511efa216b1d71e6e1362-20250109
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:74759477-a217-4bfe-800b-e37514eee823,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:9e99ef6705ef361f40fdceb47d52fa4b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 24c1dc22ce6511efa216b1d71e6e1362-20250109
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 432965665; Thu, 09 Jan 2025 16:38:47 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 5708816002081;
	Thu,  9 Jan 2025 16:38:47 +0800 (CST)
X-ns-mid: postfix-677F8B17-2758441027
Received: from [10.42.13.56] (unknown [10.42.13.56])
	by node4.com.cn (NSMail) with ESMTPA id EA40A16002081;
	Thu,  9 Jan 2025 08:38:45 +0000 (UTC)
Message-ID: <c6fd8540-14f6-414a-95bd-a9fdac6812d7@kylinos.cn>
Date: Thu, 9 Jan 2025 16:38:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: dw: Fix use-after-free in dw_i3c_master driver due
 to race condition
From: Pei Xiao <xiaopei01@kylinos.cn>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org, frank.li@nxp.com
References: <bfc49c9527be5b513e7ceafeba314ca40a5be4bc.1732703537.git.xiaopei01@kylinos.cn>
 <2cc88393-d051-4626-87b7-1ea6c532ae61@quicinc.com>
 <15edf6df-3b13-4c72-a9c8-7c87d8578c4d@kylinos.cn>
 <1d5e7370-3913-416c-80f9-0e8ce459d761@quicinc.com>
 <8c20ba3f-d214-428c-a827-7642d85bec87@kylinos.cn>
In-Reply-To: <8c20ba3f-d214-428c-a827-7642d85bec87@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_003900_154279_C8D94E5E 
X-CRM114-Status: GOOD (  12.00  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CuWcqCAyMDI0LzEyLzMgMTU6MjMsIFBlaSBYaWFvIOWGmemBkzoKPgo+Cj4g5ZyoIDIwMjQvMTIv
MyAxNToxMiwgTXVrZXNoIEt1bWFyIFNhdmFsaXlhIOWGmemBkzoKPj4gSGkgUGVpLCBQbGVhc2Ug
RG9uJ3QgdG9wIHBvc3QgdGhlIGNvbW1lbnQuCj4gc28gc29ycnkgZm9yIHRoYXQhCj4+Cj4+IE9u
IDEyLzMvMjAyNCAxMjozNSBQTSwgUGVpIFhpYW8gd3JvdGU6Cj4+PiBIaSwKPj4+IMKgwqAgSSBk
b24ndCB0aGlua3Mgc28uSGVyZSBpcyBhIGRlc2NyaXB0aW9uIG9mIGNhbmNlbF93b3JrX3N5bmMu
Cj4+PiDCoMKgICp3b3JrIGlzIGd1YXJhbnRlZWQgdG8gYmUgbm90IHBlbmRpbmcgb3IgZXhlY3V0
aW5nIG9uIGFueSBDUFUqLgo+Pj4KPj4+Cj4+PiBjYW5jZWxfd29ya19zeW5jIOKAlCBjYW5jZWwg
YSB3b3JrIGFuZCB3YWl0IGZvciBpdCB0byBmaW5pc2gKPj4+IFN5bm9wc2lzCj4+PiBib29sIGNh
bmNlbF93b3JrX3N5bmMgKMKgwqDCoCBzdHJ1Y3Qgd29ya19zdHJ1Y3QgKiB3b3JrKTsKPj4+Cj4+
PiBBcmd1bWVudHMKPj4+Cj4+PiB3b3JrCj4+Pgo+Pj4gwqDCoMKgwqAgdGhlIHdvcmsgdG8gY2Fu
Y2VsCj4+Pgo+Pj4gRGVzY3JpcHRpb24KPj4+Cj4+PiBDYW5jZWwgd29yayBhbmQgd2FpdCBmb3Ig
aXRzIGV4ZWN1dGlvbiB0byBmaW5pc2guIFRoaXMgZnVuY3Rpb24gY2FuIGJlIHVzZWQgZXZlbiBp
ZiB0aGUgd29yayByZS1xdWV1ZXMgaXRzZWxmIG9yIG1pZ3JhdGVzIHRvIGFub3RoZXIgd29ya3F1
ZXVlLiBPbiByZXR1cm4gZnJvbSB0aGlzIGZ1bmN0aW9uLCB3b3JrIGlzIGd1YXJhbnRlZWQgdG8g
YmUgbm90IHBlbmRpbmcgb3IgZXhlY3V0aW5nIG9uIGFueSBDUFUuCj4+Pgo+Pj4gY2FuY2VsX3dv
cmtfc3luYyhkZWxheWVkX3dvcmstPndvcmspIG11c3Qgbm90IGJlIHVzZWQgZm9yIGRlbGF5ZWRf
d29yaydzLiBVc2UgY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jIGluc3RlYWQuCj4+Pgo+Pj4gVGhl
IGNhbGxlciBtdXN0IGVuc3VyZSB0aGF0IHRoZSB3b3JrcXVldWUgb24gd2hpY2ggd29yayB3YXMg
bGFzdCBxdWV1ZWQgY2FuJ3QgYmUgZGVzdHJveWVkIGJlZm9yZSB0aGlzIGZ1bmN0aW9uIHJldHVy
bnMuCj4+PiBSZXR1cm4KPj4+Cj4+PiB0cnVlIGlmIHdvcmsgd2FzIHBlbmRpbmcsIGZhbHNlIG90
aGVyd2lzZS4KPj4+Cj4+PiBUaGFua3MhCj4+PiBQZWkuCj4+PiDlnKggMjAyNC8xMi8zIDE0OjQ5
LCBNdWtlc2ggS3VtYXIgU2F2YWxpeWEg5YaZ6YGTOgo+Pj4+Cj4+Pj4KPj4+PiBPbiAxMS8yOC8y
MDI0IDc6MjkgQU0sIFBlaSBYaWFvIHdyb3RlOgo+Pj4+PiBJbiBkd19pM2NfY29tbW9uX3Byb2Jl
LCAmbWFzdGVyLT5oal93b3JrIGlzIGJvdW5kIHdpdGgKPj4+Pj4gZHdfaTNjX2hqX3dvcmsuIEFu
ZCBkd19pM2NfbWFzdGVyX2lycV9oYW5kbGVyIGNhbiBjYWxsCj4+Pj4+IGR3X2kzY19tYXN0ZXJf
aXJxX2hhbmRsZV9pYmlzIGZ1bmN0aW9uIHRvIHN0YXJ0IHRoZSB3b3JrLgo+Pj4+Pgo+Pj4+PiBJ
ZiB3ZSByZW1vdmUgdGhlIG1vZHVsZSB3aGljaCB3aWxsIGNhbGwgZHdfaTNjX2NvbW1vbl9yZW1v
dmUgdG8KPj4+Pj4gbWFrZSBjbGVhbnVwLCBpdCB3aWxsIGZyZWUgbWFzdGVyLT5iYXNlIHRocm91
Z2ggaTNjX21hc3Rlcl91bnJlZ2lzdGVyCj4+Pj4+IHdoaWxlIHRoZSB3b3JrIG1lbnRpb25lZCBh
Ym92ZSB3aWxsIGJlIHVzZWQuIFRoZSBzZXF1ZW5jZSBvZiBvcGVyYXRpb25zCj4+Pj4+IHRoYXQg
bWF5IGxlYWQgdG8gYSBVQUYgYnVnIGlzIGFzIGZvbGxvd3M6Cj4+Pj4+Cj4+Pj4+IENQVTDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBDUFUxCj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgZHdfaTNj
X2hqX3dvcmsKPj4+Pj4gZHdfaTNjX2NvbW1vbl9yZW1vdmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8Cj4+Pj4+IGkzY19tYXN0ZXJfdW5yZWdpc3RlcigmbWFzdGVyLT5iYXNlKSB8
Cj4+Pj4+IGRldmljZV91bnJlZ2lzdGVyKCZtYXN0ZXItPmRldinCoMKgwqDCoMKgIHwKPj4+Pj4g
ZGV2aWNlX3JlbGVhc2XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8Cj4+Pj4+IC8vZnJlZSBtYXN0ZXItPmJhc2XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBpM2NfbWFzdGVyX2RvX2RhYSgmbWFz
dGVyLT5iYXNlKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IC8vdXNlIG1hc3Rlci0+YmFzZQo+
Pj4+Pgo+Pj4+PiBGaXggaXQgYnkgZW5zdXJpbmcgdGhhdCB0aGUgd29yayBpcyBjYW5jZWxlZCBi
ZWZvcmUgcHJvY2VlZGluZyB3aXRoCj4+Pj4+IHRoZSBjbGVhbnVwIGluIGR3X2kzY19jb21tb25f
cmVtb3ZlLgo+Pj4+Pgo+Pj4+PiBGaXhlczogMWRkNzI4ZjVkNGQ0ICgiaTNjOiBtYXN0ZXI6IEFk
ZCBkcml2ZXIgZm9yIFN5bm9wc3lzIERlc2lnbldhcmUgSVAiKQo+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBQZWkgWGlhbyA8eGlhb3BlaTAxQGt5bGlub3MuY24+Cj4+Pj4+IC0tLQo+Pj4+PiDCoCBkcml2
ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIHwgMSArCj4+Pj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
bWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci8gZHctaTNjLW1hc3Rl
ci5jCj4+Pj4+IGluZGV4IDhkNjk0NjcyYzExMC4uZGJjZDM5ODRmMjU3IDEwMDY0NAo+Pj4+PiAt
LS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4+Pj4+ICsrKyBiL2RyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4+Pj4gQEAgLTE2MjQsNiArMTYyNCw3IEBA
IEVYUE9SVF9TWU1CT0xfR1BMKGR3X2kzY19jb21tb25fcHJvYmUpOwo+Pj4+PiDCoCB2b2lkIGR3
X2kzY19jb21tb25fcmVtb3ZlKHN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0ZXIpCj4+Pj4+IMKg
IHsKPj4+Pj4gK8KgwqDCoCBjYW5jZWxfd29ya19zeW5jKCZtYXN0ZXItPmhqX3dvcmspOwo+Pj4+
IFlvdSBzdGlsbCBuZWVkIHRvIGNhcHR1cmUgcmV0dXJuIGFuZCBlbnN1cmUgdGhhdCB0aGUgcGVu
ZGluZyB3b3JrIGlzIHJlYWxseSBjb21wbGV0ZWQgb3Igbm8gbW9yZSBwZW5kaW5nLgo+PiBSZXR1
cm4gOiB0cnVlIGlmIHdvcmsgd2FzIHBlbmRpbmcsIGZhbHNlIG90aGVyd2lzZQo+PiBXb3VsZCBs
aWtlIHRvIGNhcHR1cmUgdGhlIHJldHVybiBhbmQgbm90aWZ5L3ByaW50ID8KPiB3aGVuIEkgZ3Jl
cCAiY2FuY2VsX3dvcmtfc3luYyIgLW5yIGRyaXZlci8sYWxtb3N0IG5vIHVzZSBvZiB0aGlzIHJl
dHVybiB2YWx1ZSBpbiBkcml2ZXIuCj4KSXMgdGhlcmUgYW55IGlzc3VlIHdpdGggdGhpcyBwYXRj
aD8KClRoYW5rcyEKClBlaS4KCj4KPj4+Pj4gwqDCoMKgwqDCoCBpM2NfbWFzdGVyX3VucmVnaXN0
ZXIoJm1hc3Rlci0+YmFzZSk7Cj4+Pj4+IMKgwqDCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKG1h
c3Rlci0+ZGV2KTsKPj4+Pgo+Pj4+Cj4+Cj4+CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdAps
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
