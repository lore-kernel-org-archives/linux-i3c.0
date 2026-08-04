Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFA0C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 14:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1zvEuPlUI7HLP60hRGqNprLxs2VIq8Y60IYk0mqkMk=; b=mw96lZkiw4eOqO
	ar5a0mzPxZAjh1ahnVh2A+RSkR7uRDwHV2X5isB8zWNps3GTyMMNfyEfHpDgF7Oi/naI/StEiNY6Q
	FSg+0nXvR6Zb25ZNVg5hmV+LdUVsOj32kgrMjo1+SdDbaVw27N9Vl97n4ebudyR/yXIpoiTnmfbkA
	OXApMc8cd1Y8+p7wu3tzux30M8j7Xb/eKc5EFoAxWH7h2bJTaJ8lHb/pmhCBk+2Xx/3N6Slu7rhIn
	+xKcHqA5JR3zunsHUBoYCK9w45eDbzzQ7htge+XdCsdM+to9d/rPzjX/Ze5b6VOL6DGysEpkXxvej
	9RyuyqsY3LSMdmVkmIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrG85-000000025BS-021d;
	Tue, 04 Aug 2026 14:28:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrG84-000000025BH-2Gxd
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 14:28:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 312824011A;
	Tue,  4 Aug 2026 14:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE161F000E9;
	Tue,  4 Aug 2026 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785853707;
	bh=9ZZbAUDdkbkhQ6Bfhe4gIxp363KvKJ5EJ+Fv+MnmzPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AUj9gTIpThE3nedctiUFR87gOs1YVejcqrXW2J+7JWhM1vQHEmwj8sUEQfSiBiffu
	 8D7150OCAyunZ0or1/ZVcVtWkHk4ZRZSHrZRyGtklU0bG8Wy6B1mIgSUEP1FzKRGvC
	 3GfC3Z5l09r0JH6fih3gviSDIl7kLRfNnEX+FKiEqNabUJZnWFkWikhY2IRadHageO
	 FKIe/53M99h8fefQjSdWQQtL/8ViuiVNZmC0kkgC0YfmgswyAd0ZL/wDcDgtLsnIZv
	 yD9g/lenaY6dsOvsfyag3KSWg7n9r5TeTjOdXFV98Y6zlmESXjSUFDN3ZrPFoz/wxo
	 E2IbzQ6ATnt/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 11/14] i3c: master: Reject IBI requests from
 non-IBI-capable devices
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260804133810.184905-12-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-12-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 14:28:26 +0000
Message-Id: <20260804142826.BBE161F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBUaGUgd29ya3F1ZXVlIGBpYmktPndxYCBpcyBsZWFrZWQgb24gdGhlIGVycm9yIHBh
dGggaWYgYG1hc3Rlci0+b3BzLT5yZXF1ZXN0X2liaShkZXYsIHJlcSlgIGZhaWxzLgotLQoKLS0t
IFBhdGNoIFsxMV06IFtQQVRDSCBWMyAxMS8xNF0gaTNjOiBtYXN0ZXI6IFJlamVjdCBJQkkgcmVx
dWVzdHMgZnJvbSBub24tSUJJLWNhcGFibGUgZGV2aWNlcyAtLS0KY29tbWl0IGE0YWNlODk3MDZl
ZGJjMzIxOWZlY2U0M2FhZWY0ZDNjM2U1OTQxNDgKQXV0aG9yOiBBZHJpYW4gSHVudGVyIDxhZHJp
YW4uaHVudGVyQGludGVsLmNvbT4KCmkzYzogbWFzdGVyOiBSZWplY3QgSUJJIHJlcXVlc3RzIGZy
b20gbm9uLUlCSS1jYXBhYmxlIGRldmljZXMKClRoaXMgY29tbWl0IHVwZGF0ZXMgaTNjX2Rldmlj
ZV9yZXF1ZXN0X2liaSgpIHRvIHZlcmlmeSB0aGF0IGEgZGV2aWNlCmFkdmVydGlzZXMgSUJJIHN1
cHBvcnQgYmVmb3JlIGF0dGVtcHRpbmcgdG8gc2V0IHVwIElCSSBoYW5kbGluZy4gSWYgdGhlCmRl
dmljZSBsYWNrcyB0aGUgSTNDX0JDUl9JQklfUkVRX0NBUCBjYXBhYmlsaXR5LCBpdCBub3cgcmV0
dXJucyBlYXJseQp3aXRoIC1FT1BOT1RTVVBQLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
ZGV2aWNlLmMgYi9kcml2ZXJzL2kzYy9kZXZpY2UuYwo+IGluZGV4IDVlNmRmNmRlMDI4MzQuLmYx
YmEzNjNiMjJhMTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvZGV2aWNlLmMKPiArKysgYi9k
cml2ZXJzL2kzYy9kZXZpY2UuYwo+IEBAIC0yMDQsMTIgKzIwNCwxNCBAQCBpbnQgaTNjX2Rldmlj
ZV9yZXF1ZXN0X2liaShzdHJ1Y3QgaTNjX2RldmljZSAqZGV2LAo+ICAJCXJldHVybiByZXQ7Cj4g
IAo+ICAJaTNjX2J1c19ub3JtYWx1c2VfbG9jayhkZXYtPmJ1cyk7Cj4gLQlpZiAoZGV2LT5kZXNj
KSB7Cj4gKwlpZiAoIWRldi0+ZGVzYykgewo+ICsJCXJldCA9IC1FTk9FTlQ7Cj4gKwl9IGVsc2Ug
aWYgKCEoZGV2LT5kZXNjLT5pbmZvLmJjciAmIEkzQ19CQ1JfSUJJX1JFUV9DQVApKSB7Cj4gKwkJ
cmV0ID0gLUVPUE5PVFNVUFA7Cj4gKwl9IGVsc2Ugewo+ICAJCW11dGV4X2xvY2soJmRldi0+ZGVz
Yy0+aWJpX2xvY2spOwo+ICAJCXJldCA9IGkzY19kZXZfcmVxdWVzdF9pYmlfbG9ja2VkKGRldi0+
ZGVzYywgcmVxKTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1
ZSwgYnV0IHNpbmNlIHRoaXMgcGF0Y2ggaW50ZXJhY3RzIGNsb3NlbHkgd2l0aCBJQkkKcmVxdWVz
dCBlcnJvciBoYW5kbGluZywgSSBub3RpY2VkIGEgcG90ZW50aWFsIHJlc291cmNlIGxlYWsgaW4g
dGhlIHVuZGVybHlpbmcKaTNjX2Rldl9yZXF1ZXN0X2liaV9sb2NrZWQoKSBmdW5jdGlvbi4KCkRv
ZXMgdGhpcyBjb2RlIGxlYWsgdGhlIG5ld2x5IGFsbG9jYXRlZCB3b3JrcXVldWUgaWYgdGhlIHJl
cXVlc3QgZmFpbHM/Cgpkcml2ZXJzL2kzYy9tYXN0ZXIuYzppM2NfZGV2X3JlcXVlc3RfaWJpX2xv
Y2tlZCgpIHsKICAgIC4uLgogICAgaWJpLT53cSA9IGFsbG9jX29yZGVyZWRfd29ya3F1ZXVlKGRl
dl9uYW1lKGkzY2Rldl90b19kZXYoZGV2LT5kZXYpKSwgV1FfTUVNX1JFQ0xBSU0pOwogICAgLi4u
CiAgICByZXQgPSBtYXN0ZXItPm9wcy0+cmVxdWVzdF9pYmkoZGV2LCByZXEpOwogICAgaWYgKHJl
dCkgewogICAgICAgIGtmcmVlKGliaSk7CiAgICAgICAgZGV2LT5pYmkgPSBOVUxMOwogICAgfQog
ICAgCiAgICByZXR1cm4gcmV0Owp9CgpTaG91bGQgZGVzdHJveV93b3JrcXVldWUoaWJpLT53cSkg
YmUgY2FsbGVkIGJlZm9yZSBrZnJlZShpYmkpIG9uIHRoaXMgZXJyb3IKcGF0aCB0byBwcmV2ZW50
IGxlYWtpbmcgdGhlIHdvcmtxdWV1ZSBpZiBhIGRyaXZlciByZXBlYXRlZGx5IGZhaWxzIHRvIHJl
cXVlc3QKYW4gSUJJPwoKPiAgCQltdXRleF91bmxvY2soJmRldi0+ZGVzYy0+aWJpX2xvY2spOwo+
IC0JfSBlbHNlIHsKPiAtCQlyZXQgPSAtRU5PRU5UOwo+ICAJfQo+ICAJaTNjX2J1c19ub3JtYWx1
c2VfdW5sb2NrKGRldi0+YnVzKTsKPgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgwNDEzMzgxMC4xODQ5MDUtMS1hZHJpYW4uaHVu
dGVyQGludGVsLmNvbT9wYXJ0PTExCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
