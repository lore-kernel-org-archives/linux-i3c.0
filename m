Return-Path: <SRS0=i7vZ=K6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AE0C48BC2
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Jun 2021 20:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C342161403
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Jun 2021 20:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C342161403
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdNxb0qT+M4dtBxo9K6cg8IecSDX/U8mwzJdETH0hB4=; b=E/4JsKIelJhqD5DBU6Wya+9QLz
	CTpoPyDiqSz9sH1Ms6b/Rqshuif6eUykoqZgb/gxp0Qb2fxPBsXDyaNZPH8pCNnlbcYprIBoGzu93
	1vvjdX3LHSkeuIyYCBfXdvzDW8+0aQlDD9jbpL4+tD1wYbRoxRBwG5EmZ9VuvCxVW8Eez/wN9n38o
	ppPNonL0dQ58Ypk+Cplge59lmRKa07az4jvW0CWrxsU/e0uED1HsZke1PR3Hc/WuUn38JXBkGtHCK
	WAOEsbFmHBW5R/qxFCK+6aGG+gkIspAan66GvaeBLKadxnro6WCdtojQOhC50gE9t0uTZlpKr7PBX
	MDe8Mf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpGkS-00FAYT-9K; Fri, 04 Jun 2021 20:48:56 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmRXj-00B36i-0X
 for linux-i3c@lists.infradead.org; Fri, 28 May 2021 01:44:08 +0000
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FrnTW2h19zYnQX;
 Fri, 28 May 2021 09:41:19 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggeml756-chm.china.huawei.com (10.1.199.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 09:43:59 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpeml500017.china.huawei.com (7.185.36.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 28 May 2021 09:43:59 +0800
Subject: Re: [PATCH -next] i3c: master: svc: drop free_irq of devm_request_irq
 allocated irq
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
 <alexandre.belloni@bootlin.com>
References: <20210518131127.1308550-1-yangyingliang@huawei.com>
 <20210527120123.75f2ea09@xps13>
 <7052d19a-54cb-d634-f195-dbd8ef37f1e7@huawei.com>
 <20210527164058.3c9145b2@xps13>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <7912f44a-39ea-928c-8b51-6b8967588abd@huawei.com>
Date: Fri, 28 May 2021 09:43:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210527164058.3c9145b2@xps13>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_184407_440627_FD4B8603 
X-CRM114-Status: GOOD (  23.85  )
X-Mailman-Approved-At: Fri, 04 Jun 2021 13:48:54 -0700
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

Ck9uIDIwMjEvNS8yNyAyMjo0MCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBZYW5nLAo+Cj4g
WWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4gd3JvdGUgb24gVGh1LCAy
NyBNYXkgMjAyMQo+IDIxOjQ5OjUzICswODAwOgo+Cj4+IEhpLAo+Pgo+PiBPbiAyMDIxLzUvMjcg
MTg6MDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBIaSBZYW5nLAo+Pj4KPj4+IFlhbmcgWWlu
Z2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+IHdyb3RlIG9uIFR1ZSwgMTggTWF5IDIw
MjEKPj4+IDIxOjExOjI3ICswODAwOgo+Pj4gICAKPj4+PiBpcnEgYWxsb2NhdGVkIHdpdGggZGV2
bV9yZXF1ZXN0X2lycSBzaG91bGQgbm90IGJlIGZyZWVkIHVzaW5nCj4+Pj4gZnJlZV9pcnEsIGJl
Y2F1c2UgZG9pbmcgc28gY2F1c2VzIGEgZGFuZ2xpbmcgcG9pbnRlciwgYW5kIGEKPj4+PiBzdWJz
ZXF1ZW50IGRvdWJsZSBmcmVlLgo+Pj4+Cj4+Pj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1
bGtjaUBodWF3ZWkuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWWluZ2xpYW5nIDx5YW5n
eWluZ2xpYW5nQGh1YXdlaS5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAgZHJpdmVycy9pM2MvbWFzdGVy
L3N2Yy1pM2MtbWFzdGVyLmMgfCAyICstCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
bWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0
ZXIuYwo+Pj4+IGluZGV4IDFmNmJhNDIyMTgxNy4uNzYxYzljNDY4MzU3IDEwMDY0NAo+Pj4+IC0t
LSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4+Pj4gKysrIGIvZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPj4+PiBAQCAtMTQ0OCw3ICsxNDQ4LDcgQEAg
c3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPj4+PiAgICAJaWYgKHJldCkKPj4+PiAgICAJCXJldHVybiByZXQ7Cj4+Pj4gICAgPj4g
LQlmcmVlX2lycShtYXN0ZXItPmlycSwgbWFzdGVyKTsKPj4+PiArCWRldm1fZnJlZV9pcnEoJnBk
ZXYtPmRldiwgbWFzdGVyLT5pcnEsIG1hc3Rlcik7Cj4+PiBXb3VsZG4ndCByZW1vdmluZyB0aGlz
IGNhbGwgdGhlIHJpZ2h0IHNvbHV0aW9uPyBJZiBpdCdzIGEgZGV2aWNlCj4+PiBtYW5hZ2VkIHJl
c291cmNlLCBpdCB3b24ndCBwcm9iYWJseSBiZSBuZWVkZWQgdG8gZnJlZSBpdCBleHBsaWNpdGx5
IGluCj4+PiB0aGUgcmVtb3ZlIHBhdGguCj4+IFNvbWUgZHJpdmVycyB3b3VsZCBleHBlY3QgdG8g
ZnJlZSBpcnEgaXRzZWxmLAo+IEkgZG9uJ3QgZ2V0IGl0LiBEcml2ZXJzIGRvIG5vdCBleHBlY3Qg
YW55dGhpbmcsIHRoZXkgc2hvdWxkIGp1c3QgY29tcGx5Cj4gd2l0aCB0aGUgQVBJLiBJZiByb2Jv
dHMgY29tcGxhaW4gYmVjYXVzZSBhIGRldmljZSBtYW5hZ2VkIHJlc291cmNlIGlzCj4gYmVpbmcg
ZnJlZWQgd2l0aG91dCB0aGUgZGV2aWNlIG1hbmFnZWQgaGVscGVyLCB0aGlzIGRvZXMgbm90IG1l
YW4gdGhhdAo+IHRoZSByZXNvdXJjZSBzaG91bGQgZXhwbGljaXRseSBiZSBmcmVlZCwgaXQganVz
dCBtZWFucyB0aGF0ICppZiogaXQKPiBtdXN0IGJlIGV4cGxpY2l0bHkgZnJlZWQsIHRoZSB3cm9u
ZyBoZWxwZXIgaXMgYmVpbmcgdXNlZC4KPgo+PiBJIGFtIG5vdCBzdXJlIGlmIGl0J3Mgb2sgdG8g
cmVtb3ZlIHRoZSBmcmVlX2lycSgpIGluIGkzYywKPiBXaGF0IGlzIHRoZSBsaW5rIHdpdGggSTND
PyBTb3JyeSBJIG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nIGJ1dAo+IG1hc3Rlci0+aXJxIGlz
IGEgZHJpdmVyIHZhcmlhYmxlLCBJIGRvbid0IGdldCB0aGUgbGluayB3aXRoIHRoZSBJM0MKPiBm
cmFtZXdvcmsgYW5kIHdoeSBpdCB3b3VsZCBpbnRlcmZlcmUuCj4KPj4gSSBqdXN0IGtlZXAgdGhl
IG9yaWdpbmFsIGxvZ2ljIGhlcmUgYW5kIGF2b2lkIGRvdWJsZSBmcmVlLgo+IEkgZG9uJ3QgdGhp
bmsgaXQgaXMgc2FuZS4gQ2FsbGluZyBkZXZtX2ZyZWVfaXJxKCkgbWF5YmUgaXMgdGhlIHJpZ2h0
Cj4gc29sdXRpb24gLSBJIGRvbid0IGZlZWwgbGlrZSBpdCBpcyAtIGJ1dCB5b3VyIGNlcnRhaW5s
eSBjYW4ndCBoaWRlCj4gYmVoaW5kIGEgJ0kganVzdCB3YW50IHRoZSByb2JvdHMgdG8gYmUgaGFw
cHknIGp1c3RpZmljYXRpb24uIEhpZGluZwo+IGJ1Z3Mgb24gcHVycG9zZSBpcyBub3Qgc29tZXRo
aW5nIHRoYXQgSSBwZXJzb25hbGx5IGFwcHJlY2lhdGUgbXVjaC4KRnJlZWluZyBpcnEgaW4gLT5y
ZW1vdmUoKSBpcyBlYXJsaWVyIHRoYW4gaW4gZGV2aWNlIG1hbmFnZSBmcmFtZXdvcmssIGlmCmp1
c3QgcmVtb3ZlIHRoZSBmcmVlX2lycSgpIGluIHN2Y19pM2NfbWFzdGVyX3JlbW92ZSgpIGFuZCBm
cmVlIHRoZSBpcnEgYnkKZGV2aWNlIG1hbmFnZSBmcmFtZXdvcmssIEkgYW0gbm90IHN1cmUgaWYg
aXQgYnJlYWtzIHRoZSByZXNvdXJjZSBmcmVlCnNlcXVlbmNlIGluIFNpbHZhY28gSTNDIG1hc3Rl
ciBkcml2ZXIuIElmIGl0J3MgT0ssIEkgY2FuIHJlc2VuZCBhIHBhdGNoIHdpdGgKcmVtb3Zpbmcg
dGhlIGZyZWVfaXJxKCkuCgpUaGFua3MsCllhbmcKPgo+IFRoYW5rcywKPiBNaXF1w6hsCj4gLgoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
