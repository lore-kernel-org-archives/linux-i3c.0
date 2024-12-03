Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36D3E6C60E
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Dec 2024 07:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20Js65754XUU6zUd2lBtVNP9WDtF9EoR/bf4jQQxxVM=; b=wIYHfjZv1ZqwZL1I6yJcb8TOxp
	1DHzpW0ru375MPNcaU6fH+OdNhH8/f6Qitd4izBkcb42pBINMDzFsz07PNbt2piQYDPqqXasYHT2e
	ktc9VWlV2tOxz9w+q+bXhq9LxzB9RaGvJRNWEMdw2cGUQN+iqn2bONZVPPqSUDlwQB6NjyMRvx/Iq
	/qG3g9jzeKt52OCZEMDwoHEtouX5YypL6gcnGQFchuR9OrAHqIHZ2Y+tuzAZpqrNaGgZcweCe1lZo
	LWH7UoBYrKfq5jXAj4wgaWzL3LiqNs/RPoAC/Nx+4dk6HtIrQuoFgc8b5H4ay/IqR8czwK4HkYtCH
	IhVruOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMz6-00000008TTr-2HdE;
	Tue, 03 Dec 2024 07:06:12 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMz3-00000008TSz-1aWN
	for linux-i3c@lists.infradead.org;
	Tue, 03 Dec 2024 07:06:11 +0000
X-UUID: 0bad57b2b14511efa216b1d71e6e1362-20241203
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:78e1eed1-4c2f-45c6-8ed2-318c1c9d292d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:64b32d04392bdac1f7cd626248bef6c8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM:-3,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0bad57b2b14511efa216b1d71e6e1362-20241203
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 610937420; Tue, 03 Dec 2024 15:05:57 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id AD68416002081;
	Tue,  3 Dec 2024 15:05:57 +0800 (CST)
X-ns-mid: postfix-674EADD5-620157646
Received: from [10.42.116.241] (unknown [10.42.116.241])
	by node4.com.cn (NSMail) with ESMTPA id D3ABC16002081;
	Tue,  3 Dec 2024 07:05:56 +0000 (UTC)
Message-ID: <15edf6df-3b13-4c72-a9c8-7c87d8578c4d@kylinos.cn>
Date: Tue, 3 Dec 2024 15:05:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: dw: Fix use-after-free in dw_i3c_master driver due
 to race condition
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org, frank.li@nxp.com
References: <bfc49c9527be5b513e7ceafeba314ca40a5be4bc.1732703537.git.xiaopei01@kylinos.cn>
 <2cc88393-d051-4626-87b7-1ea6c532ae61@quicinc.com>
Content-Language: en-US
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <2cc88393-d051-4626-87b7-1ea6c532ae61@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_230609_740550_800812D5 
X-CRM114-Status: GOOD (  12.79  )
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

SGksCiAgIEkgZG9uJ3QgdGhpbmtzIHNvLkhlcmUgaXMgYSBkZXNjcmlwdGlvbiBvZiBjYW5jZWxf
d29ya19zeW5jLgogICAqd29yayBpcyBndWFyYW50ZWVkIHRvIGJlIG5vdCBwZW5kaW5nIG9yIGV4
ZWN1dGluZyBvbiBhbnkgQ1BVKi4KCgpjYW5jZWxfd29ya19zeW5jIOKAlCBjYW5jZWwgYSB3b3Jr
IGFuZCB3YWl0IGZvciBpdCB0byBmaW5pc2gKU3lub3BzaXMKYm9vbCBjYW5jZWxfd29ya19zeW5j
ICgJc3RydWN0IHdvcmtfc3RydWN0ICogd29yayk7CgpBcmd1bWVudHMKCndvcmsKCiAgICAgdGhl
IHdvcmsgdG8gY2FuY2VsCgpEZXNjcmlwdGlvbgoKQ2FuY2VsIHdvcmsgYW5kIHdhaXQgZm9yIGl0
cyBleGVjdXRpb24gdG8gZmluaXNoLiBUaGlzIGZ1bmN0aW9uIGNhbiBiZSAKdXNlZCBldmVuIGlm
IHRoZSB3b3JrIHJlLXF1ZXVlcyBpdHNlbGYgb3IgbWlncmF0ZXMgdG8gYW5vdGhlciB3b3JrcXVl
dWUuIApPbiByZXR1cm4gZnJvbSB0aGlzIGZ1bmN0aW9uLCB3b3JrIGlzIGd1YXJhbnRlZWQgdG8g
YmUgbm90IHBlbmRpbmcgb3IgCmV4ZWN1dGluZyBvbiBhbnkgQ1BVLgoKY2FuY2VsX3dvcmtfc3lu
YyhkZWxheWVkX3dvcmstPndvcmspIG11c3Qgbm90IGJlIHVzZWQgZm9yIApkZWxheWVkX3dvcmsn
cy4gVXNlIGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYyBpbnN0ZWFkLgoKVGhlIGNhbGxlciBtdXN0
IGVuc3VyZSB0aGF0IHRoZSB3b3JrcXVldWUgb24gd2hpY2ggd29yayB3YXMgbGFzdCBxdWV1ZWQg
CmNhbid0IGJlIGRlc3Ryb3llZCBiZWZvcmUgdGhpcyBmdW5jdGlvbiByZXR1cm5zLgpSZXR1cm4K
CnRydWUgaWYgd29yayB3YXMgcGVuZGluZywgZmFsc2Ugb3RoZXJ3aXNlLgoKVGhhbmtzIQpQZWku
CuWcqCAyMDI0LzEyLzMgMTQ6NDksIE11a2VzaCBLdW1hciBTYXZhbGl5YSDlhpnpgZM6Cj4gCj4g
Cj4gT24gMTEvMjgvMjAyNCA3OjI5IEFNLCBQZWkgWGlhbyB3cm90ZToKPj4gSW4gZHdfaTNjX2Nv
bW1vbl9wcm9iZSwgJm1hc3Rlci0+aGpfd29yayBpcyBib3VuZCB3aXRoCj4+IGR3X2kzY19oal93
b3JrLiBBbmQgZHdfaTNjX21hc3Rlcl9pcnFfaGFuZGxlciBjYW4gY2FsbAo+PiBkd19pM2NfbWFz
dGVyX2lycV9oYW5kbGVfaWJpcyBmdW5jdGlvbiB0byBzdGFydCB0aGUgd29yay4KPj4KPj4gSWYg
d2UgcmVtb3ZlIHRoZSBtb2R1bGUgd2hpY2ggd2lsbCBjYWxsIGR3X2kzY19jb21tb25fcmVtb3Zl
IHRvCj4+IG1ha2UgY2xlYW51cCwgaXQgd2lsbCBmcmVlIG1hc3Rlci0+YmFzZSB0aHJvdWdoIGkz
Y19tYXN0ZXJfdW5yZWdpc3Rlcgo+PiB3aGlsZSB0aGUgd29yayBtZW50aW9uZWQgYWJvdmUgd2ls
bCBiZSB1c2VkLiBUaGUgc2VxdWVuY2Ugb2Ygb3BlcmF0aW9ucwo+PiB0aGF0IG1heSBsZWFkIHRv
IGEgVUFGIGJ1ZyBpcyBhcyBmb2xsb3dzOgo+Pgo+PiBDUFUwwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQ1BV
MQo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGR3X2kzY19oal93b3JrCj4+IGR3X2kzY19jb21t
b25fcmVtb3ZlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAo+PiBpM2NfbWFzdGVy
X3VucmVnaXN0ZXIoJm1hc3Rlci0+YmFzZSkgfAo+PiBkZXZpY2VfdW5yZWdpc3RlcigmbWFzdGVy
LT5kZXYpwqDCoMKgwqDCoCB8Cj4+IGRldmljZV9yZWxlYXNlwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAo+PiAvL2ZyZWUgbWFzdGVyLT5iYXNlwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgaTNjX21h
c3Rlcl9kb19kYWEoJm1hc3Rlci0+YmFzZSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAvL3VzZSBt
YXN0ZXItPmJhc2UKPj4KPj4gRml4IGl0IGJ5IGVuc3VyaW5nIHRoYXQgdGhlIHdvcmsgaXMgY2Fu
Y2VsZWQgYmVmb3JlIHByb2NlZWRpbmcgd2l0aAo+PiB0aGUgY2xlYW51cCBpbiBkd19pM2NfY29t
bW9uX3JlbW92ZS4KPj4KPj4gRml4ZXM6IDFkZDcyOGY1ZDRkNCAoImkzYzogbWFzdGVyOiBBZGQg
ZHJpdmVyIGZvciBTeW5vcHN5cyBEZXNpZ25XYXJlIAo+PiBJUCIpCj4+IFNpZ25lZC1vZmYtYnk6
IFBlaSBYaWFvIDx4aWFvcGVpMDFAa3lsaW5vcy5jbj4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaTNj
L21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgfCAxICsKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1h
c3Rlci5jIAo+PiBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4gaW5kZXgg
OGQ2OTQ2NzJjMTEwLi5kYmNkMzk4NGYyNTcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTNjL21h
c3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1t
YXN0ZXIuYwo+PiBAQCAtMTYyNCw2ICsxNjI0LDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZHdfaTNj
X2NvbW1vbl9wcm9iZSk7Cj4+IMKgIHZvaWQgZHdfaTNjX2NvbW1vbl9yZW1vdmUoc3RydWN0IGR3
X2kzY19tYXN0ZXIgKm1hc3RlcikKPj4gwqAgewo+PiArwqDCoMKgIGNhbmNlbF93b3JrX3N5bmMo
Jm1hc3Rlci0+aGpfd29yayk7Cj4gWW91IHN0aWxsIG5lZWQgdG8gY2FwdHVyZSByZXR1cm4gYW5k
IGVuc3VyZSB0aGF0IHRoZSBwZW5kaW5nIHdvcmsgaXMgCj4gcmVhbGx5IGNvbXBsZXRlZCBvciBu
byBtb3JlIHBlbmRpbmcuCj4+IMKgwqDCoMKgwqAgaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCZtYXN0
ZXItPmJhc2UpOwo+PiDCoMKgwqDCoMKgIHBtX3J1bnRpbWVfZGlzYWJsZShtYXN0ZXItPmRldik7
Cj4gCj4gCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWkzYwo=
