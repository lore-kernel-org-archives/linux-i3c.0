Return-Path: <SRS0=i7vZ=K6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E71C4743D
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Jun 2021 20:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3367613FF
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Jun 2021 20:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3367613FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71Sz125LozUXmb0LAnWoptHFbb54tnr/2jFgTP9ml/0=; b=CUMjq5r+YoknBmkHLVZyv3Wf38
	1Q8IsU7KQcwXTrIVfYXOm0nsEm1gWk/H7vc1fNwOXmklObOaKMsoIQ+NrMrBS9yvbU6T6RnVpmAu5
	uZjQ54U4cF1Mu5zB3jep6HYdFGjPSiFi71DErZ3HgWL2B5yAzBPFrrsYASwQ/cYVAQsMqodnb3GaO
	W3Z6j1Lr1/dI3qH9GGKyCDW7gbpKYsXWy3wV2NDPyWxRXvRZO8MYrGprLYfqKfo+R8OfUqDnNsGpL
	ntmDvCYIQOu5lOJw2AMprASWw8NaMcSumUYHvl8bxPMIcMgzmVzQebhY7QCcSFEyGin983MGyNsBM
	eeEjxUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpGkS-00FAYN-56; Fri, 04 Jun 2021 20:48:56 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmGOo-006Qur-BR
 for linux-i3c@lists.infradead.org; Thu, 27 May 2021 13:50:12 +0000
Received: from dggeml710-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FrTcZ4xJFz66BM;
 Thu, 27 May 2021 21:46:22 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggeml710-chm.china.huawei.com (10.3.17.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 27 May 2021 21:50:00 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpeml500017.china.huawei.com (7.185.36.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 21:49:54 +0800
Subject: Re: [PATCH -next] i3c: master: svc: drop free_irq of devm_request_irq
 allocated irq
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
 <alexandre.belloni@bootlin.com>
References: <20210518131127.1308550-1-yangyingliang@huawei.com>
 <20210527120123.75f2ea09@xps13>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <7052d19a-54cb-d634-f195-dbd8ef37f1e7@huawei.com>
Date: Thu, 27 May 2021 21:49:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210527120123.75f2ea09@xps13>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_065011_051130_06C9653E 
X-CRM114-Status: GOOD (  13.37  )
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

SGksCgpPbiAyMDIxLzUvMjcgMTg6MDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgWWFuZywK
Pgo+IFlhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+IHdyb3RlIG9uIFR1
ZSwgMTggTWF5IDIwMjEKPiAyMToxMToyNyArMDgwMDoKPgo+PiBpcnEgYWxsb2NhdGVkIHdpdGgg
ZGV2bV9yZXF1ZXN0X2lycSBzaG91bGQgbm90IGJlIGZyZWVkIHVzaW5nCj4+IGZyZWVfaXJxLCBi
ZWNhdXNlIGRvaW5nIHNvIGNhdXNlcyBhIGRhbmdsaW5nIHBvaW50ZXIsIGFuZCBhCj4+IHN1YnNl
cXVlbnQgZG91YmxlIGZyZWUuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lA
aHVhd2VpLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlh
bmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFz
dGVyLmMgfCAyICstCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0
ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4+IGluZGV4IDFmNmJh
NDIyMTgxNy4uNzYxYzljNDY4MzU3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIv
c3ZjLWkzYy1tYXN0ZXIuYwo+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0
ZXIuYwo+PiBAQCAtMTQ0OCw3ICsxNDQ4LDcgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAJaWYgKHJldCkKPj4gICAJ
CXJldHVybiByZXQ7Cj4+ICAgCj4+IC0JZnJlZV9pcnEobWFzdGVyLT5pcnEsIG1hc3Rlcik7Cj4+
ICsJZGV2bV9mcmVlX2lycSgmcGRldi0+ZGV2LCBtYXN0ZXItPmlycSwgbWFzdGVyKTsKPiBXb3Vs
ZG4ndCByZW1vdmluZyB0aGlzIGNhbGwgdGhlIHJpZ2h0IHNvbHV0aW9uPyBJZiBpdCdzIGEgZGV2
aWNlCj4gbWFuYWdlZCByZXNvdXJjZSwgaXQgd29uJ3QgcHJvYmFibHkgYmUgbmVlZGVkIHRvIGZy
ZWUgaXQgZXhwbGljaXRseSBpbgo+IHRoZSByZW1vdmUgcGF0aC4KU29tZSBkcml2ZXJzIHdvdWxk
IGV4cGVjdCB0byBmcmVlIGlycSBpdHNlbGYsIEkgYW0gbm90IHN1cmUgaWYgaXQncyBvayAKdG8g
cmVtb3ZlCnRoZSBmcmVlX2lycSgpIGluIGkzYywgSSBqdXN0IGtlZXAgdGhlIG9yaWdpbmFsIGxv
Z2ljIGhlcmUgYW5kIGF2b2lkIApkb3VibGUgZnJlZS4KClRoYW5rcywKWWFuZwo+Cj4+ICAgCWNs
a19kaXNhYmxlX3VucHJlcGFyZShtYXN0ZXItPnBjbGspOwo+PiAgIAljbGtfZGlzYWJsZV91bnBy
ZXBhcmUobWFzdGVyLT5mY2xrKTsKPj4gICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1hc3Rlci0+
c2Nsayk7Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAuCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlz
dApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
