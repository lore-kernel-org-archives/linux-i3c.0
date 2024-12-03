Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66385E6C60E
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Dec 2024 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2L1AtLD2Tq+kSPLLSV/OXbJCW3gkPjNawDOUSsu7gI=; b=xG6ztumfkDB9V8UKYoC7tgkOo2
	hGrLHb4Bc8nEnQTnSdkp/y2NeiVMwevURIYKpyVcA0g5hfUhuN2Eztk7xKp+cw4yukfSKiR9tzKrW
	VBEuhr0CTwxEGdOHIbkbMZj/kq00MudDdd1xv1TuCd2EVapSg7tFcHONHnpU7iyEZZItUvbBco9xx
	6Qi8aO5UBUWGGUScXRgF2V++cZWWa0KMG90jwm8I8HeYER7bSAKPyvrzP50Ajw9CKQWCWn7JPhR0f
	c9AOmCv+813M27w/hra9wBCXETtPFvnYrhXPnlw3LgyiDJ0AGb7K1NQZk7B3wnSvy9NCYdOFLbdTr
	Hx0ZThtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINGd-00000008VQc-0bGx;
	Tue, 03 Dec 2024 07:24:19 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINFv-00000008VGg-1WBb
	for linux-i3c@lists.infradead.org;
	Tue, 03 Dec 2024 07:23:36 +0000
X-UUID: 7e85a382b14711efa216b1d71e6e1362-20241203
X-CID-CACHE: Type:Local,Time:202412031505+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:f9af31c0-84d6-4251-a8bf-ff139279e821,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:64b32d04392bdac1f7cd626248bef6c8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM:-3,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7e85a382b14711efa216b1d71e6e1362-20241203
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1054307960; Tue, 03 Dec 2024 15:23:29 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 58DF216002081;
	Tue,  3 Dec 2024 15:23:29 +0800 (CST)
X-ns-mid: postfix-674EB1F1-283949767
Received: from [10.42.116.241] (unknown [10.42.116.241])
	by node4.com.cn (NSMail) with ESMTPA id 1A22716002081;
	Tue,  3 Dec 2024 07:23:29 +0000 (UTC)
Message-ID: <8c20ba3f-d214-428c-a827-7642d85bec87@kylinos.cn>
Date: Tue, 3 Dec 2024 15:23:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: dw: Fix use-after-free in dw_i3c_master driver due
 to race condition
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org, frank.li@nxp.com
References: <bfc49c9527be5b513e7ceafeba314ca40a5be4bc.1732703537.git.xiaopei01@kylinos.cn>
 <2cc88393-d051-4626-87b7-1ea6c532ae61@quicinc.com>
 <15edf6df-3b13-4c72-a9c8-7c87d8578c4d@kylinos.cn>
 <1d5e7370-3913-416c-80f9-0e8ce459d761@quicinc.com>
Content-Language: en-US
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <1d5e7370-3913-416c-80f9-0e8ce459d761@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_232335_696063_EA16A9CE 
X-CRM114-Status: GOOD (  13.78  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyNC8xMi8zIDE1OjEyLCBNdWtlc2ggS3VtYXIgU2F2YWxpeWEg5YaZ6YGTOgo+IEhp
IFBlaSwgUGxlYXNlIERvbid0IHRvcCBwb3N0IHRoZSBjb21tZW50LgpzbyBzb3JyeSBmb3IgdGhh
dCEKPiAKPiBPbiAxMi8zLzIwMjQgMTI6MzUgUE0sIFBlaSBYaWFvIHdyb3RlOgo+PiBIaSwKPj4g
wqDCoCBJIGRvbid0IHRoaW5rcyBzby5IZXJlIGlzIGEgZGVzY3JpcHRpb24gb2YgY2FuY2VsX3dv
cmtfc3luYy4KPj4gwqDCoCAqd29yayBpcyBndWFyYW50ZWVkIHRvIGJlIG5vdCBwZW5kaW5nIG9y
IGV4ZWN1dGluZyBvbiBhbnkgQ1BVKi4KPj4KPj4KPj4gY2FuY2VsX3dvcmtfc3luYyDigJQgY2Fu
Y2VsIGEgd29yayBhbmQgd2FpdCBmb3IgaXQgdG8gZmluaXNoCj4+IFN5bm9wc2lzCj4+IGJvb2wg
Y2FuY2VsX3dvcmtfc3luYyAowqDCoMKgIHN0cnVjdCB3b3JrX3N0cnVjdCAqIHdvcmspOwo+Pgo+
PiBBcmd1bWVudHMKPj4KPj4gd29yawo+Pgo+PiDCoMKgwqDCoCB0aGUgd29yayB0byBjYW5jZWwK
Pj4KPj4gRGVzY3JpcHRpb24KPj4KPj4gQ2FuY2VsIHdvcmsgYW5kIHdhaXQgZm9yIGl0cyBleGVj
dXRpb24gdG8gZmluaXNoLiBUaGlzIGZ1bmN0aW9uIGNhbiBiZSAKPj4gdXNlZCBldmVuIGlmIHRo
ZSB3b3JrIHJlLXF1ZXVlcyBpdHNlbGYgb3IgbWlncmF0ZXMgdG8gYW5vdGhlciAKPj4gd29ya3F1
ZXVlLiBPbiByZXR1cm4gZnJvbSB0aGlzIGZ1bmN0aW9uLCB3b3JrIGlzIGd1YXJhbnRlZWQgdG8g
YmUgbm90IAo+PiBwZW5kaW5nIG9yIGV4ZWN1dGluZyBvbiBhbnkgQ1BVLgo+Pgo+PiBjYW5jZWxf
d29ya19zeW5jKGRlbGF5ZWRfd29yay0+d29yaykgbXVzdCBub3QgYmUgdXNlZCBmb3IgCj4+IGRl
bGF5ZWRfd29yaydzLiBVc2UgY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jIGluc3RlYWQuCj4+Cj4+
IFRoZSBjYWxsZXIgbXVzdCBlbnN1cmUgdGhhdCB0aGUgd29ya3F1ZXVlIG9uIHdoaWNoIHdvcmsg
d2FzIGxhc3QgCj4+IHF1ZXVlZCBjYW4ndCBiZSBkZXN0cm95ZWQgYmVmb3JlIHRoaXMgZnVuY3Rp
b24gcmV0dXJucy4KPj4gUmV0dXJuCj4+Cj4+IHRydWUgaWYgd29yayB3YXMgcGVuZGluZywgZmFs
c2Ugb3RoZXJ3aXNlLgo+Pgo+PiBUaGFua3MhCj4+IFBlaS4KPj4g5ZyoIDIwMjQvMTIvMyAxNDo0
OSwgTXVrZXNoIEt1bWFyIFNhdmFsaXlhIOWGmemBkzoKPj4+Cj4+Pgo+Pj4gT24gMTEvMjgvMjAy
NCA3OjI5IEFNLCBQZWkgWGlhbyB3cm90ZToKPj4+PiBJbiBkd19pM2NfY29tbW9uX3Byb2JlLCAm
bWFzdGVyLT5oal93b3JrIGlzIGJvdW5kIHdpdGgKPj4+PiBkd19pM2NfaGpfd29yay4gQW5kIGR3
X2kzY19tYXN0ZXJfaXJxX2hhbmRsZXIgY2FuIGNhbGwKPj4+PiBkd19pM2NfbWFzdGVyX2lycV9o
YW5kbGVfaWJpcyBmdW5jdGlvbiB0byBzdGFydCB0aGUgd29yay4KPj4+Pgo+Pj4+IElmIHdlIHJl
bW92ZSB0aGUgbW9kdWxlIHdoaWNoIHdpbGwgY2FsbCBkd19pM2NfY29tbW9uX3JlbW92ZSB0bwo+
Pj4+IG1ha2UgY2xlYW51cCwgaXQgd2lsbCBmcmVlIG1hc3Rlci0+YmFzZSB0aHJvdWdoIGkzY19t
YXN0ZXJfdW5yZWdpc3Rlcgo+Pj4+IHdoaWxlIHRoZSB3b3JrIG1lbnRpb25lZCBhYm92ZSB3aWxs
IGJlIHVzZWQuIFRoZSBzZXF1ZW5jZSBvZiBvcGVyYXRpb25zCj4+Pj4gdGhhdCBtYXkgbGVhZCB0
byBhIFVBRiBidWcgaXMgYXMgZm9sbG93czoKPj4+Pgo+Pj4+IENQVTDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBDUFUxCj4+Pj4KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGR3X2kzY19oal93b3JrCj4+Pj4g
ZHdfaTNjX2NvbW1vbl9yZW1vdmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+
Pj4gaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCZtYXN0ZXItPmJhc2UpIHwKPj4+PiBkZXZpY2VfdW5y
ZWdpc3RlcigmbWFzdGVyLT5kZXYpwqDCoMKgwqDCoCB8Cj4+Pj4gZGV2aWNlX3JlbGVhc2XCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+Pj4gLy9mcmVlIG1h
c3Rlci0+YmFzZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgCj4+Pj4gaTNjX21hc3Rlcl9kb19kYWEoJm1hc3Rlci0+YmFzZSkKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IC8vdXNlIG1hc3Rlci0+YmFzZQo+Pj4+Cj4+Pj4gRml4IGl0
IGJ5IGVuc3VyaW5nIHRoYXQgdGhlIHdvcmsgaXMgY2FuY2VsZWQgYmVmb3JlIHByb2NlZWRpbmcg
d2l0aAo+Pj4+IHRoZSBjbGVhbnVwIGluIGR3X2kzY19jb21tb25fcmVtb3ZlLgo+Pj4+Cj4+Pj4g
Rml4ZXM6IDFkZDcyOGY1ZDRkNCAoImkzYzogbWFzdGVyOiBBZGQgZHJpdmVyIGZvciBTeW5vcHN5
cyAKPj4+PiBEZXNpZ25XYXJlIElQIikKPj4+PiBTaWduZWQtb2ZmLWJ5OiBQZWkgWGlhbyA8eGlh
b3BlaTAxQGt5bGlub3MuY24+Cj4+Pj4gLS0tCj4+Pj4gwqAgZHJpdmVycy9pM2MvbWFzdGVyL2R3
LWkzYy1tYXN0ZXIuYyB8IDEgKwo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVy
LmMgCj4+Pj4gYi9kcml2ZXJzL2kzYy9tYXN0ZXIvIGR3LWkzYy1tYXN0ZXIuYwo+Pj4+IGluZGV4
IDhkNjk0NjcyYzExMC4uZGJjZDM5ODRmMjU3IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvaTNj
L21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHct
aTNjLW1hc3Rlci5jCj4+Pj4gQEAgLTE2MjQsNiArMTYyNCw3IEBAIEVYUE9SVF9TWU1CT0xfR1BM
KGR3X2kzY19jb21tb25fcHJvYmUpOwo+Pj4+IMKgIHZvaWQgZHdfaTNjX2NvbW1vbl9yZW1vdmUo
c3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3RlcikKPj4+PiDCoCB7Cj4+Pj4gK8KgwqDCoCBjYW5j
ZWxfd29ya19zeW5jKCZtYXN0ZXItPmhqX3dvcmspOwo+Pj4gWW91IHN0aWxsIG5lZWQgdG8gY2Fw
dHVyZSByZXR1cm4gYW5kIGVuc3VyZSB0aGF0IHRoZSBwZW5kaW5nIHdvcmsgaXMgCj4+PiByZWFs
bHkgY29tcGxldGVkIG9yIG5vIG1vcmUgcGVuZGluZy4KPiBSZXR1cm4gOiB0cnVlIGlmIHdvcmsg
d2FzIHBlbmRpbmcsIGZhbHNlIG90aGVyd2lzZQo+IFdvdWxkIGxpa2UgdG8gY2FwdHVyZSB0aGUg
cmV0dXJuIGFuZCBub3RpZnkvcHJpbnQgPwp3aGVuIEkgZ3JlcCAiY2FuY2VsX3dvcmtfc3luYyIg
LW5yIGRyaXZlci8sYWxtb3N0IG5vIHVzZSBvZiB0aGlzIHJldHVybiAKdmFsdWUgaW4gZHJpdmVy
LgoKVGhhbmtzIQpQZWkuCgo+Pj4+IMKgwqDCoMKgwqAgaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCZt
YXN0ZXItPmJhc2UpOwo+Pj4+IMKgwqDCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKG1hc3Rlci0+
ZGV2KTsKPj4+Cj4+Pgo+IAo+IAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
